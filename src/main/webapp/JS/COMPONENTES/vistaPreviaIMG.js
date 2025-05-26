/*---------------------------------------------[PREVIEW-IMG]---------------------------------------------------------------*/
/*-----------------------------------------------[AVATAR]------------------------------------------------------------------*/

document.getElementById('avatar').addEventListener('change', function (event) {
    let imgNueva = event.target.files[0];
    let vistaPrevia = document.getElementById('vista-previa-avatar');
    if (imgNueva) {
        let lector = new FileReader();

        lector.onload = function (e) {

            vistaPrevia.src = e.target.result;
        };

        lector.readAsDataURL(imgNueva);
    }
});