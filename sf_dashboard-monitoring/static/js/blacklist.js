async function loadBlacklist() {
    try {
        const res = await fetch("/api/blacklist");
        const data = await res.json();

        const tbody = document.getElementById("blacklistTable");
        if (!tbody) return; // Keamanan jika elemen tidak ada
        
        tbody.innerHTML = "";

        data.ips.forEach(ip => {
            // 1. Tentukan status badge
            const status = ip.is_active
                ? `<span class="badge bg-danger">Active</span>`
                : `<span class="badge bg-secondary">Expired</span>`;

            // 2. DEFINISIKAN unblockBtn DISINI (Sebelum dipakai di template string)
            const unblockBtn = ip.is_active 
                ? `<button class="btn btn-sm btn-success" onclick="unblockIP('${ip.ip}')">Unblock</button>` 
                : `<button class="btn btn-sm btn-secondary" disabled>Unblocked</button>`;

            // 3. Render baris tabel
            tbody.innerHTML += `
                <tr>
                    <td>${ip.ip}</td>
                    <td>${ip.reason}</td>
                    <td>${status}</td>
                    <td>${ip.blocked_at}</td>
                    <td>${ip.expires_at || "-"}</td>
                    <td>${ip.total_hits}</td>
                    <td>${ip.last_seen || "-"}</td>
                    <td>
                        <div class="btn-group">
                            <a href="/logs?ip=${ip.ip}" class="btn btn-sm btn-outline-primary">View</a>
                            ${unblockBtn}
                        </div>
                    </td>
                </tr>
            `;
        });
    } catch (err) {
        console.error("Error loading blacklist:", err);
    }
}

async function loadStats() {
    try {
        const res = await fetch("/api/blacklist/stats");
        const stats = await res.json();

        // Gunakan optional chaining agar tidak error jika elemen belum dimuat
        if(document.getElementById("statTotal")) document.getElementById("statTotal").innerText = stats.total;
        if(document.getElementById("statActive")) document.getElementById("statActive").innerText = stats.active;
        if(document.getElementById("statExpired")) document.getElementById("statExpired").innerText = stats.expired;
    } catch (err) {
        console.error("Error loading stats:", err);
    }
}

// Tambahkan window. agar fungsi bisa dipanggil dari onclick di HTML
window.unblockIP = async function(ip) {
    if (!confirm(`Buka blokir untuk IP ${ip}?`)) return;

    try {
        const res = await fetch("/api/blacklist/unblock", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ ip: ip })
        });

        const data = await res.json();

        if (res.ok) {
            alert(`IP ${ip} berhasil dibuka blokirnya!`);
            loadBlacklist();
            loadStats();
        } else {
            alert("Gagal: " + (data.error || "Terjadi kesalahan"));
        }
    } catch (err) {
        console.error("Error unblocking IP:", err);
        alert("Gagal menghubungi server.");
    }
}

document.addEventListener("DOMContentLoaded", () => {
    loadBlacklist();
    loadStats();
});

// Fungsi untuk menjalankan refresh data secara berkala
function startRealtimeUpdate() {
    // Jalankan setiap 5 detik (5000 milidetik)
    setInterval(() => {
        console.log("Mengupdate data blacklist secara otomatis...");
        loadBlacklist(); // Fungsi yang sudah kamu buat untuk ambil data tabel
        loadStats();     // Fungsi yang sudah kamu buat untuk ambil angka statistik
    }, 5000); 
}

// Panggil fungsi saat halaman selesai dimuat
document.addEventListener("DOMContentLoaded", () => {
    loadBlacklist();
    loadStats();
    startRealtimeUpdate(); // Aktifkan real-time
});