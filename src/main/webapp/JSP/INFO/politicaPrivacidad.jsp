<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Condiciones de uso"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
</head>
<body class="d-flex flex-column body-custom position-relative w-100 bg-gradient-morado-blanco">

<c:choose>
    <c:when test="${sessionScope.usuario != null}">
        <c:import url="/INC/navbarUsuario.jsp"/>
    </c:when>
    <c:otherwise>
        <c:import url="/INC/navbarDefault.jsp"/>
    </c:otherwise>
</c:choose>

<main class="flex-grow-1 py-5">
    <div class="container">
        <h1 class="text-center text-light fw-bold mb-4">Condiciones Generales de Uso</h1>

        <div class="card shadow-lg rounded-4 p-4 bg-white">
            <img src="${contexto}/IMG/GENERAL/privacidad.svg" alt="Privacidad" class="mx-auto d-block mb-3" style="max-height: 200px;">
            <div class="card-body">
                <p>Las presentes Condiciones Generales regulan el uso (incluyendo el mero acceso) a la p&aacute;gina web, incluidos los contenidos y servicios puestos a disposici&oacute;n en ella. Toda persona ("Usuario") que acceda al portal <a href="#">https://www.entrehobbies.com</a> acepta someterse a las Condiciones Generales vigentes en cada momento en el mismo.</p>

                <p>El acceso y/o uso de este sitio web atribuye a quien lo realiza la condici&oacute;n de Usuario, aceptando desde este mismo momento, plenamente y sin reserva alguna, las menciones legales establecidas, las presentes Condiciones Generales de Uso, as&iacute; como las condiciones particulares que, en su caso, lo complementen, en relaci&oacute;n con determinados servicios y contenidos del sitio web.</p>

                <p>El usuario se compromete a utilizar el sitio web, sus servicios y contenidos sin contravenir la legislaci&oacute;n vigente, la buena fe, el orden p&uacute;blico, el aviso legal de esta web y sus Condiciones Generales de uso.</p>

                <h5 class="mt-4 color-pm">Usos Prohibidos</h5>
                <ul>
                    <li>Realizar actividades il&iacute;citas o lesivas, o que puedan impedir el normal funcionamiento de la web.</li>
                    <li>Difundir contenidos de car&aacute;cter racista, xen&oacute;fobo, pornogr&aacute;fico-ilegal, apolog&iacute;a del terrorismo o atentatorios contra los derechos humanos.</li>
                    <li>Provocar da&ntilde;os en los sistemas f&iacute;sicos y l&oacute;gicos de EntreHobbies, sus proveedores o terceros, as&iacute; como introducir virus inform&aacute;ticos o cualquier otro sistema da&ntilde;ino.</li>
                    <li>Acceder o intentar acceder a cuentas de otros usuarios y manipular sus mensajes.</li>
                    <li>Vulnerar derechos de protecci&oacute;n de datos, propiedad intelectual, normativa de consumo o cualquier otra norma aplicable.</li>
                </ul>

                <p>El Usuario debe custodiar adecuadamente su nombre de usuario y contrase&ntilde;a, no ceder su uso ni permitir el acceso a terceros, siendo responsable de cualquier uso indebido derivado de su negligencia.</p>

                <h5 class="mt-4 color-pm">Derechos de propiedad intelectual e industrial</h5>
                <p>No se cede ning&uacute;n derecho de propiedad intelectual o industrial sobre el portal ni sobre sus elementos integrantes. Todo el contenido est&aacute; protegido por derechos registrados conforme a la legislaci&oacute;n espa&ntilde;ola y tratados internacionales.</p>
                <p>Si un tercero considera que se han vulnerado sus derechos, deber&aacute; notificarlo incluyendo:</p>
                <ul>
                    <li>Datos personales del titular afectado o su representante.</li>
                    <li>Identificaci&oacute;n del contenido y su ubicaci&oacute;n.</li>
                    <li>Acreditaci&oacute;n de los derechos infringidos y declaraci&oacute;n de veracidad.</li>
                </ul>

                <h5 class="mt-4 color-pm">Enlaces externos</h5>
                <p>La web puede incluir enlaces a sitios de terceros con el objetivo de facilitar acceso a otros contenidos, pero EntreHobbies no se responsabiliza de los resultados o contenidos de dichos enlaces.</p>
                <p>Para enlazar desde una web externa a <a href="#" onclick="return false;">EntreHobbies</a>
                    , es necesaria autorizaci&oacute;n previa y por escrito.</p>

                <h5 class="mt-4 color-pm">Otras condiciones de uso</h5>
                <p>Este sitio y sus contenidos pertenecen a EntreHobbies, cuya sede social se encuentra en <strong>AVDA Europa, Parcela 2-5 y 2-6. Pol&iacute;gono industrial El Prado, 06800, M&eacute;rida, Badajoz. ESPA&Ntilde;A</strong>, con CIF <strong>B12345678</strong>.</p>
                <p>Se proh&iacute;be toda manipulaci&oacute;n o alteraci&oacute;n del sitio sin consentimiento, no siendo responsable EntreHobbies de dichas acciones realizadas por terceros.</p>

                <h5 class="mt-4 color-pm">Exclusi&oacute;n de garant&iacute;as y responsabilidad</h5>
                <ul>
                    <li>Uso il&iacute;cito, fraudulento o negligente del sitio web por parte de los usuarios.</li>
                    <li>Contenidos o servicios de terceros accesibles desde este sitio.</li>
                    <li>Da&ntilde;os ocasionados por elementos fuera de su control, como errores de contenido, falta de disponibilidad o presencia de malware.</li>
                </ul>

                <h5 class="mt-4 color-pm">Modificaciones</h5>
                <p>EntreHobbies se reserva el derecho de modificar, suprimir o a&ntilde;adir contenidos, servicios o su presentaci&oacute;n en la web sin previo aviso.</p>

                <h5 class="mt-4 color-pm">Ley aplicable y jurisdicci&oacute;n</h5>
                <p>Las relaciones entre EntreHobbies y los usuarios se rigen por la legislaci&oacute;n espa&ntilde;ola y se someten a los Juzgados y Tribunales espa&ntilde;oles.</p>

                <h5 class="mt-4 color-pm">C&oacute;digo &eacute;tico de Conducta</h5>
                <p>EntreHobbies dispone de un <strong>C&oacute;digo &eacute;tico de Conducta</strong> que puede descargarse desde el siguiente enlace: <a href="#">Descargar C&oacute;digo &eacute;tico de Conducta</a>.</p>

                <h5 class="mt-4 color-pm">Resoluci&oacute;n de Litigios</h5>
                <p>Resoluci&oacute;n de litigios en l&iacute;nea conforme al Art. 14.1 del Reglamento (UE) 524/2013: Plataforma de la Comisi&oacute;n Europea disponible en <a href="https://ec.europa.eu/consumers/odr/" target="_blank">https://ec.europa.eu/consumers/odr/</a>.</p>
            </div>
        </div>
    </div>
</main>
<c:import url="/INC/pie.inc"/>
</body>
</html>
