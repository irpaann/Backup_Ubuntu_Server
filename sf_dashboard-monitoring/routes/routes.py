from flask import render_template, session, redirect, url_for, request, jsonify

def register_routes(app):
    
    # Dashboard Utama
    @app.route("/")
    @app.route("/dashboard") # Tambahkan ini agar URL /dashboard juga jalan
    def dashboard(): # Nama fungsi: dashboard
        if not session.get("logged_in"):
            return redirect(url_for("login_page"))
        return render_template("pages/dashboard.html")
    
    @app.route("/logs")
    def logs():
        if not session.get("logged_in"):
            return redirect(url_for("login_page"))
        return render_template("pages/logs.html")

    @app.route("/blacklist")
    def block_ip():
        if not session.get("logged_in"):
            return redirect(url_for("login_page"))
        return render_template("pages/blacklist.html")

    @app.route("/login")
    def login_page():
        # Perhatikan: Gunakan url_for("dashboard") bukan dashboard_page
        if session.get("logged_in"):
            return redirect(url_for("dashboard")) 
        return render_template("pages/login.html")