$(function () {
    $('#tablaUsuarios').bootstrapTable({
        url: 'CargarAllUsuariosAjax',
        height: 600,
        detailView: true,
        detailViewByClick: true,
        detailFormatter: function (index, row) {
            return `
      <div class="p-3 bg-light rounded border">
        <dl class="row mb-0">
          <dt class="col-sm-4">Teléfono:</dt>
          <dd class="col-sm-8">${row.telefono || 'N/A'}</dd>

          <dt class="col-sm-4">Fecha de nacimiento:</dt>
          <dd class="col-sm-8">${row.fechaNacimiento || 'N/A'}</dd>

          <dt class="col-sm-4">Localidad:</dt>
          <dd class="col-sm-8">${row.localidad || 'N/A'}</dd>

          <dt class="col-sm-4">Provincia:</dt>
          <dd class="col-sm-8">${row.provincia || 'N/A'}</dd>

          <dt class="col-sm-4">Eventos creados:</dt>
          <dd class="col-sm-8">${row.eventosCreados || 0}</dd>

          <dt class="col-sm-4">Eventos participados:</dt>
          <dd class="col-sm-8">${row.eventosParticipados || 0}</dd>
        </dl>
      </div>
    `;
        },
        showColumns: true,
        detailViewIcon: false,
        striped: true,
        search: true,
        pagination: true,
        pageSize: 10,
        pageList: [5, 10, 20, 50],
        formatShowingRows: function(pageFrom, pageTo, totalRows) {
            return `Mostrando usuarios del ${pageFrom} al ${pageTo} de un total de ${totalRows}`;
        },
        columns: [{
            field: 'idUsuario',
            title: 'ID',
            sortable: true
        }, {
            field: 'nombre',
            title: 'Nombre',
            sortable: true
        }, {
            field: 'apellidos',
            title: 'Apellidos',
            sortable: true
        }, {
            field: 'username',
            title: 'Usuario',
            sortable: true
        }, {
            field: 'email',
            title: 'Email',
            sortable: true
        }],
        paginationHAlign: 'left',
        paginationDetailHAlign: 'right',
    });
});

