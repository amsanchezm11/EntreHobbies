<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="estilo" value="/CSS/style.css" scope="application" />
<c:set var="contexto" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="EntreHobbies" />
        <jsp:param name="estilo" value="${estilo}" />
    </jsp:include>
</head>
<body class="bg-body text-body position-relative overflow-hidden w-100">

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


<img src="${contexto}/IMG/CATEGORIAS/videojuegos.jpg"
     class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover z-n1"
     alt="Fondo de videojuegos">

<div class="container py-5">
    <h1 class="text-center text-light">Entre Hobbies</h1>
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

<c:import url="/INC/pie.inc"/>
</body>
</html>
