<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Informacion"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/VISTAS/informacion.js" defer></script>
</head>
<body class="bg-light h-100">

<main class="container-fluid vh-100 overflow-hidden">
    <div class="row h-100">

        <div class="col-md-3 d-flex align-items-center vh-100 bg-white border-end overflow-hidden">
            <div class="w-100 px-3 pt-4">
                <h5 class="text-center mb-4 fw-semibold">Men&uacute; Informaci&oacute;n</h5>
                <nav class="nav flex-column fs-5">

                    <form action="${contexto}/FrontController" method="post" class="mb-0">
                        <button type="submit" name="accion" value="Refresh"
                                class="nav-link text-dark border-bottom bg-transparent border-0 text-start w-100 d-flex align-items-center">
                            <i class="bi bi-house-fill me-2"></i>Home
                        </button>
                    </form>

                    <button type="button" class="nav-link text-dark border-bottom bg-transparent border-0 text-start w-100" data-target="homeSection">
                        <i class="bi bi-info-circle me-2"></i>Informaci&oacute;n
                    </button>
                    <button type="button" class="nav-link text-dark border-bottom bg-transparent border-0 text-start w-100" data-target="cuentaSection">
                        <i class="bi bi-person-circle me-2"></i>Ver mi cuenta
                    </button>
                    <button type="button" class="nav-link text-dark border-bottom bg-transparent border-0 text-start w-100" data-target="crearEventoSection">
                        <i class="bi bi-pencil-square me-2"></i>C&oacute;mo crear un evento
                    </button>
                    <button type="button" class="nav-link text-dark border-bottom bg-transparent border-0 text-start w-100" data-target="apuntarseEventoSection">
                        <i class="bi bi-check2-square me-2"></i>C&oacute;mo apuntarme a un evento
                    </button>
                    <button type="button" class="nav-link text-dark border-bottom bg-transparent border-0 text-start w-100" data-target="eventosSection">
                        <i class="bi bi-calendar-event me-2"></i>Mis eventos
                    </button>
                    <button type="button" class="nav-link text-dark border-bottom bg-transparent border-0 text-start w-100" data-target="participacionesSection">
                        <i class="bi bi-person-check me-2"></i>Mis participaciones
                    </button>
                    <button type="button" class="nav-link text-dark border-bottom bg-transparent border-0 text-start w-100" data-target="modificarEventoSection">
                        <i class="bi bi-pencil me-2"></i>Modificar mi evento
                    </button>
                </nav>
            </div>
        </div>

        <div class="col-md-9 py-4 overflow-auto" style="max-height: 100vh;">
            <section id="homeSection" class="info-section">
                <div class="card shadow-sm border-0 mx-auto" style="max-width: 1500px;">
                    <img src="${contexto}/IMG/GENERAL/informacion.svg" alt="Informaci&oacute;n general" class="card-img-top mx-auto d-block p-4 img-fluid" style="max-width: 300px;">
                    <div class="card-body">
                        <h2 class="card-title text-center color-pm mb-4">Informaci&oacute;n</h2>
                        <p class="card-text mb-4">En este apartado encontrar&aacute;s informaci&oacute;n general sobre c&oacute;mo usar <strong>EntreHobbies</strong> y aprovechar todas sus funcionalidades para disfrutar al m&aacute;ximo de la comunidad.</p>

                        <h5 class="mb-3">Explicaci&oacute;n breve del men&uacute; lateral de Informaci&oacute;n:</h5>

                        <div class="list-group list-group-flush">
                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong><i class="bi bi-info-circle me-2"></i> Informaci&oacute;n:</strong></h6>
                                <p class="mb-0">Este bot&oacute;n te lleva a la secci&oacute;n principal de informaci&oacute;n. Es el punto de partida para explorar las distintas funcionalidades de EntreHobbies y entender c&oacute;mo funciona la plataforma.</p>
                            </div>
                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong><i class="bi bi-person-circle me-2"></i> Ver mi cuenta:</strong></h6>
                                <p class="mb-0">En este apartado conocer&aacute;s las distintas funcionalidades para gestionar tu perfil personal dentro de <strong>EntreHobbies</strong>. Aqu&iacute; podr&aacute;s modificar tus datos, cambiar tu contrase&ntilde;a, actualizar tu avatar, y consultar los eventos que has creado o en los que participas.</p>
                            </div>
                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong><i class="bi bi-pencil-square me-2"></i> C&oacute;mo crear un evento:</strong></h6>
                                <p class="mb-0">Esta secci&oacute;n te explica paso a paso c&oacute;mo organizar un nuevo evento. Encontrar&aacute;s informaci&oacute;n sobre los campos requeridos, consejos para una buena configuraci&oacute;n del evento.</p>
                            </div>
                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong><i class="bi bi-check2-square me-2"></i> C&oacute;mo apuntarme a un evento:</strong></h6>
                                <p class="mb-0">En esta parte aprender&aacute;s a buscar eventos disponibles y a inscribirte en ellos.</p>
                            </div>
                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong><i class="bi bi-calendar-event me-2"></i> Mis eventos:</strong></h6>
                                <p class="mb-0">En este apartado podr&aacute;s consultar y gestionar la lista completa de eventos que has creado actualmente en <strong>EntreHobbies</strong>. Encontrar&aacute;s detalles de cada evento, opciones para modificarlos, cancelarlos o eliminarlos.</p>
                            </div>
                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong><i class="bi bi-person-check me-2"></i>Mis participaciones:</strong></h6>
                                <p class="mb-0">Aqu&iacute; se explica como gestionar los eventos en los que te has apuntado actualmente como participante. Puedes consultar los detalles del evento y desapuntarte del evento.</p>
                            </div>
                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong><i class="bi bi-pencil me-2"></i>Modificar mi evento:</strong></h6>
                                <p class="mb-0">En esta secci&oacute;n se explica como puedes editar eventos que hayas creado previamente. Puedes actualizar la fecha, lugar, descripci&oacute;n u otros datos del evento si necesitas hacer cambios.</p>
                            </div>
                        </div>

                        <p class="mt-4 text-muted fst-italic text-center">Este apartado es tu punto de partida para conocer todo lo que EntreHobbies puede ofrecerte y c&oacute;mo sacarle el m&aacute;ximo partido.</p>
                    </div>
                </div>
            </section>

            <section id="cuentaSection" class="info-section d-none card-btn py-4 px-2 px-md-4 text-center">
                <div class="card shadow-sm border-0 mx-auto" style="max-width: 1500px;">
                    <img src="${contexto}/IMG/GENERAL/perfilusuario.svg" alt="Perfil usuario"
                         class="card-img-top mx-auto d-block p-4 img-fluid" style="max-width: 300px;">

                    <div class="card-body text-start">
                        <h2 class="card-title text-center color-pm mb-4">Mi Cuenta</h2>

                        <p class="card-text mb-4">En este apartado, podr&aacute;s gestionar y actualizar tu informaci&oacute;n personal para mantener tu perfil al d&iacute;a y seguro dentro de <strong>EntreHobbies</strong>. Tener tu cuenta actualizada te permitir&aacute; participar activamente en la comunidad y disfrutar de todas las funcionalidades que ofrecemos.</p>

                        <div class="list-group list-group-flush">

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>Modificar datos personales:</strong></h6>
                                <p class="mb-0">Podr&aacute;s editar la mayor&iacute;a de tus datos personales, como tu nombre, apellidos, tel&eacute;fono o direcci&oacute;n. Esto es importante para que otros usuarios puedan conocerte mejor y para facilitar la organizaci&oacute;n de los eventos. <em>Ten en cuenta que el nombre de usuario y el correo electr&oacute;nico son datos &uacute;nicos que identifican tu cuenta en EntreHobbies, por lo que no se pueden modificar para mantener la seguridad e integridad de la plataforma.</em></p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>Informaci&oacute;n sobre formatos:</strong></h6>
                                <p class="mb-0">En cada campo de formulario, encontrar&aacute;s botones de ayuda o iconos informativos que te mostrar&aacute;n ejemplos y las reglas sobre los formatos aceptados, como longitud m&iacute;nima, caracteres permitidos o tipos de archivo para el avatar. Esto te facilitar&aacute; introducir datos correctos y evitar errores al guardar tus cambios.</p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>Cambiar contraseña:</strong></h6>
                                <p class="mb-0">La seguridad de tu cuenta es fundamental. Aqu&iacute; podr&aacute;s actualizar tu contraseña siempre que lo desees, lo que te permite mantener tu cuenta protegida. Recuerda elegir contraseñas seguras que combinen letras, n&uacute;meros y s&iacute;mbolos, y evita usar la misma contraseña en varios sitios para reducir riesgos.</p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>Actualizar avatar:</strong></h6>
                                <p class="mb-0">Personaliza tu perfil subiendo una imagen que te represente. Esto no solo te hace m&aacute;s reconocible dentro de la comunidad, sino que tambi&eacute;n aporta un toque m&aacute;s personal a tus interacciones. Puedes cambiar tu avatar tantas veces como quieras y te recomendamos usar im&aacute;genes claras y adecuadas para un entorno p&uacute;blico.</p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>Todos mis eventos:</strong></h6>
                                <p class="mb-0">En esta secci&oacute;n podr&aacute;s ver todos los eventos que has creado, con detalles como fechas, lugares y  n&uacute;mero de participantes inscritos. Podr&aacute;s ordenar por campos incluso buscar para que te sea m&aacute;s f&aacute;cil encontrar un evento.</p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong><i class="bi bi-person-check me-2"></i> Todas mis participaciones:</strong></h6>
                                <p class="mb-0">En este apartado podr&aacute;s ver todos los eventos a los que te has inscrito como participante. Desde aqu&iacute; puedes consultar los detalles, ver cuantos usuarios m&aacute;s asistir&aacute;n. Todo est&aacute; organizado por fecha para ayudarte a planificar tus actividades con facilidad.</p>
                            </div>
                        </div>

                        <p class="mt-4 text-muted fst-italic text-center">Actualizar y cuidar tu perfil no solo mejora tu experiencia, sino que tambi&eacute;n fortalece la comunidad de EntreHobbies, facilitando la comunicaci&oacute;n y la creaci&oacute;n de planes compartidos con otros usuarios.</p>
                    </div>
                </div>
            </section>

            <section id="crearEventoSection" class="info-section d-none card-btn py-4 px-2 px-md-4 text-center">
                <div class="card shadow-sm border-0 mx-auto" style="max-width: 1500px;">
                    <img src="${contexto}/IMG/GENERAL/crearevento.svg" alt="Crear evento"
                         class="card-img-top mx-auto d-block p-4 img-fluid" style="max-width: 300px;">

                    <div class="card-body text-start">
                        <h2 class="card-title text-center color-pm mb-4">C&oacute;mo crear un evento</h2>

                        <p class="card-text mb-4">
                            Crear un evento en <strong>EntreHobbies</strong> es f&aacute;cil y est&aacute; pensado para que compartas tus pasatiempos con otras personas. Utilizamos un formulario dividido en tres pasos para ayudarte a organizar la informaci&oacute;n de manera clara y completa.
                        </p>

                        <div class="list-group list-group-flush">

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>📝 Paso 1: Informaci&oacute;n general</strong></h6>
                                <ul class="mb-2">
                                    <li><strong>T&iacute;tulo:</strong> Nombre del evento, claro y representativo.</li>
                                    <li><strong>N&uacute;mero de participantes:</strong> Desde 1 hasta 5000 personas.</li>
                                    <li><strong>Categor&iacute;a y subcategor&iacute;a:</strong> Clasifican tu evento seg&uacute;n el tipo de actividad.</li>
                                    <li><strong>Descripci&oacute;n:</strong> M&aacute;ximo 255 caracteres, con detalles breves sobre el objetivo y din&aacute;mica del evento.</li>
                                </ul>
                                <p class="text-warning mb-0">
                                    ⚠️ <strong>Importante:</strong> La <u>categor&iacute;a y subcategor&iacute;a no se pueden modificar</u> una vez creado el evento. El&iacute;gelo con cuidado.
                                </p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>📍 Paso 2: Ubicaci&oacute;n del evento</strong></h6>
                                <ul class="mb-0">
                                    <li><strong>Direcci&oacute;n exacta:</strong> Lugar donde se celebrar&aacute;.</li>
                                    <li><strong>Localidad:</strong> Ciudad o municipio correspondiente.</li>
                                    <li><strong>Provincia:</strong> Selecciona tu provincia del listado.</li>
                                </ul>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>📅 Paso 3: Fechas del evento</strong></h6>
                                <ul class="mb-0">
                                    <li><strong>Fecha de inicio:</strong> No puede ser anterior a hoy.</li>
                                    <li><strong>Fecha de fin:</strong> Debe ser posterior a la de inicio.</li>
                                </ul>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>💡 Consejos &uacute;tiles:</strong></h6>
                                <p class="mb-0">Cada campo incluye botones de ayuda o iconos informativos para orientarte sobre los formatos permitidos, ejemplos y recomendaciones pr&aacute;cticas para completar correctamente tu evento.</p>
                            </div>
                        </div>

                        <p class="mt-4 text-muted fst-italic text-center">Una vez completes los tres pasos y confirmes la creaci&oacute;n del evento, este se publicar&aacute; y otros usuarios podr&aacute;n verlo y apuntarse. ¡An&iacute;mate a compartir tu hobby!</p>
                    </div>
                </div>
            </section>

            <section id="apuntarseEventoSection" class="info-section d-none card-btn py-4 px-2 px-md-4 text-center">
                <div class="card shadow-sm border-0 mx-auto" style="max-width: 1500px;">
                    <img src="${contexto}/IMG/GENERAL/unirse.svg" alt="Unirse a eventos"
                         class="card-img-top mx-auto d-block p-4 img-fluid" style="max-width: 300px;">

                    <div class="card-body text-start">
                        <h2 class="card-title text-center color-pm mb-4">C&oacute;mo apuntarme a un evento</h2>

                        <p class="card-text mb-4">
                            Para unirte a una actividad que te interese dentro de <strong>EntreHobbies</strong>, simplemente debes seguir unos pasos muy sencillos desde el apartado <strong>"Buscar Eventos"</strong>. Esta secci&oacute;n te permite explorar eventos disponibles seg&uacute;n tus gustos e inscribirte de forma inmediata.
                        </p>

                        <div class="list-group list-group-flush">

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>🔎 Buscar por categor&iacute;a</strong></h6>
                                <p class="mb-0">Entra en el apartado <strong>“Buscar Eventos”</strong> y selecciona la categor&iacute;a de hobby que te interesa (por ejemplo, deportes, cine, cocina, etc.). Se mostrar&aacute; una lista con todos los eventos activos de esa categor&iacute;a.</p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>👥 Consultar participantes</strong></h6>
                                <p class="mb-0">Cada evento te mostrar&aacute; cu&aacute;ntas personas est&aacute;n inscritas actualmente. Esto puede ayudarte a decidir si un evento es ideal para ti en funci&oacute;n de su popularidad o capacidad disponible.</p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>✅ Apuntarse a un evento</strong></h6>
                                <p class="mb-2">Una vez encuentres un evento que te interese, simplemente pulsa el siguiente bot&oacute;n:</p>
                                <div class="btn btn-main btn-sm rounded-pill w-100 text-center">
                                    <i class="bi bi-check2-circle me-2"></i><span>Apuntarse</span>
                                </div>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>🚫 Cancelar tu participaci&oacute;n</strong></h6>
                                <p class="mb-2">Si cambias de opini&oacute;n, tambi&eacute;n puedes darte de baja del evento f&aacute;cilmente:</p>
                                <div class="btn btn-warning btn-sm rounded-pill w-100 text-center">
                                    <i class="bi bi-x-circle me-2"></i><span>Desapuntarse</span>
                                </div>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>👤 Si eres el creador del evento</strong></h6>
                                <p class="mb-2">No puedes apuntarte a tus propios eventos, pero podr&aacute;s ver este mensaje en lugar del bot&oacute;n de participaci&oacute;n:</p>
                                <div class="alert alert-creador text-center p-2 rounded-pill mb-0">
                                    <span>Eres el creador del evento</span>
                                </div>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>🔒 Si no has iniciado sesi&oacute;n</strong></h6>
                                <p class="mb-2">Los usuarios no registrados o no logueados ver&aacute;n el siguiente mensaje para recordarles que deben iniciar sesi&oacute;n para participar:</p>
                                <div class="alert alert-creador text-center p-2 rounded-pill mb-0">
                                    <span>Reg&iacute;strate para poder unirte</span>
                                </div>
                            </div>
                        </div>

                        <p class="mt-4 text-muted fst-italic text-center">
                            Explora eventos, con&eacute;ctate con personas afines y descubre nuevas experiencias a trav&eacute;s de EntreHobbies. ¡Apuntarse es solo el primer paso hacia una afici&oacute;n compartida!
                        </p>
                    </div>
                </div>
            </section>


            <section id="eventosSection" class="info-section d-none card-btn py-4 px-2 px-md-4 text-center">
                <div class="card shadow-sm border-0 mx-auto" style="max-width: 1500px;">
                    <img src="${contexto}/IMG/GENERAL/eventos.svg" alt="Mis eventos"
                         class="card-img-top mx-auto d-block p-4 img-fluid" style="max-width: 300px;">

                    <div class="card-body text-start">
                        <h2 class="card-title text-center color-pm mb-4">Mis eventos</h2>

                        <p class="card-text mb-4">
                            En este apartado podr&aacute;s consultar la lista completa de eventos que has creado actualmente. Esta vista est&aacute; pensada para que tengas un control total sobre tus actividades dentro de <strong>EntreHobbies</strong>.
                        </p>

                        <div class="list-group list-group-flush">

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>📋 Lista ordenada por fecha</strong></h6>
                                <p class="mb-0">Los eventos se muestran en orden cronol&oacute;gico ascendente, es decir, los que comienzan m&aacute;s pronto aparecer&aacute;n primero. Esto te permite ver r&aacute;pidamente cu&aacute;les est&aacute;n m&aacute;s pr&oacute;ximos.</p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>🔍 Ver detalles del evento</strong></h6>
                                <p class="mb-0">Cada evento incluye un bot&oacute;n <strong>“Detalles”</strong> que abre un <strong>modal</strong> con toda la informaci&oacute;n general del evento: t&iacute;tulo, ubicaci&oacute;n, fechas, descripci&oacute;n, categor&iacute;a y subcategor&iacute;a, as&iacute; como el n&uacute;mero m&aacute;ximo de participantes.</p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>⚙️ Acciones disponibles en el modal</strong></h6>
                                <ul class="mb-2">
                                    <li><strong>Modificar evento:</strong> Te permite actualizar la informaci&oacute;n del evento. Si hay personas inscritas, se les enviar&aacute; autom&aacute;ticamente un correo electr&oacute;nico con los cambios realizados.</li>
                                    <li><strong>Eliminar evento:</strong> Solo disponible si <u>no hay participantes</u>. Elimina definitivamente el evento sin notificar a nadie.</li>
                                    <li><strong>Cancelar evento:</strong> Aparece si <u>ya hay personas apuntadas</u>. Al cancelar, se notificar&aacute; por email a todos los participantes informando que el evento ha sido suspendido.</li>
                                </ul>
                                <p class="text-warning mb-0">⚠️ El sistema gestiona autom&aacute;ticamente las notificaciones por correo seg&uacute;n la acci&oacute;n realizada. Aseg&uacute;rate de revisar bien los datos antes de confirmar cualquier modificaci&oacute;n o cancelaci&oacute;n.</p>
                            </div>

                        </div>

                        <p class="mt-4 text-muted fst-italic text-center">Esta secci&oacute;n te ayuda a mantener tus eventos bien organizados y comunicados, asegurando una buena experiencia para ti y para quienes se inscriban en tus actividades.</p>
                    </div>
                </div>
            </section>

            <section id="participacionesSection" class="info-section d-none card-btn py-4 px-2 px-md-4 text-center">
                <div class="card shadow-sm border-0 mx-auto" style="max-width: 1500px;">
                    <img src="${contexto}/IMG/GENERAL/participaciones.svg" alt="Mis participaciones"
                         class="card-img-top mx-auto d-block p-4 img-fluid" style="max-width: 300px;">

                    <div class="card-body text-start">
                        <h2 class="card-title text-center color-pm mb-4">Mis participaciones</h2>

                        <p class="card-text mb-4">
                            En este apartado podr&aacute;s consultar todos los eventos a los que te has apuntado actualmente dentro de <strong>EntreHobbies</strong>. La lista est&aacute; ordenada por la fecha de inicio de cada evento, mostrando primero aquellos que ocurren m&aacute;s pronto para ayudarte a planificar mejor tu agenda.
                        </p>

                        <div class="list-group list-group-flush">

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>🔍 Consultar detalles del evento</strong></h6>
                                <p class="mb-0">Puedes acceder a la informaci&oacute;n general del evento, incluyendo fecha, lugar, descripci&oacute;n y m&aacute;s, para estar siempre al tanto de los datos importantes.</p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>👥 Ver participantes</strong></h6>
                                <p class="mb-0">Consulta qui&eacute;n m&aacute;s asistir&aacute; para conocer mejor a la comunidad con la que compartir&aacute;s el plan.</p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>🚪 Desapuntarse del evento</strong></h6>
                                <p class="mb-0">Si por alguna raz&oacute;n ya no puedes asistir, tienes la opci&oacute;n de desapuntarte f&aacute;cilmente con un solo clic, liberando tu plaza para otros usuarios interesados.</p>
                            </div>

                        </div>

                        <p class="mt-4 text-muted fst-italic text-center">
                            Mantente organizado y actualizado sobre tus actividades favoritas con <strong>EntreHobbies</strong>. ¡Disfruta compartiendo tus hobbies con otros usuarios!
                        </p>
                    </div>
                </div>
            </section>

            <section id="modificarEventoSection" class="info-section d-none card-btn py-4 px-2 px-md-4 text-center">
                <div class="card shadow-sm border-0 mx-auto" style="max-width: 1500px;">
                    <img src="${contexto}/IMG/GENERAL/nuevoevento.svg" alt="Modificar Evento"
                         class="card-img-top mx-auto d-block p-4 img-fluid" style="max-width: 300px;">

                    <div class="card-body text-start">
                        <h2 class="card-title text-center color-pm mb-4">Modificar Evento</h2>

                        <p class="card-text mb-4">
                            En la opci&oacute;n modificar la informaci&oacute;n de tu evento, el formulario que ver&aacute;s depender&aacute; de si tu evento tiene participantes o no:
                        </p>

                        <div class="list-group list-group-flush text-start">

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>Evento sin participantes:</strong></h6>
                                <p class="mb-0">
                                    Podr&aacute;s modificar todos los campos del evento excepto la categor&iacute;a y subcategor&iacute;a, que no se pueden cambiar para mantener la coherencia y organizaci&oacute;n de la plataforma.
                                </p>
                            </div>

                            <div class="list-group-item px-0">
                                <h6 class="mb-1"><strong>Evento con participantes:</strong></h6>
                                <p class="mb-0">
                                    Por razones de transparencia y para evitar confusiones, solo podr&aacute;s modificar la descripci&oacute;n, la direcci&oacute;n, la fecha de inicio y la fecha de fin del evento.
                                    Al guardar los cambios, se enviar&aacute; autom&aacute;ticamente un correo electr&oacute;nico a todos los participantes con los detalles actualizados del evento, para mantenerlos informados.
                                </p>
                            </div>

                        </div>

                        <p class="mt-4 text-muted fst-italic text-center">
                            Recuerda que las categor&iacute;as y subcategor&iacute;as no son modificables para garantizar una correcta clasificaci&oacute;n y gesti&oacute;n de los eventos en EntreHobbies.
                        </p>
                    </div>
                </div>
            </section>

        </div>
    </div>
</main>

</body>
</html>
