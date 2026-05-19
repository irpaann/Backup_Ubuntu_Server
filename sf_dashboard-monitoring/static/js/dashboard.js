
function truncate(text, max = 40) {
    if (!text) return "";
    return text.length > max ? text.substring(0, max) + "..." : text;
}


// ======================
// LOAD LOGS
// ======================

function loadLogs() {
    const params = new URLSearchParams(getFilterParams());

    fetch("/api/logs?" + params.toString())
        .then(res => res.json())
        .then(data => {
            const tbody = document.querySelector("#logTable tbody");
            tbody.innerHTML = "";

            data.logs.forEach(log => {
                
                // 🟢 PERBAIKAN DETEKSI: 
                // Jika skor ancaman > 0, ATAU HTTP Status 403, ATAU reason bukan Normal
                const isAttack = log.threat_score > 0 || log.status === 403 || log.status === "403" || (log.reason && log.reason !== "Request Aman (ML)" && log.reason !== "Normal"); 
                
                const threatType = log.reason || "Normal"; 
                const preview = truncate(log.payload) || "empty";

                const tr = document.createElement("tr");

                // ... (lanjutan kode tr.innerHTML kamu tetap sama seperti sebelumnya) ...
                tr.innerHTML = `
                    <td>${log.id}</td>
                    <td>${log.timestamp}</td>
                    <td>${log.ip}</td>
                    <td>${log.method}</td>
                    <td>${log.status}</td>
                    <td>${log.path}</td>

                    <td>
                        <a href="${log.full_url}" target="_blank">
                            ${log.full_url}
                        </a>
                    </td>

                    <td>
                        <span class="badge ${isAttack ? "text-danger" : "text-muted"}"
                        style="background-color: ${isAttack ? 'transparent' : '#f8f9fa'}; 
                                     border: 1px solid ${isAttack ? '#dc3545' : '#ced4da'};"
                            onclick='showPayload(${JSON.stringify(log.payload)})'>
                            ${preview}
                        </span>
                    </td>

                    <td>
                        <span class="badge ${isAttack ? "text-danger" : "text-muted"}" 
                              style="background-color: ${isAttack ? 'transparent' : '#f8f9fa'}; 
                                     border: 1px solid ${isAttack ? '#dc3545' : '#ced4da'};">
                            ${threatType}
                        </span>
                    </td>
                `;

                tbody.appendChild(tr);
            });
        })
        .catch(err => console.error("Load logs error:", err));
}

// Fungsi untuk mengirim perintah blokir ke API
window.blockIP = function(ip, reason) {
    if (!confirm(`Apakah Anda yakin ingin memblokir IP ${ip}?`)) return;

    fetch("/api/blacklist/block", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            ip: ip,
            reason: reason || "Manual Block dari Dashboard",
            duration: 24, // Blokir selama 24 jam
            blocked_by: "admin"
        })
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === "blocked") {
            alert(`IP ${ip} berhasil diblokir!`);
            // Refresh logs agar status terbaru muncul (opsional)
            loadLogs();
        } else {
            alert("Gagal memblokir: " + (data.error || "Unknown error"));
        }
    })
    .catch(err => {
        console.error("Block Error:", err);
        alert("Terjadi kesalahan koneksi ke server.");
    });
};


// ======================
// PAYLOAD MODAL
// ======================

function showPayload(payload) {
    const modalBody = document.getElementById("payloadModalBody");
    modalBody.textContent = payload || "(empty)";
    const modal = new bootstrap.Modal(document.getElementById("payloadModal"));
    modal.show();
}

function showResponse(resp) {
    document.getElementById("responseModalBody").textContent =
        resp || "(empty)";
    new bootstrap.Modal(
        document.getElementById("responseModal")
    ).show();
}

// ======================
// USER AGENT MODAL
// ======================

function showUserAgent(ua) {
    const modalBody = document.getElementById("uaModalBody");
    modalBody.textContent = ua || "(empty)";
    const modal = new bootstrap.Modal(document.getElementById("uaModal"));
    modal.show();
}

// ======================
// FILTER PARAMS
// ======================

function getFilterParams() {
    return {
        ip: document.getElementById("filterIp").value,
        method: document.getElementById("filterMethod").value,
        status: document.getElementById("filterStatus").value,
        start: document.getElementById("filterStart").value,
        end: document.getElementById("filterEnd").value
    };
}

// ======================
// CHARTS
// ======================

let chartRequests, chartMethods, chartStatus,chartIPs;

function loadCharts() {
    const params = new URLSearchParams(getFilterParams()).toString();

    // Requests per minute
    // fetch("/api/stats/requests?" + params)
    //     .then(res => res.json())
    //     .then(data => {
    //         if (chartRequests) chartRequests.destroy();
    //         chartRequests = new Chart(document.getElementById("chartRequests"), {
    //             type: "line",
    //             data: {
    //                 labels: data.labels,
    //                 datasets: [{
    //                     label: "Requests",
    //                     data: data.values,
    //                     borderWidth: 2
    //                 }]
    //             }
    //         });
    //     });

        fetch("/api/stats/ips?" + params) // Pastikan endpoint ini tersedia di backend
        .then(res => res.json())
        .then(data => {
            if (chartIPs) chartIPs.destroy();
            chartIPs = new Chart(document.getElementById("chartIPs"), {
                type: "bar", // Atau "bar" horizontal lebih cocok untuk IP
                data: {
                    labels: data.labels, // Contoh: ["192.168.1.1", "10.0.0.5", ...]
                    datasets: [{
                        label: "Requests",
                        data: data.values,
                        backgroundColor: [
                            '#ff6384', '#36a2eb', '#cc65fe', '#ffce56', '#4bc0c0'
                        ]
                    }]
                },
                options: {
                    indexAxis: 'x', // Opsional: Ubah jadi bar horizontal jika type: "bar"
                    responsive: true
                }
            });
        });
        
    // Methods
    fetch("/api/stats/methods?" + params)
        .then(res => res.json())
        .then(data => {
            if (chartMethods) chartMethods.destroy();
            chartMethods = new Chart(document.getElementById("chartMethods"), {
                type: "bar",
                data: {
                    labels: data.labels,
                    datasets: [{
                        label: "Total",
                        data: data.values,
                        borderWidth: 2
                    }]
                }
            });
        });

    // Status codes
    fetch("/api/stats/status?" + params)
        .then(res => res.json())
        .then(data => {
            if (chartStatus) chartStatus.destroy();
            chartStatus = new Chart(document.getElementById("chartStatus"), {
                type: "bar",
                data: {
                    labels: data.labels,
                    datasets: [{
                        label: "Count",
                        data: data.values,
                        borderWidth: 2
                    }]
                }
            });
        });
}

// ======================
// INIT
// ======================

loadLogs();
loadCharts();
setInterval(() => {
    loadLogs(); 
    loadCharts();
}, 5000);
