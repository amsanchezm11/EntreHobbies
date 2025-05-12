fetch('Ajax', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: 'accion=Categorias-activas'
})
    .then(response => response.json())
    .then(data => {
        const labels = data.map(item => item.categoria);
        const values = data.map(item => item.totalEventos);

        const ctx = document.getElementById('barChartCategorias').getContext('2d');

        const chartData = {
            labels: labels,
            datasets: [{
                label: 'Categorías más populares',
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
                responsive: true,
                scales: {
                    x: {
                        beginAtZero: true
                    },
                    y: {
                        beginAtZero: true
                    }
                }
            }
        };

        new Chart(ctx, config);
    })
    .catch(error => {
        console.error('Error al obtener categorías activas:', error);
    });
