//---------------------------------------
// Inicializamos los popovers de Boostrap
//---------------------------------------
document.addEventListener('DOMContentLoaded', function () {
    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
    popoverTriggerList.forEach(function (el) {
        new bootstrap.Popover(el);
    });
});
