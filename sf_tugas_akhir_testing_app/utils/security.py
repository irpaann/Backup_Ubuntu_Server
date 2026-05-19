import requests

def verify_access(ip):
    try:
        # Gunakan 127.0.0.1 karena Dashboard ada di mesin yang sama port 3000
        # Tambahkan timeout agar tidak menghambat loading web user
        url = f"http://127.0.0.1:3000/api/blacklist/check?ip={ip}"
        response = requests.get(url, timeout=0.5)
        
        if response.status_code == 200:
            data = response.json()
            # Harus cocok dengan field 'is_active' di Dashboard API
            if data.get("is_active") == True:
                return True, data.get("reason", "Aktivitas mencurigakan")
                
        return False, None
    except Exception as e:
        # Jika koneksi gagal, jangan blokir (fail-open) agar user tidak rugi
        return False, None