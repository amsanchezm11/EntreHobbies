fetch('Ajax', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: 'accion=Usuarios-sexo'
})
    .then(response => response.json())
    .then(data => {
        const labels = Object.keys(data);
        const values = Object.values(data);

        const ctx = document.getElementById('usuariosSexoChart').getContext('2d');

        const config = {
            type: 'doughnut',
            data: {
                labels: labels,
                datasets: [{
                    data: values,
                    backgroundColor: [
                        'rgba(167, 140, 222, 0.6)',
                        'rgba(111, 66, 193, 0.6)',
                        'rgba(75, 30, 138, 0.6)'
                    ],
                    borderColor: [
                        'rgba(167, 140, 222, 1)',
                        'rgba(111, 66, 193, 1)',
                        'rgba(75, 30, 138, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top'
                    },
                    title: {
                        display: true,
                        text: 'Usuarios totales por Sexo'
                    }
                }
            }
        };

        new Chart(ctx, config);
    })
    .catch(error => {
        console.error('Error al obtener usuarios por sexo:', error);
    });
