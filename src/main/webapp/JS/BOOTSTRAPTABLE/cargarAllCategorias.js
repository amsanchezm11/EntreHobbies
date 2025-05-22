$(function () {
    $('#tablaCategorias').bootstrapTable({
        url: 'CargarAllCategoriasAjax',
        height: 660,
        striped: true,
        search: true,
        pagination: true,
        pageSize: 10,
        pageList: [5, 10, 20, 50],
        formatShowingRows: function (pageFrom, pageTo, totalRows) {
            return `Mostrando categorías del ${pageFrom} al ${pageTo} de un total de ${totalRows}`;
        },
        formatRecordsPerPage: function (pageNumber) {
            return `Categorías por página: ${pageNumber}`;
        },
        formatNoMatches: function () {
            return 'No se encontraron categorías que coincidan con la búsqueda.';
        },
        paginationHAlign: 'left',
        paginationDetailHAlign: 'right',
        showColumns: true,
        columns: [
            {
                field: 'idCategoria',
                title: 'ID',
                sortable: true
            },
            {
                field: 'nombre',
                title: 'Nombre',
                sortable: true
            },
            {
                field: 'imagen',
                title: 'Imagen',
                formatter: function (value, row) {
                    const src = `IMG/CATEGORIAS/${value || 'categoria.svg'}`;
                    return `
            <div class="d-flex justify-content-center align-items-center" style="height: 60px;">
                <img src="${src}" alt="Imagen de ${row.nombre}" width="50" height="50"
                     onerror="this.onerror=null;this.src='IMG/CATEGORIAS/categoria.svg';" />
            </div>
        `;
                }
            },
            {
                field: 'subcategorias',
                title: 'Nº Subcategorías',
                formatter: function (value) {
                    return value ? value.length : 0;
                }
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
                        mostrarModalCategoria(row);
                    }
                }
            }
        ]
    });
});

function mostrarModalCategoria(row) {
    const modalBody = document.getElementById('modalDetallesCategoriaBody');

    const listaSubcategorias = (row.subcategorias && row.subcategorias.length > 0)
        ? `<ul>${row.subcategorias.map(s => `<li>${s.nombre}</li>`).join('')}</ul>`
        : '<p class="text-muted">Sin subcategorías asociadas.</p>';

    modalBody.innerHTML = `
        <div class="text-center mb-3 d-flex justify-content-center align-items-center">
            <img src="IMG/CATEGORIAS/${row.imagen || 'categoria.svg'}"
                 alt="Imagen de ${row.nombre}"
                 class="rounded"
                 width="120" height="120"
                 onerror="this.onerror=null; this.src='IMG/CATEGORIAS/categoria.svg';">
        </div>
        <h5 class="text-center">${row.nombre}</h5>
        <hr>
        <h6>Subcategorías:</h6>
        ${listaSubcategorias}
    `;

    const modal = new bootstrap.Modal(document.getElementById('modalDetallesCategoria'));
    modal.show();
    document.activeElement.blur();
}
