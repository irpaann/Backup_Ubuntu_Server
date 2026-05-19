import os
import logging
from flask import Flask, request, abort, render_template
from db import close_db, init_db_command, get_db
from dotenv import load_dotenv
from werkzeug.middleware.proxy_fix import ProxyFix 

# Import Business Logic
from routes.routes import register_routes
from routes.api import register_api
from models.rule_engine import check_rule_based

load_dotenv()

app = Flask(__name__)
app.wsgi_app = ProxyFix(app.wsgi_app, x_for=1, x_host=1)
app.secret_key = os.getenv("SECRET_KEY", "default_secret_key")
# log = logging.getLogger('werkzeug')
# log.setLevel(logging.ERROR)

# ==========================================
# 1. KONFIGURASI & INISIALISASI
# ==========================================
app.teardown_appcontext(close_db)
init_db_command(app)

@app.errorhandler(403)
def forbidden(e):
    """Handler khusus untuk menampilkan halaman blokir."""
    return render_template('pages/blocked.html', reason=e.description), 403

# ==========================================
# 2. MIDDLEWARE (Security Filter)
# ==========================================
@app.before_request
def security_filter():
    path = request.path
    
    # 1. STRATEGI BYPASS PATH
    safe_zones = ['/dashboard', '/static', '/api']
    
    if any(path.startswith(zone) for zone in safe_zones):
        return 

    # 2. Ambil IP (SANGAT SIMPEL karena sudah pakai ProxyFix)
    # Gunakan ini agar IP yang didapat adalah IP tunggal yang bersih
    client_ip = request.remote_addr

    # 3. Cek Database Blacklist
    db = get_db()
    blocked = db.execute("""
        SELECT reason FROM blacklist_ip 
        WHERE ip = ? AND is_active = 1 
        AND expires_at > DATETIME('now', '+8 hours')
    """, (client_ip,)).fetchone()
    
    if blocked:
        abort(403, description=blocked['reason'])

        
# ==========================================
# 3. REGISTER ROUTES & RUNNER
# ==========================================

register_routes(app)
register_api(app)

if __name__ == "__main__":
    # Pastikan host 0.0.0.0 agar bisa diakses oleh aplikasi user (Web Testing)
    app.run(host="0.0.0.0", port=5000, debug=True)
