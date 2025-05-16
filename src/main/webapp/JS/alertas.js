document.addEventListener("DOMContentLoaded", function () {
    const alerta = document.getElementById("aviso");
    const error = document.getElementById("error");
    if (alerta) {
        setTimeout(() => {
            alerta.classList.remove("show");
            alerta.classList.add("fade");
            setTimeout(() => {
                alerta.remove();
            }, 300);
        }, 3000);
    }

    if (error) {
        setTimeout(() => {
            error.classList.remove("show");
            error.classList.add("fade");
            setTimeout(() => {
                error.remove();
            }, 300);
        }, 3000);
    }
});