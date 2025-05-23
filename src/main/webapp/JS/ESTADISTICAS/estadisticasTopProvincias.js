fetch('Ajax', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: 'accion=Provincias-activas'
})
    .then(response => response.json())
    .then(data => {
        const labels = data.map(item => item.provincia);
        const values = data.map(item => item.totalEventos);

        const ctx = document.getElementById('barChartProvincias').getContext('2d');

        const chartData = {
            labels: labels,
            datasets: [{
                label: 'Provincias más activas',
                data: values,
                backgroundColor: '#5f27cd',
                borderColor: '#a78cde',
                borderWidth: 1
            }]
        };

        const config = {
            type: 'bar',
            data: chartData,
            options: {
                indexAxis: 'y', // Horizontal
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
        console.error('Error al obtener provincias activas:', error);
    });
