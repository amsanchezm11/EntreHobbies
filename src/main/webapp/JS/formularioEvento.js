let currentStep = 0;

document.addEventListener("DOMContentLoaded", () => {
    const steps = document.querySelectorAll('.step');

    function showStep(n) {
        steps.forEach((step, index) => {
            step.classList.toggle('active', index === n);
        });
    }

    window.nextStep = function () {
        if (currentStep < steps.length - 1) {
            currentStep++;
            showStep(currentStep);
        }
    };

    window.prevStep = function () {
        if (currentStep > 0) {
            currentStep--;
            showStep(currentStep);
        }
    };

    // document.getElementById('multiStepForm').addEventListener('submit', function (e) {
    //     e.preventDefault();
    //     alert('Formulario enviado correctamente');
    // });


    document.getElementById("descripcion").addEventListener('input', updateCharCount);
});


function updateCharCount() {
    const descripcion = document.getElementById('descripcion');
    const charCount = document.getElementById('charCount');
    const maxLength = descripcion.getAttribute('maxlength');
    const currentLength = descripcion.value.length;
    charCount.textContent = `${currentLength}/${maxLength} caracteres`;
}