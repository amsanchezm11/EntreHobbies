$(function () {
    $('#tablaUsuarios').bootstrapTable({
        url: 'CargarAllUsuariosAjax',
        height: 660,
        striped: true,
        search: true,
        pagination: true,
        pageSize: 10,
        pageList: [5, 10, 20, 50],
        formatShowingRows: function (pageFrom, pageTo, totalRows) {
            return `Mostrando usuarios del ${pageFrom} al ${pageTo} de un total de ${totalRows}`;
        },
        formatRecordsPerPage: function (pageNumber) {
            return `Usuarios por página: ${pageNumber}`;
        },
        formatNoMatches: function () {
            return 'No se encontraron categorías que coincidan con la búsqueda.';
        },
        paginationHAlign: 'left',
        paginationDetailHAlign: 'right',
        showColumns: true,
        columns: [
            {
                field: 'idUsuario',
                title: 'ID',
                sortable: true
            },
            {
                field: 'nombre',
                title: 'Nombre',
                sortable: true
            },
            {
                field: 'apellidos',
                title: 'Apellidos',
                sortable: true
            },
            {
                field: 'username',
                title: 'Usuario',
                sortable: true
            },
            {
                field: 'email',
                title: 'Email',
                sortable: true
            },
            {
                field: 'acciones',
                title: 'Acciones',
                align: 'center',
                formatter: function () {
                    return '<button class="btn btn-main btn-sm ver-detalles">Detalles</button>';
                },
                events: {
                    'click .ver-detalles': function (e, value, row) {
                        mostrarModalDetalles(row);
                    }
                }
            }
        ]
    });
});

function mostrarModalDetalles(row) {
    const modalBody = document.getElementById('modalDetallesBody');

    modalBody.innerHTML = `
        <div class="text-center mb-4">
            <img src="IMG/AVATARES/${row.avatar || 'avatar.svg'}" 
                 alt="Avatar de ${row.nombre}" 
                 class="rounded-circle" 
                 width="120" height="120"
                 onerror="this.onerror=null; this.src='IMG/AVATARES/avatar.svg';">
        </div>

        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <dl>
                        <dt class="fw-bold">Nombre:</dt>
                        <dd>${row.nombre}</dd>

                        <dt class="fw-bold">Usuario:</dt>
                        <dd>${row.username}</dd>

                        <dt class="fw-bold">Teléfono:</dt>
                        <dd>${row.telefono}</dd>

                        <dt class="fw-bold">Localidad:</dt>
                        <dd>${row.localidad}</dd>

                        <dt class="fw-bold">Eventos creados:</dt>
                        <dd>${row.eventosCreados || 0}</dd>
                    </dl>
                </div>
                <div class="col-sm-6">
                    <dl>
                        <dt class="fw-bold">Apellidos:</dt>
                        <dd>${row.apellidos}</dd>

                        <dt class="fw-bold">Email:</dt>
                        <dd>${row.email}</dd>

                        <dt class="fw-bold">Fecha de nacimiento:</dt>
                        <dd>${row.fechaNacimiento}</dd>

                        <dt class="fw-bold">Provincia:</dt>
                        <dd>${row.provincia}</dd>

                        <dt>Eventos participados:</dt>
                        <dd>${row.eventosParticipados || 0}</dd>
                    </dl>
                </div>
            </div>
        </div>
    `;

    const modal = new bootstrap.Modal(document.getElementById('modalDetallesUsuario'));
    modal.show();
    document.activeElement.blur();
}