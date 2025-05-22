fetch('Ajax', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: 'accion=Eventos-mes'
})
    .then(response => response.json())
    .then(data => {
        const labels = Object.keys(data);
        const values = Object.values(data);

        const ctx = document.getElementById('lineChartEventosMes').getContext('2d');

        const chartData = {
            labels: labels,
            datasets: [{
                label: 'Eventos creados',
                data: values,
                fill: false,
                borderColor: '#6F42C1',
                tension: 0.1
            }]
        };

        const config = {
            type: 'line',
            data: chartData,
            options: {

                responsive: true,
                plugins: {
                    legend: {
                        display: true,
                        labels: {
                            color: '#000'
                        },
                        title: {
                            display: false,
                            text: 'Eventos creados por Mes'
                        }
                    }
                }
            }
        };

        new Chart(ctx, config);
    })
    .catch(error => {
        console.error('Error al obtener eventos por mes:', error);
    });

