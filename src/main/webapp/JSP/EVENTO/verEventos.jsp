<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Eventos" />
        <jsp:param name="estilo" value="${estilo}" />
    </jsp:include>
    <%--    <script type="module" src="${contexto}/JS/index.js" defer></script>--%>
</head>
<body class="bg-body text-body position-relative w-100 bg-gradient-morado-blanco">
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
    <h1 class="text-light">Eventos de ${requestScope.eventos[10]}</h1>
</div>

<div class="container my-5">
    <c:forEach var="evento" items="${requestScope.eventos}" varStatus="status">
        <c:if test="${status.index % 2 == 0}">
            <div class="row justify-content-center mb-4">
        </c:if>

        <div class="col-md-6 mb-4">
            <div class="card shadow rounded-4 d-flex flex-column h-100" style="min-height: 500px;">
                <!-- Imagen del evento (arriba) -->
                <img src="${contexto}/IMG/CATEGORIAS/${evento[11]}"
                     class="card-img-top img-fluid rounded-circle"
                     alt="Imagen del evento"
                     style="object-fit: contain; height: 200px; width: 200px; margin: 0 auto;">

                <!-- Contenido de la tarjeta -->
                <div class="card-body d-flex flex-column h-100">
                    <h5 class="card-title fw-bold">${evento[1]}</h5>
                    <p class="text-muted small mb-2">${evento[2]}</p>

                    <div class="mb-2">
                        <div class="d-flex justify-content-between align-items-center">
                            <small><i class="bi bi-people-fill me-2"></i> Participantes</small>
                            <small><strong>${evento[14]} / ${evento[6]}</strong></small>
                        </div>
                        <div class="progress rounded-pill" style="height: 6px;">
                            <div class="progress-bar" role="progressbar"
                                 style="width: ${(evento[14] / evento[6]) * 100}%;"
                                 aria-valuenow="${evento[14]}" aria-valuemin="0" aria-valuemax="${evento[6]}">
                            </div>
                        </div>
                    </div>

                    <div class="row text-center small text-muted">
                        <div class="col"><i class="bi bi-calendar-event me-1"></i>Empieza: ${evento[4]}</div>
                        <div class="col"><i class="bi bi-calendar-check me-1"></i>Acaba: ${evento[5]}</div>
                    </div>

                    <hr class="my-2">

                    <p class="card-text small mb-1"><i class="bi bi-card-text me-2"></i><strong>Fecha creaci&oacute;n:</strong> ${evento[3]}</p>
                    <p class="card-text small mb-1"><i class="bi bi-tags me-2"></i><strong>Subcategor&iacute;a:</strong> ${evento[12]}</p>
                    <p class="card-text small mb-1"><i class="bi bi-geo me-2"></i><strong>Direcci&oacute;n:</strong> ${evento[7]}</p>
                    <p class="card-text small mb-1"><i class="bi bi-globe me-2"></i><strong>Localidad:</strong> ${evento[8]}, ${evento[9]}</p>
                    <p class="card-text small mb-3"><i class="bi bi-person me-2"></i><strong>Creador:</strong> ${evento[13]}</p>

                    <div class="mt-auto">
                        <button class="btn btn-main btn-sm rounded-pill w-100"><i class="bi bi-check2-circle me-2"></i>Apuntarse</button>
                    </div>
                </div>
            </div>
        </div>

        <c:if test="${status.index % 2 == 1 || status.last}">
            </div>
        </c:if>
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

