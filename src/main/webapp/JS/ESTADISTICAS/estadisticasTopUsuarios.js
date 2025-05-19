fetch('Ajax', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: 'accion=Top-usuarios-eventos'
})
    .then(response => response.json())
    .then(data => {
        const labels = data.map(item => item.username);
        const values = data.map(item => item.totalEventos);

        const ctx = document.getElementById('usuariosEventosChart').getContext('2d');

        const chartData = {
            labels: labels,
            datasets: [{
                label: 'Usuarios más activos',
                data: values,
                backgroundColor: '#6f42c1',
                borderColor: '#a78cde',
                borderWidth: 1
            }]
        };

        const config = {
            type: 'bar',
            data: chartData,
            options: {
                indexAxis: 'y',
                responsive: true,
                scales: {
                    x: {
                        beginAtZero: true
                    }
                }
            }
        };

        new Chart(ctx, config);
    })
    .catch(error => {
        console.error('Error al obtener el top de usuarios con más eventos:', error);
    });
