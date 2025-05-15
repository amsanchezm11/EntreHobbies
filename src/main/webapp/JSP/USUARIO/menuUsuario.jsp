<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="EntreHobbies"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/alertas.js" defer></script>
    <script type="module" src="${contexto}/JS/index.js" defer></script>
</head>
<body class="landing-page position-relative w-100">

<c:import url="/INC/navbarUsuario.jsp"/>

<section class="bloque d-flex flex-column gap-4">
    <h2 class="text-center mb-4 text-footer text-light">¡Bienvenido a EntreHobbies!</h2>

    <div class="row">
        <div class="col-md-6 mb-3 d-flex flex-column gap-3">
            <div class="card card-user h-100 d-flex flex-column justify-content-between p-4">
                <div>
                    <h5 class="fw-bold">¡Bienvenido de nuevo!</h5>
                    <p>Nos alegra verte nuevamente. Disfruta de todas las funcionalidades.</p>
                </div>
                <form action="${contexto}/FrontController" method="post" class="d-flex justify-content-center mt-3">
                    <button type="submit" class="btn btn-main btn-lg" name="accion" value="Mi-Cuenta">Ir a mi perfil</button>
                </form>
            </div>

            <div class="card card-user h-100 d-flex flex-column justify-content-between p-4">
                <div>
                    <h5 class="fw-bold">Ver mis eventos</h5>
                    <p>Consulta los eventos que has organizado.</p>
                </div>
                <form action="${contexto}/FrontController" method="post" class="d-flex justify-content-center mt-3">
                    <button type="submit" class="btn btn-main btn-lg" name="accion" value="Mis-Eventos">Ver eventos</button>
                </form>
            </div>
        </div>

        <div class="col-md-6 mb-3 d-flex flex-column gap-3">
            <div class="card card-user h-100 d-flex flex-column justify-content-between p-4">
                <div>
                    <h5 class="fw-bold">¡Organiza tu evento!</h5>
                    <p>¿Tienes un plan en mente? Comp&aacute;rtelo con la comunidad.</p>
                </div>
                <form action="${contexto}/FrontController" method="post" class="d-flex justify-content-center mt-3">
                    <button type="submit" class="btn btn-main btn-lg" name="accion" value="Crear-Evento">Crear evento</button>
                </form>
            </div>

            <div class="card card-user h-100 d-flex flex-column justify-content-between p-4">
                <div>
                    <h5 class="fw-bold">Ver mis participaciones</h5>
                    <p>Consulta los eventos a los que te has unido.</p>
                </div>
                <form action="${contexto}/FrontController" method="post" class="d-flex justify-content-center mt-3">
                    <button type="submit" class="btn btn-main btn-lg" name="accion" value="Eventos-Apuntados">Ver participaciones</button>
                </form>
            </div>
        </div>
    </div>
</section>

<section class="bloque">
    <div class="container">
        <div class="row text-center justify-content-center">
            <div class="col-md-4 mb-4">
                <div class="card h-100 rounded-3 p-3">
                    <img src="${contexto}/IMG/GENERAL/conoce.svg" class="card-img-top img-fluid mx-auto"
                         alt="Conoce a gente" style="max-width: 65%; height: 200px;">
                    <div class="card-body">
                        <h5 class="fw-bold">Conoce</h5>
                        <p>Descubre personas con tus mismos intereses.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 rounded-3 p-3">
                    <img src="${contexto}/IMG/GENERAL/comparte.svg" class="card-img-top img-fluid mx-auto"
                         alt="Comparte tu afici&oacute;n" style="max-width: 65%; height: 200px;">
                    <div class="card-body">
                        <h5 class="fw-bold">Comparte</h5>
                        <p>Haz que tus aficiones lleguen a m&aacute;s personas.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 rounded-3 p-3">
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

<section class="bloque">
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

<section class="bloque">
    <div class="container">
        <div class="row justify-content-center text-center">
            <div class="col-md-5 mb-4">
                <div class="card h-100 p-3">
                    <img src="${contexto}/IMG/GENERAL/buscar.svg" class="card-img-top img-fluid" alt="Busca eventos"
                         style="max-width: 65%; height: 200px;">
                    <div class="card-body">
                        <h5 class="fw-bold">Busca eventos</h5>
                        <p>Filtra por subcategor&iacute;as, provincia y m&aacute;s para encontrar tu plan ideal.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-5 mb-4">
                <div class="card h-100 p-3">
                    <img src="${contexto}/IMG/GENERAL/unirse.svg" class="card-img-top img-fluid"
                         alt="&uacute;nete a un evento" style="max-width: 65%; height: 200px;">
                    <div class="card-body">
                        <h5 class="fw-bold">Ap&uacute;ntate</h5>
                        <p>Haz clic y empieza a disfrutar con otros usuarios.</p>
                    </div>
                </div>
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

<c:if test="${requestScope.aviso != null}">
    <div class="notification alert alert-success" role="alert">
        <i class="bi bi-check-circle-fill me-2"></i>
        <span>${requestScope.aviso}</span>
    </div>
</c:if>

<c:if test="${requestScope.error != null}">
    <div class="notification-danger alert alert-danger" role="alert">
        <i class="bi bi-exclamation-triangle-fill me-2"></i>
        <span>${requestScope.error}</span>
    </div>
</c:if>

<section class="bloque-footer text-center d-flex justify-content-center align-items-center">
    <div>
        <h2 class="text-footer color-pm">Haz que cada momento cuente</h2>
        <p class="fs-4">Con EntreHobbies, tus hobbies se convierten en experiencias inolvidables.</p>
        <p class="fs-4">¡Crea, comparte y disfruta con otros apasionados!</p>
    </div>

</section>

<c:import url="/INC/pie.inc"/>

</body>
</html>
