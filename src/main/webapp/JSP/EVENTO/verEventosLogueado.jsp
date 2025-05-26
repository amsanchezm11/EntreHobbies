<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Eventos"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/BOOTSTRAPTABLE/cargarParticipantes.js" defer></script>
    <script type="module" src="${contexto}/JS/COMPONENTES/buscadorUsuario.js" defer></script>
    <script type="module" src="${contexto}/JS/COMPONENTES/obtenerSubcategorias.js" defer></script>
    <script type="module" src="${contexto}/JS/COMPONENTES/pintarEventosLogueado.js" defer></script>
    <script type="module" src="${contexto}/JS/COMPONENTES/filtroEventoUsuario.js" defer></script>
</head>
<body class="body-custom position-relative bg-gradient-morado-blanco" data-contexto="${contexto}">

<c:import url="/INC/navbarBusquedaUsuario.jsp"/>

<div style="position: fixed; top: 75px; right: 1rem; z-index: 1000;">
    <form action="${contexto}/FrontController" method="post">
        <button type="submit" class="btn btn-main" name="accion" value="Ver-Categorias">
            <i class="bi bi-arrow-left me-2"></i> Volver a categor&iacute;as
        </button>
    </form>
</div>

<div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1"
     id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title color-pm" id="offcanvasScrollingLabel">Filtros</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <form id="formFiltros" class="h-100 d-flex flex-column justify-content-between" method="post" action="#">

            <div>
                <div class="mb-3">
                    <label for="categoria" class="form-label fw-bold mb-2">Categor&iacute;a</label>
                    <select class="form-select" id="categoria" name="categoria" data-cargar-inicial="true">
                        <option value="${requestScope.categoriaId}" selected>${requestScope.categoria}</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="subcategoria" class="form-label fw-bold mb-2">Subcategor&iacute;a</label>
                    <select class="form-select" id="subcategoria" name="subcategoria">
                    </select>
                </div>
                <div class="mb-3">
                    <label for="provincia" class="form-label fw-bold mb-2">Provincia</label>
                    <select class="form-select" id="provincia" name="provincia" required>
                        <option value="" disabled selected>Selecciona una provincia</option>
                        <c:forEach var="provincia" items="${provincias}">
                            <option value="${provincia[0]}">${provincia[1]}</option>
                        </c:forEach>
                    </select>
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
    <h1 class="text-light text-titulo mt-5 text-center">Eventos de ${requestScope.categoria}</h1>
</div>

<div class="container my-5" id="contenedorEventos">
    <c:forEach var="evento" items="${requestScope.eventos}" varStatus="status">
        <c:if test="${status.index % 2 == 0}">
            <div class="row justify-content-center mb-4">
        </c:if>

        <div class="col-md-6 mb-4">
            <div class="card shadow rounded-4 d-flex flex-column h-100" style="min-height: 500px;">
                <img src="${contexto}/IMG/CATEGORIAS/${evento[11]}"
                     class="card-img-top img-fluid rounded-circle mt-1"
                     alt="Imagen del evento"
                     style="object-fit: contain; height: 200px; width: 200px; margin: 0 auto;">

                <div class="card-body d-flex flex-column h-auto">
                    <h5 class="card-title fw-bold">${evento[1]}</h5>
                    <p class="text-muted small mb-2">${evento[2]}</p>

                    <div class="mb-2">
                        <div class="d-flex justify-content-between align-items-center">
                            <small><i class="bi bi-people-fill me-2"></i> Participantes</small>
                            <small><strong>${evento[14]} / ${evento[6]}</strong></small>
                        </div>
                        <div class="progress rounded-pill" style="height: 6px;">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-morado"
                                 role="progressbar"
                                 style="width: ${(evento[14] / evento[6]) * 100}%;"
                                 aria-valuenow="${evento[14]}" aria-valuemin="0" aria-valuemax="${evento[6]}">
                            </div>
                        </div>
                    </div>

                    <div class="row text-center small text-muted">
                        <div class="col"><i class="bi bi-calendar-event me-1"></i>Empieza: <fmt:formatDate
                                value="${evento[4]}" pattern="dd/MM/yyyy"/></div>
                        <div class="col"><i class="bi bi-calendar-check me-1"></i>Acaba: <fmt:formatDate
                                value="${evento[5]}" pattern="dd/MM/yyyy"/></div>
                    </div>

                    <hr class="my-2">

                    <p class="card-text small mb-1"><i class="bi bi-card-text me-2"></i><strong>Fecha
                        creaci&oacute;n:</strong> <fmt:formatDate value="${evento[3]}" pattern="dd/MM/yyyy" /></p>
                    <p class="card-text small mb-1"><i
                            class="bi bi-tags me-2"></i><strong>Subcategor&iacute;a:</strong> ${evento[12]}</p>
                    <p class="card-text small mb-1"><i
                            class="bi bi-geo me-2"></i><strong>Direcci&oacute;n:</strong> ${evento[7]}</p>
                    <p class="card-text small mb-1"><i
                            class="bi bi-globe me-2"></i><strong>Localidad:</strong> ${evento[8]}, ${evento[9]}</p>
                    <p class="card-text small mb-1"><i
                            class="bi bi-person me-2"></i><strong>Organizador:</strong> ${evento[13]}</p>
                    <p class="card-text small mb-3">
                        <i class="bi bi-info-circle me-2"></i><strong>Estado:</strong>
                        <c:choose>
                            <c:when test="${evento[15] == 'En_Curso'}">
                                <span class="text-info fw-bold fst-italic">En Curso</span>
                            </c:when>
                            <c:when test="${evento[15] == 'Por_Empezar'}">
                                <span class="text-success fw-bold fst-italic">Por Empezar</span>
                            </c:when>
                            <c:otherwise>
                                <span>${evento[15]}</span>
                            </c:otherwise>
                        </c:choose>
                    </p>
                    <div class="d-flex flex-column gap-1">
                        <form action="${contexto}/UsuarioEventoController" method="post" class="mt-auto">
                            <c:choose>
                                <c:when test="${evento[14] >= evento[6] && evento[17] != 'creador' && evento[17] != 'participante'}">
                                    <div class="alert alert-completo text-center p-2 rounded-pill mb-0">
                                        <span>Evento completo</span>
                                    </div>
                                </c:when>

                                <c:when test="${evento[17] == 'creador'}">
                                    <div class="alert alert-creador text-center p-2 rounded-pill mb-0">
                                        <span>Eres el creador del evento</span>
                                    </div>
                                </c:when>

                                <c:when test="${evento[17] == 'participante'}">
                                    <form action="${contexto}/UsuarioEventoController" method="post" class="mt-auto">
                                        <input type="hidden" name="idEvento" value="${evento[0]}">
                                        <button class="btn btn-warning btn-sm rounded-pill w-100" name="accion"
                                                value="Desapuntarse-evento">
                                            <i class="bi bi-x-circle me-2"></i>Desapuntarse
                                        </button>
                                    </form>
                                </c:when>
                                <c:when test="${evento[15] == 'En_Curso'}">
                                    <div class="alert alert-creador text-center p-2 rounded-pill mb-0">
                                        <span>No puedes apuntarte a un evento en curso</span>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <form action="${contexto}/UsuarioEventoController" method="post" class="mt-auto">
                                        <input type="hidden" name="idEvento" value="${evento[0]}">
                                        <button class="btn btn-main btn-sm rounded-pill w-100" name="accion"
                                                value="Unirse-evento">
                                            <i class="bi bi-check2-circle me-2"></i>Apuntarse
                                        </button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </form>
                        <button
                                type="button"
                                class="btn btn-outline-teal btn-sm rounded-pill mt-2 w-100"
                                data-bs-toggle="modal"
                                data-bs-target="#modalParticipantes"
                                data-id-evento="${evento[0]}">
                            <i class="bi bi-people me-2"></i>Ver participantes
                        </button>
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


<div class="modal fade" id="modalParticipantes" tabindex="-1" aria-labelledby="modalParticipantesLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header">
                <h5 class="modal-title" id="modalParticipantesLabel">Participantes</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body">
                <table
                        id="tablaParticipantes"
                        data-bs-toggle="table"
                        data-search="false"
                        data-pagination="false"
                        class="table table-bordered table-hover">
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>