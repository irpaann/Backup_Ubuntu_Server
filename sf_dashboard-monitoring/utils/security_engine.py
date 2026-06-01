import joblib
import re
import os
import numpy as np
import pandas as pd
import math
import time
import urllib.parse
from collections import Counter
from models.rule_engine import check_rule_based 

class SecurityEngine:
    def __init__(self, mode="ML"):  
        self.mode = mode.upper() if mode else "NONE"
        
        self.occ_model = None
        self.scaler = None
        self.rf_model = None
        self.rf_columns = None
        
        # Inisialisasi Tracker IP untuk Brute Force
        self.time_window = 60
        self.ip_history = {} 

        if self.mode == "ML":
            try:
                # 1. Load Anomaly Detection Models
                self.occ_model = joblib.load(os.path.join('models/occ_models', '9.2_model_isoforest_waf.pkl'))
                self.scaler = joblib.load(os.path.join('models/occ_models', '9.2_scaler_waf.pkl'))
                
                # 2. Load Classification Models (Random Forest V6)
                self.rf_model = joblib.load(os.path.join('models/rf_models', 'model_random_forest_AttacksOnly_V93.pkl'))
                self.rf_columns = joblib.load(os.path.join('models/rf_models', 'model_columns_AttacksOnly_V93.pkl'))
                
                print(f"✅ SecurityEngine: MODE ML AKTIF (OCC & RF Loaded)")
            except Exception as e:
                print(f"❌ Error Load ML: {e}. Deteksi dinonaktifkan.")
                self.mode = "NONE" 
        
        elif self.mode == "RULE":
            print("⚙️  SecurityEngine: MODE RULE-BASED AKTIF")
        
        else:
            self.mode = "NONE"
            print("⚠️ SecurityEngine: MODE POLOS (Deteksi Dinonaktifkan)")

    # =================================================================
    # FUNGSI BANTUAN
    # =================================================================
    def _get_ip_stats(self, ip, status_code):
        current_time = time.time()
        if ip not in self.ip_history:
            self.ip_history[ip] = []
            
        self.ip_history[ip].append((current_time, int(status_code)))
        
        # Bersihkan data log IP yang lebih tua dari 60 detik
        self.ip_history[ip] = [
            (t, sc) for t, sc in self.ip_history[ip] 
            if current_time - t <= self.time_window
        ]
        
        history = self.ip_history[ip]
        req_count = len(history)
        count_401 = sum(1 for _, sc in history if sc in [401, 403, 404]) 
        ratio_401 = float(count_401 / req_count) if req_count > 0 else 0.0
        
        return float(req_count), float(count_401), ratio_401

    def _debug_print_features(self, features_dict):
        """Mencetak nilai fitur ke terminal untuk debugging."""
        print("\n" + "="*50)
        print("📊 [DEBUG WAF] - HASIL EKSTRAKSI FITUR OCC")
        print("="*50)
        max_len = max(len(name) for name in features_dict.keys())
        for name, value in features_dict.items():
            print(f" 🔹 {name:<{max_len}} : {value:.4f}")
        print("="*50 + "\n")

    # =================================================================
    # EKSTRAKSI FITUR (OCC & RF)
    # =================================================================
    def extract_occ_features(self, status_code, payload, path, time_diff):
        raw_str = str(payload) if pd.notna(payload) and str(payload).lower() != "none" else ""
        raw_payload = urllib.parse.unquote_plus(raw_str).lower() 
        path_str = str(path).lower()
        full_str = f"{path_str} {raw_payload}"
        
        # Pembobotan Karakter (Feature Engineering)
        critical_chars = len(re.findall(r"[\<\>\'\"\;\{\}]", raw_payload))
        medium_chars = len(re.findall(r"[\/\\\=\+\(\)\[\]]", raw_payload))
        low_chars = len(re.findall(r"[\.\-\_]", raw_payload))
        f_special_weighted = float((critical_chars * 5) + (medium_chars * 2) + (low_chars * 1))

        f_status = float(status_code)
        f_pay_len = float(len(raw_payload))
        f_ratio = float(len(re.findall(r'[^a-zA-Z0-9]', raw_payload)) / f_pay_len) if f_pay_len > 0 else 0.0
        
        # Deteksi Keyword ML
        sqli_keywords = ['select', 'insert', 'update', 'delete', 'union', 'drop', 'information_schema', 'table_name']
        f_sql = 1.0 if any(kw in raw_payload for kw in sqli_keywords) else 0.0
        
        xss_keywords = ['script', 'alert', 'onerror', 'onload', 'svg', 'javascript:', 'eval','iframe','fromCharCode','base64']
        f_html = 1.0 if any(kw in raw_payload for kw in xss_keywords) else 0.0
        
        p, lns = Counter(raw_payload), float(len(raw_payload))
        f_entropy = -sum(count/lns * math.log(count/lns, 2) for count in p.values()) if lns > 0 else 0.0
        
        f_time = float(time_diff) if time_diff is not None else 5.0
        f_login = 1.0 if any(x in path_str for x in ['login', 'auth', 'signin']) else 0.0
        f_traversal = float(full_str.count('..'))
        
        lfi_keywords = ['etc/passwd', 'cmd.exe', 'system32', 'boot.ini', 'shadow']
        f_sensitive = 1.0 if any(kw in full_str for kw in lfi_keywords) else 0.0
        f_encoded = 1.0 if '%' in raw_str else 0.0

        # Return sebagai DICTIONARY
        return {
            'status_code': f_status, 'payload_length': f_pay_len, 'special_char_count': f_special_weighted, 
            'non_alphanumeric_ratio': f_ratio, 'has_sql_keywords': f_sql, 'has_html_tags': f_html, 
            'entropy': f_entropy, 'time_diff': f_time, 'is_login_path': f_login, 
            'traversal_count': f_traversal, 'has_sensitive_file': f_sensitive, 'is_url_encoded': f_encoded
        }
        
    def extract_rf_features(self, payload, path, time_diff, req_count, count_401, ratio_401):
        raw_payload = str(payload).lower() if pd.notna(payload) and str(payload).lower() != "none" else ""
        path_str = str(path).lower()
        full_str = f"{path_str} {raw_payload}"

        f_payload_length = float(len(raw_payload))
        
        return {
            # =================================================================
            # METRIK UTAMA & DETEKSI PATH TRAVERSAL (DIJAMIN TETAP AKURAT)
            # =================================================================
            'payload_length': f_payload_length,
            'dot_count': float(full_str.count('.')),
            'total_slash': float(full_str.count('/')),
            'total_backslash': float(full_str.count('\\')),
            'percent_count': float(full_str.count('%')),
            'is_encoded': 1.0 if '%' in raw_payload else 0.0,
            'double_dot_count': float(full_str.count('..')),
            'has_sensitive_word': 1.0 if any(w in full_str for w in ['etc', 'passwd', 'shadow', 'boot.ini', 'win.ini', 'cmd.exe', 'system32']) else 0.0,
            'non_alphanum_ratio': float(len(re.findall(r'[^a-zA-Z0-9\s]', raw_payload)) / f_payload_length) if f_payload_length > 0 else 0.0,
            
            # =================================================================
            # TRACKER DINAMIS IP (KUNCI UTAMA BRUTE FORCE - TETAP DIJAGA)
            # =================================================================
            'request_count': float(req_count),
            'unique_payload_count': 1.0,
            'status_401_count': float(count_401),
            'avg_time_diff': float(time_diff),
            'status_401_ratio': float(ratio_401),
            'space_count': float(raw_payload.count(' ') + raw_payload.count('%20')),
            'digit_count': float(len(re.findall(r'\d', raw_payload))),

            # =================================================================
            # PEMISAHAN TOTAL & LOGIS (KHUSUS SQLi vs XSS)
            # =================================================================
            'sqli_spec_chars': float(len(re.findall(r"[\'\"\;\|\&\#\*]", raw_payload))),
            'xss_spec_chars': float(len(re.findall(r"[\<\>\[\]\{\}\(\)]", raw_payload))),
            'has_tag_structure': 1.0 if '<' in raw_payload and '>' in raw_payload else 0.0,
            'sql_keyword_only': float(sum(1 for k in ['select', 'union', 'insert', 'update', 'delete', 'drop', 'where', 'and', 'or'] if k in raw_payload)),
            'xss_keyword_only': float(sum(1 for k in ['script', 'alert', 'onerror', 'onload', 'svg', 'javascript:', 'eval', 'iframe'] if k in raw_payload))
        }

    # =================================================================
    # FUNGSI UTAMA ANALISIS
    # =================================================================
    def analyze(self, path, ip, payload, ua, method, time_diff, status_code=200):
        # 1. Sanitasi Input
        raw_payload = str(payload) if pd.notna(payload) and str(payload).lower() != "none" else ""
        decoded_payload = urllib.parse.unquote_plus(raw_payload).lower()
        
        time_diff_float = float(time_diff) if time_diff is not None else 5.0
        if time_diff_float <= 0.0 or time_diff_float > 30.0:
            time_diff_float = 5.0
            
        # =================================================================
        # PROSES MACHINE LEARNING
        # =================================================================
        if self.mode == "ML":
            if self.occ_model and self.scaler:
                try:
                    # TAHAP 1: Isolation Forest (OCC)
                    occ_features_dict = self.extract_occ_features(status_code, raw_payload, path, time_diff_float)
                    self._debug_print_features(occ_features_dict) # Cetak ke terminal
                    
                    feature_names = [
                        'status_code', 'payload_length', 'special_char_count', 'non_alphanumeric_ratio', 
                        'has_sql_keywords', 'has_html_tags', 'entropy', 'time_diff', 'is_login_path', 
                        'traversal_count', 'has_sensitive_file', 'is_url_encoded'
                    ]
                    
                    X_new = pd.DataFrame([occ_features_dict])[feature_names]
                    X_scaled = self.scaler.transform(X_new)
                    
                    raw_score = self.occ_model.decision_function(X_scaled)[0]
                    threat_score = max(0, min(100, round((0.5 - raw_score) * 100, 2)))

                    print(f"🔍 [WAF-ML] {method} {path} | IP: {ip} | Jeda: {time_diff_float:.2f}s | Payload: {raw_payload}")
                    print(f" ├─ OCC Score : {raw_score:.3f} (Batas < -0.050 = Anomali)")

                    if raw_score < -0.050:
                        print(f" ├─ Tahap 1 (OCC) : 🛑 ANOMALI (Threat: {threat_score}%)")
                        
                        # TAHAP 2: Random Forest (KLASIFIKASI)
                        attack_category_name = "Unknown Anomaly"
                        if self.rf_model is not None and self.rf_columns is not None:
                            try:
                                # Ambil data Tracker IP
                                req_count, count_401, ratio_401 = self._get_ip_stats(ip, status_code)
                                
                                rf_features_dict = self.extract_rf_features(raw_payload, path, time_diff_float, req_count, count_401, ratio_401)
                                X_rf = pd.DataFrame([rf_features_dict])[self.rf_columns]
                                rf_prediction = self.rf_model.predict(X_rf)[0]
                                
                                # Safety Net Brute Force
                                if rf_prediction == 2 and req_count <= 3:
                                    print(f" └─ [SAFETY NET] RF menebak Brute Force, tapi IP {ip} baru request {int(req_count)}x (Aman)")
                                    return "Normal", "Request Aman (Salah Password Wajar)", 0.0

                                label_mapping = {1: "Path Traversal", 2: "Brute Force", 3: "SQL Injection", 4: "Cross-Site Scripting (XSS)"}
                                attack_category_name = label_mapping.get(rf_prediction, f"Tipe {rf_prediction}")
                                
                                print(f" └─ Tahap 2 (RF)  : 🎯 {attack_category_name.upper()}")
                                
                            except Exception as rf_err:
                                print(f" └─ Error RF      : ⚠️ {rf_err}")
                        
                        return "Attack", f"Anomaly: {attack_category_name}", threat_score
                    else:
                        print(f" └─ Tahap 1 (OCC) : ✅ NORMAL (Aman)")
                        return "Normal", "Request Aman (ML)", 0.0
                
                except Exception as e:
                    print(f"⚠️ Error Eksekusi ML: {e}")
                    return "Normal", "ML Execution Error", 0.0
            else:
                return "Normal", "Model ML Belum Dimuat", 0.0

        elif self.mode == "RULE":
            return "Attack", "Rule Terdeteksi (Placeholder)", 90.0

        else:
            return "Normal", "Mode Polos", 0.0