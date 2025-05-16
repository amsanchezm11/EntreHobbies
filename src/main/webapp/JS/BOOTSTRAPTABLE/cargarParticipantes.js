// Obtenemos el contexto de la aplicación (Borrar si no se usa)
const contextPath = '${pageContext.request.contextPath}';

// Formateador que va a mostrar el avatar junto al username del usuario
function formatearParticipante(value, row, index) {
    const avatarUrl = row.avatar || 'IMG/AVATARES/avatar.svg';
    return `
    <div class="d-flex align-items-center">
   <img 
        src="IMG/AVATARES/${avatarUrl}" 
        class="rounded-circle me-2" 
        style="width: 40px; height: 40px; object-fit: cover;"
        onerror="this.onerror=null; this.src='IMG/AVATARES/avatar.svg';">
         <span>${row.nombre}</span>
    </div>
  `;
}

// Inicializamos la tabla una sola vez con la columna que usa el formateador personalizado para mostrar avatar y nombre
$(document).ready(function() {
    $('#tablaParticipantes').bootstrapTable({
        columns: [{
            field: 'username',
            formatter: formatearParticipante
        }],
        data: [],
        pagination: false,
        search: false,
        formatNoMatches: function () {
            return 'No hay participantes registrados en este evento';
        }
    });
});

// Evento para cargar participantes cuando se abre el modal
const modal = document.getElementById('modalParticipantes');
modal.addEventListener('show.bs.modal', function (event) {
    const button = event.relatedTarget;
    const idEvento = button.getAttribute('data-id-evento');

    $('#tablaParticipantes').bootstrapTable('refresh', {
        url: 'CargarParticipantesAjax?idEvento=' + idEvento
    });
});