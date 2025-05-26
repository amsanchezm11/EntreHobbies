<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Mis Participaciones"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/BOOTSTRAPTABLE/cargarParticipacionesUsuario.js" defer></script>
</head>
<body class="d-flex flex-column body-custom position-relative w-100 bg-gradient-morado-blanco">

<c:import url="/INC/navbarUsuario.jsp"/>

<div class="container-fluid">
    <div class="row d-flex justify-content-center">

        <div class="col-md-9 col-lg-10 mt-4">
            <h2 class="text-light text-center text-footer">Todas mis participaciones</h2>

            <table id="tablaEventosParticipados" class="table table-striped"
                   data-search="true"
                   data-pagination="true"
                   data-page-size="10"
                   data-page-list="[5,10,20,50]">
                <thead>
                <tr>
                    <th data-field="idEvento" data-sortable="true">ID</th>
                    <th data-field="titulo" data-sortable="true">Título</th>
                    <th data-field="subcategoria" data-sortable="true">Subcategoría</th>
                    <th data-field="fechaInicio" data-sortable="true">Inicio</th>
                    <th data-field="estado" data-sortable="true">Estado</th>
                    <th data-field="acciones" data-align="center">Acciones</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="modalDetallesEvento" tabindex="-1" aria-labelledby="modalDetallesLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content" style="min-width:600px;">
            <div class="modal-header">
                <h5 class="modal-title" id="modalDetallesLabel">Detalles del Evento</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body" id="modalDetallesEventoBody"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
