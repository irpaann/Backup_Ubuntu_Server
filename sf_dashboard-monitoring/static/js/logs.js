let lastFetch = null;

async function loadLogs() {
    try {
        const res = await fetch("/api/logs");
        const data = await res.json();

        const tbody = document.querySelector("#logsTable tbody");
        tbody.innerHTML = "";

        data.logs.forEach(log => {
            const tr = document.createElement("tr");

            tr.innerHTML = `
                <td>${log.id}</td>
                <td>${log.timestamp}</td>
                <td>${log.ip}</td>
                <td><span class="badge bg-secondary">${log.method}</span></td>
                <td>${log.status}</td>
                <td>${log.path}</td>
                <td class="text-truncate" style="max-width:150px;">
                    ${log.user_agent || "-"}
                </td>
                <td class="text-truncate" style="max-width:200px;">
                    ${log.payload || "-"}
                </td>
                <td>${log.threat_score}</td>
            `;

            tbody.appendChild(tr);
        });

    } catch (err) {
        console.error("Failed to load logs", err);
    }
}

// load awal
loadLogs();

// realtime polling tiap 2 detik
setInterval(loadLogs, 2000);
