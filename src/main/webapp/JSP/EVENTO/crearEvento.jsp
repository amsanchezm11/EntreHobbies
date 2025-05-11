<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Nuevo evento"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/formularioEvento.js" defer></script>
    <script type="module" src="${contexto}/JS/obtenerSubcategorias.js" defer></script>
    <script type="module" src="${contexto}/JS/inicializarPopovers.js" defer></script>
</head>
<body class="bg-gradient-morado-blanco p-4" style="margin-top: 70px;">
<c:import url="/INC/navbarCreate.jsp"/>

<h1 class="text-white mb-3 position-relative" style="z-index: -10;">Nuevo Evento</h1>

<div class="container p-4 bg-white rounded shadow" style="max-width: 600px; min-height: 400px;">
    <form id="multiStepForm" action="${contexto}/EventoController" method="post">

        <div class="step active">
            <div class="form-floating mb-3">
                <h3>Informaci&oacute;n general del evento</h3>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="input-group mb-4 shadow">
                        <div class="form-floating flex-grow-1">
                            <input type="text"
                                   class="form-control"
                                   id="titulo"
                                   name="titulo"
                                   placeholder="Título"
                                   required>
                            <label for="titulo">Título</label>
                        </div>
                        <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                              title="Título"
                              data-bs-toggle="popover"
                              data-bs-placement="bottom"
                              data-bs-html="true"
                              data-bs-trigger="hover focus"
                              data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                  <li>A&ntilde;adele un t&iacute;tulo descriptivo a tu evento para que el resto de usuarios puedan encontrarlo f&aacute;cilmente</li>
                  <li>Debe empezar con may&uacute;scula.</li>
                  <li>Solo letras, n&uacute;meros y espacios.</li>
                  <li>Longitud m&aacute;xima 40 caracteres.</li>
              </ul>">
        <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
    </span>
                    </div>


                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="numParticipantes" step="1" min="1" name="numParticipantes" placeholder="N&uacute;mero de participantes" required>
                        <label for="numParticipantes">N&uacute;mero de participantes</label>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-floating mb-3">
                        <select class="form-control" id="categoria" name="idCategoria" required>
                            <option value="" disabled selected>Selecciona una categor&iacute;a</option>
                            <c:forEach var="categoria" items="${requestScope.categorias}">
                                <option value="${categoria[0]}">${categoria[1]}</option>
                            </c:forEach>
                        </select>
                        <label for="categoria">Categor&iacute;a</label>
                    </div>

                    <div class="form-floating mb-3">
                        <select class="form-control" id="subcategoria" name="idSubcategoria" required>
                            <option value="" disabled selected>Selecciona una subcategor&iacute;a</option>
                        </select>
                        <label for="subcategoria">Subcategor&iacute;a</label>
                    </div>
                </div>
            </div>

            <div class="form-floating mb-3">
                <textarea class="form-control" id="descripcion" name="descripcion" rows="3" placeholder="Descripci&oacute;n" maxlength="255"></textarea>
                <label for="descripcion">Descripci&oacute;n</label>
                <small id="charCount" class="form-text text-muted d-block text-end">0/255 caracteres</small>
            </div>

            <button type="button" class="btn btn-main" onclick="nextStep()">Siguiente</button>
        </div>

        <div class="step">
            <div class="mb-3">
                <h3>Ubicaci&oacute;n del evento</h3>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="direccion" name="direccion" maxlength="50" placeholder="Direcci&oacute;n" required>
                <label for="direccion">Direcci&oacute;n</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="localidad" name="localidad" maxlength="50" placeholder="Localidad" required>
                <label for="localidad">Localidad</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="provincia" name="provincia" maxlength="50" placeholder="Provincia" required>
                <label for="provincia">Provincia</label>
            </div>

            <button type="button" class="btn btn-secondary" onclick="prevStep()">Anterior</button>
            <button type="button" class="btn btn-main" onclick="nextStep()">Siguiente</button>
        </div>

        <div class="step">
            <div class="mb-3">
                <h3>Fechas del evento</h3>
            </div>

            <div class="form-floating mb-3">
                <input type="date" class="form-control" id="fechaInicio" name="fechaInicio" required>
                <label for="fechaInicio">Fecha de inicio</label>
            </div>

            <div class="form-floating mb-3">
                <input type="date" class="form-control" id="fechaFin" name="fechaFin" required>
                <label for="fechaFin">Fecha de fin</label>
            </div>

            <button type="button" class="btn btn-secondary" onclick="prevStep()">Anterior</button>
            <button type="submit" class="btn btn-main" name="accion" value="Crear-Evento">Crear Evento</button>
        </div>

    </form>
</div>
</body>
</html>
