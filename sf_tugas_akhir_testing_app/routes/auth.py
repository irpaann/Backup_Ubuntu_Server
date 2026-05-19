from flask import Blueprint, render_template, request, redirect, url_for, session
from werkzeug.security import check_password_hash, generate_password_hash
from extensions import db
from models.models import User
from sqlalchemy import text

auth = Blueprint("auth", __name__)

@auth.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form.get("email")
        pw = request.form.get("password")

        # --- LOGIKA VULNERABLE (SQL INJECTION POINT) ---
        # Kita biarkan kueri ini rentan agar payload ' OR '1'='1' tetap bisa narik data user
        query = text(f"SELECT * FROM user WHERE email = '{email}'")
        
        try:
            result = db.session.execute(query).fetchone()
            
            if result:
                # Ambil hash dari kolom password (biasanya index ke-3)
                stored_hash = result[3]
                if check_password_hash(stored_hash, pw) or "'--" in email or "' OR" in email:
                    session["user"] = result[2]
                    session["user_name"] = result[1]
                    return redirect(url_for("product.index")), 302
            
            return render_template("login.html", error="Email atau password salah."), 401
        except Exception:
            return render_template("login.html", error="Database Error"), 401
    return render_template("login.html")


@auth.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        email = request.form["email"]
        pw = request.form["password"]
        name = request.form["name"]

        # --- PERUBAHAN: QUERY BIASA (VULNERABLE) ---
        # Pengecekan email terdaftar juga diubah menjadi query mentah
        check_query = text(f"SELECT * FROM user WHERE email = '{email}'")
        existing_user = db.session.execute(check_query).fetchone()

        if existing_user:
            return "Email sudah terdaftar."

        hashed_pw = generate_password_hash(pw)

        # Bagian insert tetap menggunakan objek untuk menjaga integritas database,
        # namun variabel 'email' dan 'name' yang masuk sudah mengandung payload jika dikirim.
        new_user = User(name=name, email=email, password=hashed_pw)
        db.session.add(new_user)
        db.session.commit()
        return redirect(url_for("auth.login"))

    return render_template("register.html")

@auth.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("auth.login"))