document.addEventListener("DOMContentLoaded", function () {
    const buttons = document.querySelectorAll('[data-target]');
    const cards = {
        info: document.getElementById("card-info"),
        password: document.getElementById("card-password"),
        avatar: document.getElementById("card-avatar")
    };

    // Función para activar una sección
    function activateSection(target) {
        // Ocultamos todas las tarjetas
        Object.values(cards).forEach(card => card.classList.add("d-none"));

        // Mostramos la tarjeta correspondiente
        if (cards[target]) {
            cards[target].classList.remove("d-none");
        }

        // Quitamos los estilos activos de todos los botones
        buttons.forEach(b => {
            b.classList.remove("link-activo");
            b.classList.add("text-dark");
        });

        // Aplicamos el estilo activo al botón correspondiente
        const activeBtn = document.querySelector(`[data-target="${target}"]`);
        if (activeBtn) {
            activeBtn.classList.add("link-activo");
            activeBtn.classList.remove("text-dark");
        }
    }

    // Asignamos el evento a cada botón
    buttons.forEach(btn => {
        btn.addEventListener("click", () => {
            const target = btn.getAttribute("data-target");
            activateSection(target);
        });
    });

    // Activamos por defecto la sección 'info' al cargar la página
    activateSection("info");
});