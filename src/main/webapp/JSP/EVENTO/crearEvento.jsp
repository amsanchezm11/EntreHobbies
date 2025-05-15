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

<h1 class="text-light mb-3 position-relative text-footer" style="z-index: -10;">Nuevo Evento</h1>

<div class="d-flex h-100 justify-content-center align-items-start">
    <form id="multiStepForm" action="${contexto}/EventoController" method="post"
          style="min-width: 600px; margin: 0 auto;" class="mt-3">
        <div class="step active">
            <div class="form-floating mb-4">
                <h3 class="text-light">Paso 1: Informaci&oacute;n general del evento</h3>
            </div>

            <div class="row">

                <div class="col-md-6">
                    <div class="input-group mb-4">
                        <div class="form-floating flex-grow-1">
                            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="T&iacute;tulo"
                                   required>
                            <label for="titulo">T&iacute;tulo</label>
                        </div>
                        <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                              title="T&iacute;tulo"
                              data-bs-toggle="popover"
                              data-bs-placement="bottom"
                              data-bs-html="true"
                              data-bs-trigger="hover focus"
                              data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                        <li>Añade un t&iacute;tulo descriptivo a tu evento para que el resto de usuarios puedan encontrarlo f&aacute;cilmente</li>
                        <li>Debe empezar con may&uacute;scula.</li>
                        <li>Solo letras, n&uacute;meros y espacios.</li>
                        <li>Longitud m&aacute;xima 40 caracteres.</li>
                      </ul>">
                    <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
                </span>
                    </div>

                    <div class="input-group mb-4">
                        <div class="form-floating flex-grow-1">
                            <input type="number" class="form-control" id="numParticipantes" step="1" min="1"
                                   name="numParticipantes" placeholder="N&uacute;mero de participantes" required>
                            <label for="numParticipantes">N&uacute;mero de participantes</label>
                        </div>
                        <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                              title="N&uacute;mero de participantes"
                              data-bs-toggle="popover"
                              data-bs-placement="bottom"
                              data-bs-html="true"
                              data-bs-trigger="hover focus"
                              data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                        <li>Indica cu&aacute;ntas personas pueden participar en el evento.</li>
                        <li>Debe ser un n&uacute;mero entero mayor o igual a 1.</li>
                      </ul>">
                    <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
                </span>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="input-group mb-4">
                        <div class="form-floating flex-grow-1">
                            <select class="form-control" id="categoria" name="idCategoria" required>
                                <option value="" disabled selected>Selecciona una categor&iacute;a</option>
                                <c:forEach var="categoria" items="${requestScope.categorias}">
                                    <option value="${categoria[0]}">${categoria[1]}</option>
                                </c:forEach>
                            </select>
                            <label for="categoria">Categor&iacute;a</label>
                        </div>
                        <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                              title="Categor&iacute;a"
                              data-bs-toggle="popover"
                              data-bs-placement="bottom"
                              data-bs-html="true"
                              data-bs-trigger="hover focus"
                              data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
            <li>Selecciona la categor&iacute;a principal a la que pertenece tu evento.</li>
            <li>Esta ayuda a los usuarios a encontrar eventos relacionados.</li>
          </ul>">
        <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
    </span>
                    </div>

                    <div class="input-group mb-3">
                        <div class="form-floating flex-grow-1">
                            <select class="form-control" id="subcategoria" name="idSubcategoria" required>
                                <option value="" disabled selected>Selecciona una subcategor&iacute;a</option>
                            </select>
                            <label for="subcategoria">Subcategor&iacute;a</label>
                        </div>
                        <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                              title="Subcategor&iacute;a"
                              data-bs-toggle="popover"
                              data-bs-placement="bottom"
                              data-bs-html="true"
                              data-bs-trigger="hover focus"
                              data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                <li>Selecciona una categor&iacute;a antes para poder ver las subcategor&iacute;as.</li>
                                <li>Selecciona la subcategor&iacute;a espec&iacute;fica para detallar mejor el tipo de evento.</li>
                              </ul>">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-12">
                    <div class="form-floating mb-3">
                <textarea class="form-control" id="descripcion" name="descripcion" rows="3" placeholder="Descripci&oacute;n"
                          maxlength="255"></textarea>
                        <label for="descripcion">Descripci&oacute;n</label>
                        <small id="charCount" class="form-text text-light d-block text-end">0/255 caracteres</small>
                    </div>
                </div>
            </div>

            <button type="button" class="btn btn-main" onclick="nextStep()">Siguiente</button>
        </div>


        <div class="step">
            <div class="mb-4">
                <h3 class="text-light">Paso 2: Ubicaci&oacute;n del evento</h3>
            </div>

            <div class="input-group mb-3">
                <div class="form-floating flex-grow-1">
                    <input type="text" class="form-control" id="direccion" name="direccion" maxlength="50"
                           placeholder="Direcci&oacute;n" required>
                    <label for="direccion">Direcci&oacute;n</label>
                </div>
                <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                      title="Direcci&oacute;n"
                      data-bs-toggle="popover"
                      data-bs-placement="bottom"
                      data-bs-html="true"
                      data-bs-trigger="hover focus"
                      data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                <li>Introduce la direcci&oacute;n exacta donde se realizar&aacute; el evento.</li>
                <li>M&aacute;ximo 50 caracteres.</li>
              </ul>">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
            </div>

            <div class="input-group mb-3">
                <div class="form-floating flex-grow-1">
                    <input type="text" class="form-control" id="localidad" name="localidad" maxlength="50"
                           placeholder="Localidad" required>
                    <label for="localidad">Localidad</label>
                </div>
                <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                      title="Localidad"
                      data-bs-toggle="popover"
                      data-bs-placement="bottom"
                      data-bs-html="true"
                      data-bs-trigger="hover focus"
                      data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                <li>Indica la localidad o ciudad donde se ubicar&aacute; el evento.</li>
                <li>M&aacute;ximo 50 caracteres.</li>
              </ul>">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
            </div>

            <div class="input-group mb-3">
                <div class="form-floating flex-grow-1">
                    <input type="text" class="form-control" id="provincia" name="provincia" maxlength="50"
                           placeholder="Provincia" required>
                    <label for="provincia">Provincia</label>
                </div>
                <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                      title="Provincia"
                      data-bs-toggle="popover"
                      data-bs-placement="bottom"
                      data-bs-html="true"
                      data-bs-trigger="hover focus"
                      data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                <li>Especifica la provincia donde se desarrollar&aacute; el evento.</li>
                <li>M&aacute;ximo 50 caracteres.</li>
              </ul>">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
            </div>

            <button type="button" class="btn btn-secondary" onclick="prevStep()">Anterior</button>
            <button type="button" class="btn btn-main" onclick="nextStep()">Siguiente</button>
        </div>


        <div class="step">
            <div class="mb-4">
                <h3 class="text-light">Paso 3: Fechas del evento</h3>
            </div>

            <div class="input-group mb-3">
                <div class="form-floating flex-grow-1">
                    <input type="date" class="form-control" id="fechaInicio" name="fechaInicio" required>
                    <label for="fechaInicio">Fecha de inicio</label>
                </div>
                <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                      title="Fecha de inicio"
                      data-bs-toggle="popover"
                      data-bs-placement="bottom"
                      data-bs-html="true"
                      data-bs-trigger="hover focus"
                      data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                <li>Selecciona la fecha en que comenzar&aacute; el evento.</li>
                <li>No puede ser anterior a la fecha actual.</li>
              </ul>">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
            </div>

            <div class="input-group mb-3">
                <div class="form-floating flex-grow-1">
                    <input type="date" class="form-control" id="fechaFin" name="fechaFin" required>
                    <label for="fechaFin">Fecha de fin</label>
                </div>
                <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                      title="Fecha de fin"
                      data-bs-toggle="popover"
                      data-bs-placement="bottom"
                      data-bs-html="true"
                      data-bs-trigger="hover focus"
                      data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                <li>Selecciona la fecha en que finalizar&aacute; el evento.</li>
                <li>Debe ser m&iacute;mino 1 d&iacute;a posterior a la fecha de inicio.</li>
              </ul>">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
            </div>

            <button type="button" class="btn btn-secondary" onclick="prevStep()">Anterior</button>
            <button type="submit" class="btn btn-main" name="accion" value="Crear-Evento">Crear Evento</button>
        </div>
    </form>
</div>
</body>
</html>
