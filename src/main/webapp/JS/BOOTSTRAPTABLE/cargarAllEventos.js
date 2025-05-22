$(function () {
    $('#tablaEventos').bootstrapTable({
        url: 'CargarAllEventosAjax',
        height: 660,
        striped: true,
        search: true,
        pagination: true,
        pageSize: 10,
        pageList: [5, 10, 20, 50],
        formatShowingRows: function (pageFrom, pageTo, totalRows) {
            return `Mostrando eventos del ${pageFrom} al ${pageTo} de un total de ${totalRows}`;
        },
        formatRecordsPerPage: function (pageNumber) {
            return `Eventos por página: ${pageNumber}`;
        },
        paginationHAlign: 'left',
        paginationDetailHAlign: 'right',
        showColumns: true,
        columns: [
            {
                field: 'idEvento',
                title: 'ID',
                sortable: true
            },
            {
                field: 'titulo',
                title: 'Título',
                sortable: true
            },
            {
                field: 'categoria',
                title: 'Categoría',
                sortable: true
            },
            {
                field: 'subcategoria',
                title: 'Subcategoría',
                sortable: true
            },
            {
                field: 'estado',
                title: 'Estado',
                sortable: true
            },
            {
                field: 'creador',
                title: 'Creador',
                sortable: true
            },
            {
                field: 'fechaInicio',
                title: 'Inicio',
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
                        mostrarModalDetallesEvento(row);
                    }
                }
            }
        ]
    });
});

function mostrarModalDetallesEvento(row) {
    const modalBody = document.getElementById('modalDetallesEventoBody');

    modalBody.innerHTML = `
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <dl>
                        <dt class="fw-bold">Título:</dt>
                        <dd>${row.titulo}</dd>

                        <dt class="fw-bold">Descripción:</dt>
                        <dd>${row.descripcion}</dd>

                        <dt class="fw-bold">Fecha de inicio:</dt>
                        <dd>${row.fechaInicio}</dd>

                        <dt class="fw-bold">Fecha de fin:</dt>
                        <dd>${row.fechaFin}</dd>

                        <dt class="fw-bold">Tipo evento:</dt>
                        <dd>${row.modo}</dd>
                    </dl>
                </div>
                <div class="col-sm-6">
                    <dl>
                        <dt class="fw-bold">Creador:</dt>
                        <dd>${row.creador}</dd>

                        <dt class="fw-bold">Categoría:</dt>
                        <dd>${row.categoria}</dd>

                        <dt class="fw-bold">Subcategoría:</dt>
                        <dd>${row.subcategoria}</dd>

                        <dt class="fw-bold">Localidad:</dt>
                        <dd>${row.localidad}</dd>

                        <dt class="fw-bold">Provincia:</dt>
                        <dd>${row.provincia}</dd>

                        <dt class="fw-bold">Estado:</dt>
                        <dd>${row.estado}</dd>

                        <dt class="fw-bold">Participantes:</dt>
                        <dd>${row.totalParticipantes || 0} / ${row.numParticipantes}</dd>
                    </dl>
                </div>
            </div>
        </div>
    `;

    const modal = new bootstrap.Modal(document.getElementById('modalDetallesEvento'));
    modal.show();
    document.activeElement.blur();
}

