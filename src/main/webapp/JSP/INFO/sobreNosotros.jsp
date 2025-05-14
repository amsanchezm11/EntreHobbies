<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Quienes somos"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>

</head>
<body class="d-flex flex-column min-vh-100 bg-body text-body position-relative w-100 h-100 bg-gradient-morado-blanco">
<nav id="navbar" class="navbar navbar-expand-lg navbar-light bg-body-tertiary border-bottom sticky-top">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <form action="${contexto}/FrontController" method="post">
            <button class="navbar-brand btn btn-refresh" name="accion" value="Refresh">EntreHobbies</button>
        </form>
    </div>
</nav>

<main class="flex-grow-1">
    <div class="container py-5">
        <h1 class="text-center text-light fw-bold sobre-nosotros">Sobre nosotros</h1>
    </div>

    <div class="card mt-2 mx-auto shadow-lg rounded-4 overflow-hidden" style="max-width: 960px;">
        <div class="row g-0">
            <div class="col-md-5">
                <img src="${contexto}/IMG/GENERAL/quienesomos.svg" class="img-fluid h-100 w-100 object-fit-cover"
                     alt="Descripci&oacute;n de la imagen">
            </div>
            <div class="col-md-7 d-flex align-items-center">
                <div class="card-body">
                    <h2 class="card-title fw-bold color-pm">Qui&eacute;nes somos</h2>
                    <p class="card-text text-body mt-3">
                        <strong>EntreHobbies</strong> es una plataforma creada para personas que desean compartir sus
                        aficiones y conocer a otras con intereses similares. Nuestro equipo cree en el valor de las
                        actividades compartidas para generar conexiones aut&eacute;nticas y crear comunidad. Nos dirigimos
                        especialmente a un p&uacute;blico adulto que busca propuestas enriquecedoras y planes diferentes en su
                        tiempo libre.
                    </p>

                    <h3 class="card-title fw-bold color-pm mt-4">Nuestro prop&oacute;sito</h3>
                    <p class="card-text text-body mt-3">
                        En <strong>EntreHobbies</strong> queremos ayudarte a descubrir nuevas experiencias, ampliar tu
                        c&iacute;rculo social y disfrutar de tus pasatiempos favoritos junto a otras personas. Promovemos un
                        entorno cercano, respetuoso y seguro donde cada usuario pueda aportar y encontrar su lugar.
                    </p>
                </div>
            </div>
        </div>
    </div>
</main>

<c:import url="/INC/pie.inc"/>
</body>
</html>