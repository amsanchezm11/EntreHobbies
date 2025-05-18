<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Categorías" />
        <jsp:param name="estilo" value="${estilo}" />
    </jsp:include>
</head>
<body class="position-relative body-custom bg-gradient-morado-blanco">
<c:choose>
    <c:when test="${sessionScope.usuario != null}">
        <c:import url="/INC/navbarUsuario.jsp"/>
    </c:when>
    <c:otherwise>
        <c:import url="/INC/navbarDefault.jsp"/>
    </c:otherwise>
</c:choose>

<div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title color-pm" id="offcanvasScrollingLabel">Filtros</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <form id="formFiltros" class="h-100 d-flex flex-column justify-content-between" method="post" action="#">

            <div>
                <div class="mb-3">
                    <label for="categoria" class="form-label fw-bold mb-2">Categor&iacute;a</label>
                    <select class="form-select" id="categoria" name="categoria">
                        <option value="" disabled selected>Selecciona una categor&iacute;a</option>
                        <option value="deportes">Deportes</option>
                        <option value="videojuegos">Videojuegos</option>
                        <option value="lectura">Lectura y Literatura</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="provincia" class="form-label fw-bold mb-2">Provincia</label>
                    <select class="form-select" id="provincia" name="provincia">
                        <option value="" disabled selected>Selecciona una provincia</option>
                        <option value="badajoz">Badajoz</option>
                        <option value="caceres">Cáceres</option>
                        <option value="sevilla">Sevilla</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold mb-2">Rango de fechas</label>
                    <div class="d-flex flex-column flex-md-row gap-2">
                        <div class="flex-fill">
                            <label for="fechaInicio" class="form-label">Desde</label>
                            <input type="date" class="form-control" id="fechaInicio" name="fechaInicio">
                        </div>
                        <div class="flex-fill">
                            <label for="fechaLimite" class="form-label">Hasta</label>
                            <input type="date" class="form-control" id="fechaLimite" name="fechaLimite">
                        </div>
                    </div>
                </div>
            </div>


            <div class="mt-4 align-self-bottom">
                <button type="submit" class="btn btn-main w-100">Aplicar filtros</button>
                <button type="reset" class="btn btn-main w-100">Limpiar filtros</button>
            </div>

        </form>
    </div>
</div>

<div class="mb-5 ps-3 my-3">
    <h1 class="text-light text-login">Categor&iacute;as</h1>
</div>

<div class="row justify-content-center m-5 pb-5">
    <c:forEach var="categoria" items="${requestScope.categorias}">
        <div class="col-md-4 mb-5">
            <form action="${contexto}/FrontController" method="post" class="h-100">
                <input type="hidden" name="idCategoria" value="${categoria[0]}">
                <button type="submit"
                        name="accion"
                        class="card h-100 rounded-5 p-3 border-0 text-decoration-none bg-white text-dark w-100 carta"
                        style="cursor: pointer;"
                        value="${usuario != null ? 'Ver-Eventos-Logueado' : 'Ver-Eventos'}">
                    <c:choose>
                        <c:when test="${not empty categoria[2]}">
                            <img src="${contexto}/IMG/CATEGORIAS/${categoria[2]}"
                                 class="card-img-top img-fluid mx-auto d-block"
                                 alt="${categoria[1]}"
                                 style="max-width: 65%; object-fit: contain; height: 200px;">
                        </c:when>
                        <c:otherwise>
                            <img src="${contexto}/IMG/CATEGORIAS/default.jpg"
                                 class="card-img-top img-fluid mx-auto d-block"
                                 alt="${categoria[1]}"
                                 style="max-width: 65%; object-fit: contain; height: 200px;">
                        </c:otherwise>
                    </c:choose>
                    <div class="card-body">
                        <h5 class="card-title text-center fw-bold">${categoria[1]}</h5>
                    </div>
                </button>
            </form>
        </div>
    </c:forEach>
</div>

<c:if test="${sessionScope.usuario != null}">
    <form action="${contexto}/FrontController" method="post">
        <button type="submit"
                name="accion"
                value="Crear-Evento"
                class="btn btn-main rounded-circle shadow-lg d-flex justify-content-center align-items-center"
                id="botonCrearEvento" title="Crear evento">
            <i class="bi bi-plus-lg fs-3"></i>
        </button>
    </form>
</c:if>

<c:if test="${requestScope.aviso != null}">
    <div id="aviso"
         class="alert alert-success fade show position-fixed bottom-0 start-50 translate-middle-x mb-4 z-3 px-4 py-2"
         role="alert"
         style="width: auto; pointer-events: none;">
        <i class="bi bi-check-circle-fill me-2"></i>
            ${requestScope.aviso}
    </div>
</c:if>

</body>
</html>
