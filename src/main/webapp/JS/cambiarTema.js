window.onload = () => {
    const themeIcon = document.getElementById('themeIcon');
    const htmlElement = document.documentElement;

    // Obtener el valor del atributo 'data-contexto' del script
    const contexto = document.querySelector('script[data-contexto]').getAttribute('data-contexto');

    // Cargar preferencia guardada desde localStorage
    const savedTheme = localStorage.getItem('theme');

    if (savedTheme) {
        // Si hay un tema guardado, aplicar el tema correspondiente
        htmlElement.setAttribute('data-bs-theme', savedTheme);
        if (themeIcon != null) {
            themeIcon.src = savedTheme === 'dark' ? `${contexto}/IMG/TEMA/Luna.png` : `${contexto}/IMG/TEMA/Sol.png`;
        }
    } else {
        // Si no hay tema guardado, usar el modo claro por defecto
        htmlElement.setAttribute('data-bs-theme', 'light');
        if (themeIcon != null) {
            themeIcon.src = `${contexto}/IMG/TEMA/Sol.png`;
        }
    }

    // Añadir la clase 'theme-transition' para habilitar transiciones suaves
    htmlElement.classList.add('theme-transition');

    if (themeIcon != null) {
        // Hacer clic en el icono para cambiar el tema
        themeIcon.addEventListener('click', () => {
            const currentTheme = htmlElement.getAttribute('data-bs-theme');
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';

            // Cambiar el atributo data-bs-theme
            htmlElement.setAttribute('data-bs-theme', newTheme);

            // Guardar la preferencia en localStorage
            localStorage.setItem('theme', newTheme);

            // Cambiar el ícono según el nuevo tema
            themeIcon.src = newTheme === 'dark' ? `${contexto}/IMG/TEMA/Luna.png` : `${contexto}/IMG/TEMA/Sol.png`;
        });
    }
};
