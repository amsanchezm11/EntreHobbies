window.addEventListener('scroll', function() {
    var navbar = document.getElementById('navbar');

    if (navbar !== null){
        if (window.scrollY > 95) {
            navbar.classList.add('navbar-transparent');
        } else {
            navbar.classList.remove('navbar-transparent');
        }
    }

    toggleScrollDownButton();
});

document.addEventListener('DOMContentLoaded', () => {
    const scrollDownBtn = document.getElementById('scroll-down');
    if(scrollDownBtn) {
        scrollDownBtn.addEventListener('click', () => {
            window.scrollBy({
                top: window.innerHeight,
                behavior: 'smooth'
            });
        });
    }
    toggleScrollDownButton();
});

function toggleScrollDownButton() {
    const scrollDownBtn = document.getElementById('scroll-down');
    if (!scrollDownBtn) return;

    const scrollTop = window.scrollY || document.documentElement.scrollTop;
    const windowHeight = window.innerHeight;
    const docHeight = Math.max(
        document.body.scrollHeight, document.documentElement.scrollHeight,
        document.body.offsetHeight, document.documentElement.offsetHeight,
        document.body.clientHeight, document.documentElement.clientHeight
    );

    if (scrollTop + windowHeight >= docHeight - 60) {
        scrollDownBtn.style.opacity = '0';
        scrollDownBtn.style.pointerEvents = 'none';
    } else {
        scrollDownBtn.style.opacity = '1';
        scrollDownBtn.style.pointerEvents = 'auto';
    }
}

