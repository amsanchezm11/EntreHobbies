window.addEventListener('scroll', function() {
    var navbar = document.getElementById('navbar');

    if (navbar !== null){
        if (window.scrollY > 95) {
            navbar.classList.add('navbar-transparent');
        } else {
            navbar.classList.remove('navbar-transparent');
        }
    }
});




