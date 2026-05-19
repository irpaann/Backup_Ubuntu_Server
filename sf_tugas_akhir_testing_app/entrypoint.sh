#!/bin/sh

# Menunggu database siap
echo "Menunggu database..."
sleep 10  # MySQL butuh waktu lebih lama untuk booting pertama kali

# Menjalankan inisialisasi database menggunakan command yang baru kita buat
echo "Menjalankan inisialisasi database..."
flask init-db

# Menjalankan perintah utama (Gunicorn)
echo "Menjalankan aplikasi..."
exec gunicorn -w 4 -b 0.0.0.0:5000 app:app