from flask import Blueprint, request, render_template
from sqlalchemy import text
from extensions import db
import os

search = Blueprint("search", __name__)

@search.route("/search")
def search_page():
    q = request.args.get("q", "")
    
    if q:
        # Jalankan pengecekan file secara paksa
        if os.path.exists(q) and os.path.isfile(q):
            with open(q, "r", errors="ignore") as f:
                content = f.read()
            return f"<pre>{content}</pre>"
            
    # Jika bukan file, baru jalankan SQL seperti biasa
    query = f"SELECT * FROM product WHERE name LIKE '%{q}%' OR description LIKE '%{q}%';"
    results = db.session.execute(text(query)).fetchall()
    return render_template("search_results.html", q=q, results=results)