// Obtener el tema almacenado en localStorage o establecer 'light' por defecto
const savedTheme = localStorage.getItem('theme') || 'light';

// Aplicar el tema al elemento HTML
document.documentElement.setAttribute('data-bs-theme', savedTheme);

// Función para cambiar el tema
function toggleTheme() {
    const currentTheme = document.documentElement.getAttribute('data-bs-theme');
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-bs-theme', newTheme);
    localStorage.setItem('theme', newTheme);
}

// Añadir la clase 'theme-transition' para animaciones
document.documentElement.classList.add('theme-transition');

// Asignar la función al evento de clic del botón de tema
document.getElementById('themeIcon').addEventListener('click', toggleTheme);
