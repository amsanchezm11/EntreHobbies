fetch('Ajax', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: 'accion=Subcategorias-activas'
})
    .then(response => response.json())
    .then(data => {
        const labels = data.map(item => item.subcategoria);
        const values = data.map(item => item.totalEventos);

        const ctx = document.getElementById('barChartSubcategorias').getContext('2d');

        const chartData = {
            labels: labels,
            datasets: [{
                label: 'Subcategorías más populares',
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
        console.error('Error al obtener subcategorías activas:', error);
    });
