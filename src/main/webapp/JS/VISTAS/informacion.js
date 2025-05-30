document.addEventListener('DOMContentLoaded', () => {
    const buttons = Array.from(document.querySelectorAll('button[data-target]'));

    function activarSeccion(targetId) {
        document.querySelectorAll('.info-section').forEach(section => {
            section.classList.add('d-none');
        });

        const targetSection = document.getElementById(targetId);
        if (targetSection) {
            targetSection.classList.remove('d-none');
        }
    }

    function actualizarColoresBotones(targetId) {
        buttons.forEach(button => {
            button.classList.remove('link-activo');
            button.classList.add('text-dark');
        });

        const activeBtn = document.querySelector(`button[data-target="${targetId}"]`);
        if (activeBtn) {
            activeBtn.classList.add('link-activo');
            activeBtn.classList.remove('text-dark');
        }
    }

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            const targetId = button.getAttribute('data-target');
            activarSeccion(targetId);
            actualizarColoresBotones(targetId);
        });
    });

    // Activa la sección por defecto al cargar la página
    activarSeccion('homeSection');
    actualizarColoresBotones('homeSection');
});
