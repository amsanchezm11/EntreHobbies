<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Resumen de Categorías"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/BOOTSTRAPTABLE/cargarAllCategorias.js" defer></script>
</head>
<body class="d-flex flex-column body-custom position-relative w-100 bg-light">
<div class="container-fluid">
    <div class="row">

        <div class="col-md-3 col-lg-2">
            <jsp:include page="/INC/menuAdministrador.jsp"/>
        </div>

        <div class="col-md-9 col-lg-10 mt-4">
            <h2 class="color-pm text-center text-footer">Resumen de Categorías</h2>

            <table id="tablaCategorias" class="table table-striped">
                <thead>
                <tr>
                    <th data-field="idCategoria">ID</th>
                    <th data-field="nombre">Nombre</th>
                    <th data-field="imagen">Imagen</th>
                    <th data-field="subcategorias">Nº Subcategorías</th>
                    <th data-field="acciones">Acciones</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="modalDetallesCategoria" tabindex="-1" aria-labelledby="modalDetallesCategoriaLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content" style="min-width:600px;">
            <div class="modal-header">
                <h5 class="modal-title" id="modalDetallesCategoriaLabel">Detalles de la Categoría</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body" id="modalDetallesCategoriaBody"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
