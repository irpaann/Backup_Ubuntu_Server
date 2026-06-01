from flask import app, request, jsonify, session, redirect, url_for, make_response
from models.rule_engine import check_rule_based
from datetime import datetime, timedelta
from utils.security_engine import SecurityEngine
from db import get_db
from markupsafe import escape
import os
import io
import csv


engine = SecurityEngine()
def register_api(app):
    
    # ============================================================
    # 2. HELPER: PROSES BLACKLIST (VERSI PANJANG)
    # Fungsi ini ditaruh di sini agar bisa digunakan oleh /api/screen
    # ============================================================
    def _process_blacklist(client_ip, attack_type):
        
        db = get_db()
        db.execute("UPDATE blacklist_ip SET is_active = 0 WHERE is_active = 1 AND expires_at < DATETIME('now', '+8 hours')")
        
        history = db.execute("SELECT total_hits FROM blacklist_ip WHERE ip = ? ORDER BY id DESC LIMIT 1", (client_ip,)).fetchone()
        violation_count = (history["total_hits"] + 1) if history else 1
        
        # Konsisten gunakan detik (10s, 20s, 30s...)
        base_seconds = 10
        total_duration = base_seconds * violation_count

        existing = db.execute("SELECT id FROM blacklist_ip WHERE ip = ? AND is_active = 1", (client_ip,)).fetchone()

        if not existing:
            db.execute(f"""
                INSERT INTO blacklist_ip (ip, reason, blocked_at, expires_at, blocked_by, is_active, total_hits, last_seen)
                VALUES (?, ?, DATETIME('now','+8 hours'), DATETIME('now','+8 hours', '+{total_duration} seconds'), 'ML-System', 1, ?, DATETIME('now','+8 hours'))
            """, (client_ip, attack_type, violation_count))
        else:
            db.execute(f"UPDATE blacklist_ip SET total_hits = total_hits + 1, last_seen = DATETIME('now','+8 hours'), expires_at = DATETIME(expires_at, '+{base_seconds} seconds') WHERE ip = ? AND is_active = 1", (client_ip,))
        db.commit()
        return total_duration
    
    @app.route("/api/screen", methods=["POST"])
    def api_screen():
        data = request.get_json()
        client_ip = data.get("ip")
        
        # 1. PERBAIKAN PATH: Ambil full_url agar parameter ?q=... tidak terpotong
        path = data.get("full_url", data.get("url", "")) 
        
        payload = data.get("payload", "")
        ua = data.get("ua", "")
        method = data.get("method", "GET")

        # 2. PERBAIKAN FAVICON: Mencegah double hit dari browser
        if "favicon.ico" in str(path):
            return jsonify({"action": "ALLOW", "threat_score": 0}), 200

        db = get_db()

        # 3. PERBAIKAN EARLY DROP: Cek apakah IP sudah diblokir?
        blocked_ip = db.execute(
            "SELECT reason FROM blacklist_ip WHERE ip = ? AND is_active = 1 AND expires_at > DATETIME('now', '+8 hours')",
            (client_ip,)
        ).fetchone()

        if blocked_ip:
            # LANGSUNG KELUAR! Hemat CPU ML dan biarkan /log yang mengurus penambahan hit.
            return jsonify({"action": "BLOCK", "reason": blocked_ip["reason"], "threat_score": 100}), 200

        last_log = db.execute("SELECT timestamp FROM logs WHERE ip = ? ORDER BY id DESC LIMIT 1", (client_ip,)).fetchone()

        # ==========================================================
        # 🛠️ ANTI FALSE-POSITIVE FIX
        # Default aman: 5.0 detik (Kecepatan wajar manusia)
        # ==========================================================
        time_diff = 5.0 
        
        if last_log:
            try:
                last_time = datetime.strptime(last_log["timestamp"], "%Y-%m-%d %H:%M:%S")
                current_time = datetime.now()
                calculated_diff = (current_time - last_time).total_seconds()
                
                if 0.0 < calculated_diff <= 30.0:
                    time_diff = calculated_diff
                else:
                    time_diff = 5.0 
                    
            except Exception as e:
                time_diff = 5.0

        # Panggil Security Engine
        status, reason, threat_score = engine.analyze(
            path=path, 
            ip=client_ip, 
            payload=payload, 
            ua=ua, 
            method=method, 
            time_diff=time_diff
        )

        if status == "Attack":
            # 4. PERBAIKAN FATAL: _process_blacklist dihapus dari sini!
            # Ini memastikan serangan pertama tetap lolos ke /log untuk dicatat sebelum diblokir.
            return jsonify({"action": "BLOCK", "reason": reason, "threat_score": threat_score}), 200
            
        return jsonify({"action": "ALLOW", "threat_score": threat_score}), 200

    # ============================
    # API: GET Logs
    # ============================
    @app.route("/api/logs")
    def api_logs():
        db = get_db()

        filters = []
        params = []


        start = request.args.get("start")
        if start:
            filters.append("timestamp >= ?")
            params.append(start.replace("T", " ") + ":00")

        end = request.args.get("end")
        if end:
            filters.append("timestamp <= ?")
            params.append(end.replace("T", " ") + ":59")


        ip = request.args.get("ip")
        if ip:
            filters.append("ip LIKE ?")
            params.append(f"%{ip}%")

        method = request.args.get("method")
        if method:
            filters.append("method = ?")
            params.append(method)

        status = request.args.get("status")
        if status:
            filters.append("status = ?")
            params.append(status)

        where_clause = ""
        if filters:
            where_clause = "WHERE " + " AND ".join(filters)

        query = f"""
            SELECT id, timestamp, ip, method, path, full_url,
                status, user_agent, payload_preview, threat_score, reason
            FROM logs
            {where_clause}
            ORDER BY timestamp  DESC
            LIMIT 100
        """

        rows = db.execute(query, params).fetchall()

        logs = [{
            "id": r["id"],
            "timestamp": r["timestamp"],
            "ip": r["ip"],
            "method": r["method"],
            "path": r["path"],
            "full_url": r["full_url"],
            "status": r["status"],
            "user_agent": str(escape(r["user_agent"])),
            "payload": str(escape(r["payload_preview"])),
            "threat_score": r["threat_score"],
            "reason": r["reason"]
        } for r in rows]

        return jsonify({"logs": logs})

    def build_filters(request):
        filters = []
        params = []

        start = request.args.get("start")
        if start:
            filters.append("timestamp >= ?")
            params.append(start.replace("T", " ") + ":00")

        end = request.args.get("end")
        if end:
            filters.append("timestamp <= ?")
            params.append(end.replace("T", " ") + ":59")

        ip = request.args.get("ip")
        if ip:
            filters.append("ip LIKE ?")
            params.append(f"%{ip}%")

        method = request.args.get("method")
        if method:
            filters.append("method = ?")
            params.append(method)

        status = request.args.get("status")
        if status:
            filters.append("status = ?")
            params.append(status)

        where_clause = ""
        if filters:
            where_clause = "WHERE " + " AND ".join(filters)

        return where_clause, params

    @app.route("/api/blacklist")
    def api_blacklist():
        db = get_db()
        
        # 1. Bersihkan status yang sudah expired SETIAP KALI halaman dibuka
        db.execute("""
            UPDATE blacklist_ip 
            SET is_active = 0 
            WHERE is_active = 1 AND expires_at < DATETIME('now', '+8 hours')
        """)
        db.commit() # Penting untuk commit agar tersimpan

        # 2. Baru ambil datanya
        rows = db.execute("""
            SELECT id, ip, reason, blocked_at, expires_at, blocked_by, 
                is_active, total_hits, last_seen
            FROM blacklist_ip
            ORDER BY blocked_at DESC
        """).fetchall()

        data = [dict(r) for r in rows]
        return jsonify({"ips": data})


    @app.route("/api/blacklist/check", methods=["GET"])
    def check_ip():
       # Ambil IP dari parameter URL, jika tidak ada cek X-Forwarded-For, jika tidak ada baru X-Real-IP
        ip = request.args.get("ip") or request.headers.get("X-Forwarded-For") or request.headers.get("X-Real-IP")
        
        # Jika header X-Forwarded-For berisi koma (misal: "IP_User, IP_Proxy"), ambil IP pertama saja
        if ip and "," in ip:
            ip = ip.split(",")[0].strip()
            
        if not ip:
            return jsonify({"is_blocked": False}), 200

        db = get_db()
        
        # 1. Bersihkan yang sudah expired dulu
        db.execute("""
            UPDATE blacklist_ip 
            SET is_active = 0 
            WHERE is_active = 1 AND expires_at < DATETIME('now', '+8 hours')
        """)
        db.commit()

        # 2. Cek apakah IP masih aktif diblokir
        row = db.execute(
            "SELECT id, reason, total_hits FROM blacklist_ip WHERE ip = ? AND is_active = 1", 
            (ip,)
        ).fetchone()
        
        if row:
            # 🛑 IP TERBLOKIR: Update total_hits dan last_seen langsung di sini!
            # Karena Nginx akan langsung memblokir, request tidak akan pernah sampai ke endpoint /log
            db.execute("""
                UPDATE blacklist_ip 
                SET total_hits = total_hits + 1,
                    last_seen = DATETIME('now', '+8 hours'),
                    expires_at = DATETIME(expires_at, '+10 seconds')
                WHERE id = ?
            """, (row["id"],))
            db.commit()

            # Kembalikan status 403 Forbidden agar Nginx langsung menjatuhkan request
            return jsonify({
                "is_blocked": True, 
                "reason": row["reason"],
                "total_hits": row["total_hits"] + 1
            }), 403
        
        # 🟢 IP AMAN: Izinkan lewat
        return jsonify({"is_blocked": False}), 200

    @app.route("/api/blacklist/stats")
    def api_blacklist_stats():
        db = get_db()

        row = db.execute("""
            SELECT
                COUNT(*) AS total,
                SUM(is_active) AS active,
                SUM(CASE WHEN is_active = 0 THEN 1 ELSE 0 END) AS expired
            FROM blacklist_ip
        """).fetchone()

        return jsonify({
            "total": row["total"],
            "active": row["active"] or 0,
            "expired": row["expired"] or 0
        })

    # ============================
    # API: POST Log & Auto-Blacklist
    # ============================
    @app.route("/log", methods=["POST"])
    def receive_log():
        data = request.get_json()
        client_ip = data.get("ip")
        attack_type = data.get("reason")
        status_code = data.get("status")
        threat_score = data.get("threat_score", 0)
        
        full_url_target = data.get("full_url", data.get("url", ""))

        # FILTER: Abaikan favicon
        if "favicon.ico" in str(full_url_target):
            return {"status": "ignored_favicon"}, 200

        db = get_db()
        db.execute("UPDATE blacklist_ip SET is_active = 0 WHERE is_active = 1 AND expires_at < DATETIME('now', '+8 hours')")
        db.commit()

        # CEK APAKAH SUDAH TERBLOKIR?
        blocked_ip = db.execute("SELECT id FROM blacklist_ip WHERE ip = ? AND is_active = 1", (client_ip,)).fetchone()

        if blocked_ip:
            # 🛑 IP SUDAH TERBLOKIR! 
            # INI SATU-SATUNYA TEMPAT HIT DITAMBAH (+1)
            db.execute("""
                UPDATE blacklist_ip 
                SET total_hits = total_hits + 1,
                    last_seen = DATETIME('now', '+8 hours'),
                    expires_at = DATETIME(expires_at, '+10 seconds')
                WHERE id = ?
            """, (blocked_ip["id"],))
            db.commit()
            # Keluar tanpa menambah baris log baru di tabel logs
            return {"status": "ignored_due_to_blacklist_but_hit_counted"}, 200

        # 🟢 JIKA BELUM DIBLOKIR -> CATAT KE TABEL LOGS
        db.execute("""
            INSERT INTO logs (timestamp, ip, path, full_url, method, status, payload_preview, reason, user_agent, threat_score)
            VALUES (DATETIME('now','+8 hours'), ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """, (
            client_ip, 
            data.get("url"), 
            full_url_target, 
            data.get("method"), 
            status_code, 
            str(data.get("payload"))[:200], 
            attack_type, 
            data.get("ua"),
            threat_score
        ))

        # JIKA INI SERANGAN BARU PERTAMA KALI
        if status_code == 403 or threat_score > 70:
            _process_blacklist(client_ip, attack_type)

        db.commit()
        return {"status": "success"}, 200


    @app.route("/api/stats/requests")
    def stats_requests():
        db = get_db()
        where, params = build_filters(request)

        rows = db.execute(f"""
            SELECT strftime('%H:%M', timestamp) AS minute, COUNT(*) AS total
            FROM logs
            {where}
            GROUP BY minute
            ORDER BY minute
        """, params).fetchall()

        return jsonify({
            "labels": [r["minute"] for r in rows],
            "values": [r["total"] for r in rows]
        })

    @app.route("/api/stats/ips")
    def stats_top_ips():
        db = get_db()
        where, params = build_filters(request)

        # Query untuk mengambil 5 IP dengan jumlah request terbanyak
        rows = db.execute(f"""
            SELECT ip, COUNT(*) AS total
            FROM logs
            {where}
            GROUP BY ip
            ORDER BY total DESC
            LIMIT 5
        """, params).fetchall()

        return jsonify({
            "labels": [r["ip"] for r in rows],
            "values": [r["total"] for r in rows]
        })
    

    @app.route("/api/stats/hourly")
    def stats_hourly():
        db = get_db()
        where, params = build_filters(request)

        # Query untuk menghitung jumlah request per jam (00-23)
        rows = db.execute(f"""
            SELECT strftime('%H', timestamp) AS hour, COUNT(*) AS total
            FROM logs
            {where}
            GROUP BY hour
            ORDER BY hour ASC
        """, params).fetchall()

        # Inisialisasi template 24 jam dengan nilai 0 agar jam yang kosong tetap muncul
        hourly_data = {f"{i:02d}:00": 0 for i in range(24)}
        
        for r in rows:
            if r["hour"]:
                hourly_data[f"{int(r['hour']):02d}:00"] = r["total"]

        return jsonify({
            "labels": list(hourly_data.keys()),
            "values": list(hourly_data.values())
        })
        
    @app.route("/api/stats/status")
    def stats_status():
        db = get_db()
        where, params = build_filters(request)

        rows = db.execute(f"""
            SELECT status, COUNT(*) AS total
            FROM logs
            {where}
            GROUP BY status
        """, params).fetchall()

        return jsonify({
            "labels": [str(r["status"]) for r in rows],
            "values": [r["total"] for r in rows]
        })

    @app.route("/api/blacklist/block", methods=["POST"])
    def api_block_ip():
        data = request.get_json()

        ip = data.get("ip")
        reason = data.get("reason", "Manual block")
        duration = data.get("duration", 24)  # jam
        blocked_by = data.get("blocked_by", "admin")

        if not ip:
            return jsonify({"error": "IP is required"}), 400

        blocked_at = datetime.now()
        expires_at = blocked_at + timedelta(hours=int(duration))

        db = get_db()

        # Cek apakah IP sudah ada
        existing = db.execute(
            "SELECT id FROM blacklist_ip WHERE ip = ? AND is_active = 1",
            (ip,)
        ).fetchone()

        if existing:
            return jsonify({"error": "IP already blocked"}), 400

        db.execute("""
            INSERT INTO blacklist_ip
            (ip, reason, blocked_at, expires_at, blocked_by, is_active)
            VALUES (?, ?, ?, ?, ?, 1)
        """, (
            ip,
            reason,
            blocked_at,
            expires_at,
            blocked_by
        ))

        db.commit()

        return jsonify({"status": "blocked", "ip": ip})

    @app.route("/api/blacklist/unblock", methods=["POST"])
    def api_unblock_ip():
        data = request.get_json()
        ip = data.get("ip")
        db = get_db()

        # Opsi 1: Hapus total agar hitungan pelanggaran kembali ke 0
        # db.execute("DELETE FROM blacklist_ip WHERE ip = ?", (ip,))
        
        # Opsi 2 (Jika ingin tetap ada riwayat tapi tidak memblokir):
        db.execute("UPDATE blacklist_ip SET is_active = 0, total_hits = 0 WHERE ip = ?", (ip,))

        db.commit()
        return jsonify({"status": "unblocked", "ip": ip})
    
    @app.route("/api/logs/export", methods=["GET"])
    def export_logs():
        db = get_db()
        logs = db.execute("SELECT * FROM logs ORDER BY id DESC").fetchall()

        if not logs:
            return "Tidak ada data untuk diekspor", 404

        output = io.StringIO()
        writer = csv.writer(output)

        # Ambil nama kolom secara dinamis dari database agar tidak IndexError lagi
        column_names = logs[0].keys()
        writer.writerow(column_names) # Tulis header otomatis sesuai database

        # Tulis baris data
        for log in logs:
            writer.writerow([log[column] for column in column_names])

        response = make_response(output.getvalue())
        response.headers["Content-Disposition"] = "attachment; filename=waf_logs_export.csv"
        response.headers["Content-type"] = "text/csv"
        return response



    # LOGIN API (Simpan di sini agar satu grup dengan login_page)
    @app.route("/api/auth/login", methods=["POST"])
    def do_login():
        data = request.get_json()
        username_input = data.get("username")
        password_input = data.get("password")

        # Mengambil data dari .env
        env_user = os.getenv("ADMIN_USERNAME")
        env_pass = os.getenv("ADMIN_PASSWORD")

        if username_input == env_user and password_input == env_pass:
            session["logged_in"] = True
            session["user"] = env_user
            return jsonify({"status": "success"}), 200
        
        return jsonify({"status": "failed", "message": "Kredensial Salah"}), 401


    @app.route("/logout")
    def logout():
        session.clear() # Menghapus semua data session
        return redirect(url_for("login_page"))