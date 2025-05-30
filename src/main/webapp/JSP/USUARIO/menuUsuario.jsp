<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="EntreHobbies"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/COMPONENTES/alertas.js" defer></script>
    <script type="module" src="${contexto}/JS/VISTAS/index.js" defer></script>
</head>
<body class="landing-page position-relative w-100">

<c:import url="/INC/navbarUsuario.jsp"/>

<section class="bloque d-flex flex-column gap-4 bg-gradient-morado-blanco text-light">
    <h2 class="text-center mb-4 text-footer">¡Bienvenido a EntreHobbies!</h2>

    <c:if test="${requestScope.aviso != null}">
        <div id="aviso"
             class="notification"
             role="alert"
             style="pointer-events: none;">
            <div class="notification-body">
                <i class="bi bi-check-circle-fill me-2"></i>
                <span>${requestScope.aviso}</span>
                <div class="notification-progress"></div>
            </div>
        </div>
    </c:if>

    <c:if test="${requestScope.error != null}">
        <div id="aviso"
             class="notification-danger"
             role="alert"
             style="pointer-events: none;">
            <div class="notification-body">
                <i class="bi bi-check-circle-fill me-2"></i>
                <span>${requestScope.error}</span>
                <div class="notification-danger-progress"></div>
            </div>
        </div>
    </c:if>

    <form class="container" action="${contexto}/FrontController" method="post">
        <div class="row text-center justify-content-center">

            <div class="col-md-4 mb-4">
                <button type="submit" name="accion" value="Mi-Cuenta" title="Acceder a mi cuenta"
                        class="card-btn h-100 rounded-3 p-2 sombra-morada-btn text-dark w-100 d-flex flex-column align-items-center">
                    <img src="${contexto}/IMG/GENERAL/perfilusuario.svg" alt="Perfil"
                         class="card-img-top img-fluid mx-auto" style="max-width: 50%; height: 150px;">
                    <div class="card-body p-2">
                        <h5 class="fw-bold">Mi Cuenta</h5>
                        <p>Accede a tu perfil para gestionar tu informaci&oacute;n, eventos y participaciones.</p>
                    </div>
                </button>
            </div>

            <div class="col-md-4 mb-4">
                <button type="submit" name="accion" value="Ver-Categorias" title="Buscar eventos"
                        class="card-btn h-100 rounded-3 p-2 sombra-morada-btn text-dark w-100 d-flex flex-column align-items-center">
                    <img src="${contexto}/IMG/GENERAL/buscar.svg" alt="Buscar eventos"
                         class="card-img-top img-fluid mx-auto" style="max-width: 50%; height: 150px;">
                    <div class="card-body p-2">
                        <h5 class="fw-bold">Buscar eventos</h5>
                        <p>Explora y encuentra eventos que te interesen.</p>
                    </div>
                </button>
            </div>

            <div class="col-md-4 mb-4">
                <button type="submit" name="accion" value="Crear-Evento" title="Crear nuevo evento"
                        class="card-btn h-100 rounded-3 p-2 sombra-morada-btn text-dark w-100 d-flex flex-column align-items-center">
                    <img src="${contexto}/IMG/GENERAL/nuevoevento.svg" alt="Crear evento"
                         class="card-img-top img-fluid mx-auto" style="max-width: 50%; height: 150px;">
                    <div class="card-body p-2">
                        <h5 class="fw-bold">Crear Evento</h5>
                        <p>¿Tienes un plan en mente? Comp&aacute;rtelo con la comunidad.</p>
                    </div>
                </button>
            </div>

            <div class="col-md-4 mb-4">
                <button type="submit" name="accion" value="Mis-Eventos" title="Acceder a mis eventos"
                        class="card-btn h-100 rounded-3 p-2 sombra-morada-btn text-dark w-100 d-flex flex-column align-items-center">
                    <img src="${contexto}/IMG/GENERAL/eventos.svg" alt="Eventos organizados"
                         class="card-img-top img-fluid mx-auto" style="max-width: 50%; height: 150px;">
                    <div class="card-body p-2">
                        <h5 class="fw-bold">Mis Eventos</h5>
                        <p>Consulta los eventos que has organizado recientemente.</p>
                    </div>
                </button>
            </div>

            <div class="col-md-4 mb-4">
                <button type="submit" name="accion" value="Mis-Participaciones" title="Ver mis participaciones"
                        class="card-btn h-100 rounded-3 p-2 sombra-morada-btn text-dark w-100 d-flex flex-column align-items-center">
                    <img src="${contexto}/IMG/GENERAL/participaciones.svg" alt="Participaciones"
                         class="card-img-top img-fluid mx-auto" style="max-width: 50%; height: 150px;">
                    <div class="card-body p-2">
                        <h5 class="fw-bold">Mis Participaciones</h5>
                        <p>Consulta los eventos a los que te has unido recientemente.</p>
                    </div>
                </button>
            </div>

            <div class="col-md-4 mb-4">
                <button type="submit" name="accion" value="Informacion" title="Informaci&oacute;n"
                        class="card-btn h-100 rounded-3 p-2 sombra-morada-btn text-dark w-100 d-flex flex-column align-items-center">
                    <img src="${contexto}/IMG/GENERAL/informacion.svg" alt="Informaci&oacute;n"
                         class="card-img-top img-fluid mx-auto" style="max-width: 50%; height: 150px;">
                    <div class="card-body p-2">
                        <h5 class="fw-bold">Informaci&oacute;n</h5>
                        <p>Obt&eacute;n m&aacute;s detalles y ayuda sobre la plataforma.</p>
                    </div>
                </button>
            </div>

        </div>
    </form>

</section>


<section class="bloque d-flex flex-column gap-5">
    <h1 class="fw-bold text-titulo">Explora, comparte y vive tu hobby</h1>
    <div class="container">
        <div class="row text-center justify-content-center">
            <div class="col-md-4 mb-4">
                <div class="card h-100 rounded-3 p-3 sombra-morada">
                    <img src="${contexto}/IMG/GENERAL/conoce.svg" class="card-img-top img-fluid mx-auto"
                         alt="Conoce a gente" style="max-width: 65%; height: 200px;">
                    <div class="card-body">
                        <h5 class="fw-bold">Conoce</h5>
                        <p>Descubre personas con tus mismos intereses.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 rounded-3 p-3 sombra-morada">
                    <img src="${contexto}/IMG/GENERAL/comparte.svg" class="card-img-top img-fluid mx-auto"
                         alt="Comparte tu afici&oacute;n" style="max-width: 65%; height: 200px;">
                    <div class="card-body">
                        <h5 class="fw-bold">Comparte</h5>
                        <p>Haz que tus aficiones lleguen a m&aacute;s personas.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 rounded-3 p-3 sombra-morada">
                    <img src="${contexto}/IMG/GENERAL/calendario.svg" class="card-img-top img-fluid mx-auto"
                         alt="Crea tus planes" style="max-width: 65%; height: 200px;">
                    <div class="card-body">
                        <h5 class="fw-bold">Crea</h5>
                        <p>Organiza planes &uacute;nicos para disfrutar en grupo.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="bloque bg-gradient-morado-blanco text-light">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
                <h1 class="fw-bold fs-1 text-center">Explora nuestras categor&iacute;as</h1>
                <p class="fs-4 text-center">Encuentra eventos seg&uacute;n tus intereses y &uacute;nete f&aacute;cilmente.</p>
                <form action="${contexto}/FrontController" method="post"
                      class="d-flex justify-content-center align-items-center">
                    <button type="submit" class="btn btn-main mt-2 btn-lg" name="accion" value="Ver-Categorias">Categor&iacute;as</button>
                </form>
            </div>
            <div class="col-md-6 text-center">
                <img src="${contexto}/IMG/GENERAL/categorias.svg" class="img-fluid" style="max-width: 80%;">
            </div>
        </div>
    </div>
</section>

<%--<section class="bloque d-flex flex-column gap-5">--%>
<%--    <h1 class="fw-bold text-titulo">Encuentra eventos, &úacute;nete a la comunidad y disfruta</h1>--%>
<%--    <div class="container">--%>
<%--        <div class="row justify-content-center text-center">--%>
<%--            <div class="col-md-5 mb-4">--%>
<%--                <div class="card h-100 p-3">--%>
<%--                    <img src="${contexto}/IMG/GENERAL/buscar.svg" class="card-img-top img-fluid align-self-center m-2" alt="Busca eventos"--%>
<%--                         style="max-width: 65%; height: 200px;">--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="fw-bold">Busca eventos</h5>--%>
<%--                        <p>Filtra por subcategor&iacute;as, provincia y m&aacute;s para encontrar tu plan ideal.</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-5 mb-4">--%>
<%--                <div class="card h-100 p-3">--%>
<%--                    <img src="${contexto}/IMG/GENERAL/unirse.svg" class="card-img-top img-fluid align-self-center m-2"--%>
<%--                         alt="&uacute;nete a un evento" style="max-width: 65%; height: 200px;">--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="fw-bold">Ap&uacute;ntate</h5>--%>
<%--                        <p>Haz clic y empieza a disfrutar con otros usuarios.</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<section class="bloque">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-center">
                <h2 class="fw-bold fs-1">Busca eventos</h2>
                <p class="fs-4">Filtra por subcategor&iacute;as, provincia y m&aacute;s para encontrar tu plan ideal.</p>
            </div>
            <div class="col-md-6 text-center">
                <img src="${contexto}/IMG/GENERAL/buscar.svg" class="img-fluid" style="max-width: 80%; height: auto;" alt="Busca eventos">
            </div>
        </div>
    </div>
</section>

<section class="bloque bg-gradient-morado-blanco text-light">
    <div class="container">
        <div class="row align-items-center flex-md-row-reverse">
            <div class="col-md-6 text-center text-md-center">
                <h2 class="fw-bold fs-1">Ap&uacute;ntate</h2>
                <p class="fs-4">Descubre eventos pensados para ti y &uacute;nete f&aacute;cilmente al que quieras. ¡Tu pr&oacute;xima experiencia te espera!</p>
            </div>
            <div class="col-md-6 text-center">
                <img src="${contexto}/IMG/GENERAL/unirse.svg" class="img-fluid" style="max-width: 80%; height: auto;" alt="&uacute;nete a un evento">
            </div>
        </div>
    </div>
</section>

<c:if test="${sessionScope.usuario != null}">
    <form action="${contexto}/FrontController" method="post">
        <button type="submit"
                name="accion"
                value="Crear-Evento"
                class="btn btn-main rounded-circle shadow-lg position-fixed"
                style="bottom: 2rem; right: 2rem; width: 60px; height: 60px;"
                title="Crear evento">
            <i class="bi bi-plus-lg fs-4"></i>
        </button>
    </form>
</c:if>

<section class="bloque-footer text-center d-flex justify-content-center align-items-center">
    <div>
        <h2 class="text-footer color-pm">Haz que cada momento cuente</h2>
        <p class="fs-4">Con EntreHobbies, tus hobbies se convierten en experiencias inolvidables.</p>
        <p class="fs-4">¡Crea, comparte y disfruta con otros apasionados!</p>
    </div>

</section>

<div id="scroll-down" class="scroll-arrow" title="Desplazar hacia abajo" aria-label="Desplazar hacia abajo" role="button" tabindex="0">
    <svg height="30" width="30" viewBox="0 0 24 24" role="img" aria-hidden="true" fill="white">
        <path d="M23.7 8.7 12 20.42.3 8.71l1.4-1.42L12 17.6 22.3 7.3z"></path>
    </svg>
</div>
<c:import url="/INC/pie.inc"/>

</body>
</html>
