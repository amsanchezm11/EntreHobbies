fetch('Ajax', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: 'accion=estadisticas-categorias'
})
    .then(response => response.json())
    .then(data => {
        const labels = Object.keys(data);
        const values = Object.values(data);

        const ctx = document.getElementById('myChart').getContext('2d');
        new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: labels,
                datasets: [{
                    data: values,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.5)',
                        'rgba(54, 162, 235, 0.5)',
                        'rgba(255, 206, 86, 0.5)',
                        'rgba(75, 192, 192, 0.5)',
                        'rgba(153, 102, 255, 0.5)',
                        'rgba(255, 159, 64, 0.5)',
                        'rgba(199, 199, 199, 0.5)',
                        'rgba(83, 102, 255, 0.5)',
                        'rgba(255, 102, 255, 0.5)',
                        'rgba(102, 255, 204, 0.5)',
                        'rgba(255, 204, 102, 0.5)',
                        'rgba(102, 204, 255, 0.5)',
                        'rgba(204, 102, 255, 0.5)',
                        'rgba(255, 153, 204, 0.5)',
                        'rgba(204, 255, 153, 0.5)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(199, 199, 199, 1)',
                        'rgba(83, 102, 255, 1)',
                        'rgba(255, 102, 255, 1)',
                        'rgba(102, 255, 204, 1)',
                        'rgba(255, 204, 102, 1)',
                        'rgba(102, 204, 255, 1)',
                        'rgba(204, 102, 255, 1)',
                        'rgba(255, 153, 204, 1)',
                        'rgba(204, 255, 153, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: 'Eventos totales por categoría'
                    }
                }
            }
        });
    })
    .catch(error => {
        console.error('Error al obtener estadísticas:', error);
    });
