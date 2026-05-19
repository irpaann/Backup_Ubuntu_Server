import sqlite3

# PENTING: Ganti 'database.db' dengan nama file SQLite kamu yang sebenarnya
# (Biasanya ada di folder 'instance' jika pakai Flask default, misal: 'instance/database.db')
DB_PATH = 'logs.db' 

try:
    # Buka koneksi ke database
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    # Eksekusi perintah penambahan kolom
    cursor.execute("ALTER TABLE logs ADD COLUMN hit_count INTEGER DEFAULT 1;")
    conn.commit()
    
    print("✅ BERHASIL: Kolom 'hit_count' sukses ditambahkan ke tabel logs!")

except sqlite3.OperationalError as e:
    if "duplicate column name" in str(e).lower():
        print("⚠️ AMAN: Kolom 'hit_count' ternyata sudah ada.")
    else:
        print(f"❌ ERROR DATABASE: {e}")
except Exception as e:
    print(f"❌ ERROR: {e}")
finally:
    if 'conn' in locals():
        conn.close()