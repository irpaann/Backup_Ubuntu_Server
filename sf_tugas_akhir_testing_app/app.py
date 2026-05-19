
import os
import socket
import requests
from flask import Flask, request, render_template,g
from extensions import db
from models.rule_engine import check_rule_based
from urllib.parse import unquote
from werkzeug.middleware.proxy_fix import ProxyFix

# Import Blueprints
from routes.auth import auth
from routes.product import product
from routes.user import user
from routes.search import search
from routes.api import api


app = Flask(__name__)
app.wsgi_app = ProxyFix(app.wsgi_app, x_for=1, x_host=1)

# ==========================================
# 1. KONFIGURASI (Environment & Variables)
# ==========================================
app.secret_key = os.getenv("SECRET_KEY", "dev-secret-key")
app.config['UPLOAD_FOLDER'] = "uploads"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Deteksi Lingkungan (Docker vs Windows/Local)
IS_DOCKER = os.getenv("IS_DOCKER", "false").lower() == "true"

if IS_DOCKER:
    # Konfigurasi Docker
    MONITORING_URL = "http://ml_engine:5000/log"
    CHECK_IP_URL = "http://ml_engine:5000/api/blacklist/check"
    app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+pymysql://root:root@db/webtesting"
else:
    # Konfigurasi Windows / Local Development
    HOST_IP = socket.gethostbyname(socket.gethostname())
    MONITORING_URL = f"http://127.0.0.1:3000/log"
    CHECK_IP_URL = f"http://127.0.0.1:3000/api/blacklist/check"
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/webtesting'

# Inisialisasi Database
db.init_app(app)

# ==========================================
# 2. REGISTRASI BLUEPRINTS
# ==========================================
app.register_blueprint(auth)
app.register_blueprint(product)
app.register_blueprint(user)
app.register_blueprint(search)
app.register_blueprint(api)

# ==========================================
# 3. MIDDLEWARE (Security & Logging)
# ==========================================
@app.before_request
def security_filter():
    # 1. Abaikan file statis
    if request.path.startswith('/static'):
        return

    client_ip = request.remote_addr
    
    # --- INISIALISASI DATA KEAMANAN KE OBJEK 'g' ---
    # Ini penting agar data bisa "dioper" ke fungsi log_final_status (after_request)
    args_str = request.query_string.decode('utf-8', errors='ignore')
    form_str = "&".join([f"{k}={v}" for k, v in request.form.items()])
    data_str = request.get_data(as_text=True)
    raw_payload = " ".join([p for p in [args_str, form_str, data_str] if p]).strip()
    decoded_payload = unquote(raw_payload) if raw_payload else ""

    g.security_data = {
        "ip": client_ip,
        "url": request.path,
        "full_url": request.url,
        "method": request.method,
        "payload": decoded_payload,
        "ua": request.headers.get("User-Agent", "-"),
        "threat_score": 0,  # Akan diupdate di Langkah B
        "reason": "Normal"  # Akan diupdate di Langkah B
    }

    # ==========================================================
    # LANGKAH A: CEK APAKAH IP INI SUDAH MASUK DAFTAR BLACKLIST
    # ==========================================================
    try:
        check_ip = requests.get(f"{CHECK_IP_URL}?ip={client_ip}", timeout=0.5)
        if check_ip.status_code == 200:
            status_data = check_ip.json()
            if status_data.get("is_blocked"):
                reason = status_data.get("reason", "IP dalam daftar hitam")
                
                # Update status untuk dikirim ke log sebelum di-block
                g.security_data["reason"] = reason
                g.security_data["status"] = 403
                try:
                    requests.post(MONITORING_URL, json=g.security_data, timeout=0.5)
                except: pass
                
                return render_template('blocked.html', reason=reason), 403
    except Exception as e:
        app.logger.error(f"Gagal cek status blacklist: {e}")

    # ==========================================================
    # LANGKAH B: SCREENING PAYLOAD (Jika IP belum di-blacklist)
    # ==========================================================
    SCREENING_URL = MONITORING_URL.replace("/log", "/api/screen") 
    
    try:
        # Gunakan data dari g.security_data agar konsisten
        check_response = requests.post(SCREENING_URL, json=g.security_data, timeout=0.8)
        if check_response.status_code == 200:
            result = check_response.json()
            
            # SIMPAN HASIL SCREENING KE 'g' (Sangat Penting untuk Dashboard)
            g.security_data["threat_score"] = result.get("threat_score", 0)
            g.security_data["reason"] = result.get("reason", "Normal")

            if result.get("action") == "BLOCK":
                # Update status menjadi 403 dan kirim log sebelum memblokir
                g.security_data["status"] = 403
                try:
                    requests.post(MONITORING_URL, json=g.security_data, timeout=0.5)
                except: pass
                
                return render_template('blocked.html', reason=result.get("reason")), 403
    except Exception as e:
        app.logger.error(f"Security Engine Connection Error: {e}")

# ==========================================================
# FUNGSI PENCATATAN FINAL (Mencegah Duplikasi & Mengambil Status Asli)
# ==========================================================
@app.after_request
def log_final_status(response):
    # Jangan catat jika file statis atau jika sudah dicatat saat 403 di atas
    if request.path.startswith('/static') or response.status_code == 403:
        return response
    
    # Kirim log dengan status code asli (200, 401, 302, dll)
    if hasattr(g, 'security_data'):
        log_payload = g.security_data
        log_payload["status"] = response.status_code 
        
        try:
            # Kirim data final ke endpoint /log dashboard
            requests.post(MONITORING_URL, json=log_payload, timeout=0.5)
        except:
            pass
            
    return response
# ==========================================
# 4. CLI COMMANDS & RUNNER
# ==========================================

@app.cli.command("init-db")
def init_db():
    """Command untuk inisialisasi database: 'flask init-db'"""
    with app.app_context():
        db.create_all()
    print("Database Berhasil Diinisialisasi!")

if __name__ == "__main__":
    os.makedirs(app.config['UPLOAD_FOLDER'], exist_ok=True)
    with app.app_context():
        db.create_all()
    app.run(host="0.0.0.0", port=5000, debug=True)
