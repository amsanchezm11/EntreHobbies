fetch('Ajax', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: 'accion=Usuarios-mes'
})
    .then(response => response.json())
    .then(data => {
        const labels = Object.keys(data);
        const values = Object.values(data);

        const ctx = document.getElementById('lineChartUsuariosMes').getContext('2d');

        const chartData = {
            labels: labels,
            datasets: [{
                label: 'Usuarios registrados',
                data: values,
                fill: false,
                borderColor: '#5f27cd',
                tension: 0.5
            }]
        };

        const config = {
            type: 'line',
            data: chartData,
            options: {
                responsive: true,
                animations: {
                    tension: {
                        duration: 1000,
                        easing: 'linear',
                        from: 1,
                        to: 0,
                        loop: true
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        labels: {
                            color: '#000'
                        }
                    }
                }
            }
        };

        new Chart(ctx, config);
    })
    .catch(error => {
        console.error('Error al obtener usuarios por mes:', error);
    });