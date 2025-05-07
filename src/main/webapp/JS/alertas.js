document.addEventListener("DOMContentLoaded", function () {
    const alerta = document.getElementById("aviso");
    if (alerta) {
        setTimeout(() => {
            alerta.classList.remove("show");
            alerta.classList.add("fade");
            setTimeout(() => {
                alerta.remove();
            }, 300);
        }, 3000);
    }
});