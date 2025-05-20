<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Modificar evento"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/formularioEvento.js" defer></script>
    <script type="module" src="${contexto}/JS/obtenerSubcategorias.js" defer></script>
    <script type="module" src="${contexto}/JS/inicializarPopovers.js" defer></script>
    <script type="module" src="${contexto}/JS/VALIDACIONES/modificarEventoParcial.js" defer></script>
</head>
<body class="body-custom bg-gradient-morado-blanco p-4" style="margin-top: 70px;">
<c:import url="/INC/navbarCreate.jsp"/>

<h1 class="text-light mb-3 position-relative text-footer" style="z-index: -10;">Modificar Evento</h1>

<div class="d-flex h-100 justify-content-center align-items-start pt-5">
    <form id="multiStepForm" action="${contexto}/EventoController" method="post"
          style="min-width: 600px; margin: 0 auto;" class="mt-3">
        <input type="hidden" class="is-valid" name="idEvento" value="${sessionScope.evento.idEvento}">
        <input type="hidden" class="is-valid" name="Modificacion" value="Parcial">
        <div class="step active">
            <div class="form-floating mb-4">
                <h3 class="text-light text-titulo">Paso 1: Informaci&oacute;n general del evento</h3>
                <p class="text-light text-center"><i class='bi bi-exclamation-triangle-fill text-warning'></i> Al ser un evento con participantes solo podr&aacute;s modificar la direcci&oacute;n, la fecha de Inicio y la fecha de Fin de tu evento.</p>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="input-group mb-4">
                        <div class="form-floating flex-grow-1">
                            <input type="text" class="form-control is-valid" id="titulo" name="titulo" placeholder="T&iacute;tulo" value="${sessionScope.evento.titulo}"
                                   readonly required>
                            <label for="titulo">T&iacute;tulo</label>
                        </div>
                        <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                              title="T&iacute;tulo"
                              data-bs-toggle="popover"
                              data-bs-placement="bottom"
                              data-bs-html="true"
                              data-bs-trigger="hover focus"
                              data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                        <li><i class='bi bi-exclamation-triangle-fill text-warning'></i> <strong>No se puede modificar el t&iacute;tulo a un evento con participantes.</strong></li>
                      </ul>">
                    <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
                </span>
                    </div>

                    <div class="input-group mb-4">
                        <div class="form-floating flex-grow-1">
                            <input type="number" class="form-control is-valid" id="numParticipantes" step="1" min="1"
                                   name="numParticipantes" placeholder="N&uacute;mero de participantes" value="${sessionScope.evento.numParticipantes}" readonly required>
                            <label for="numParticipantes">N&uacute;mero de participantes</label>
                        </div>
                        <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                              title="N&uacute;mero de participantes"
                              data-bs-toggle="popover"
                              data-bs-placement="bottom"
                              data-bs-html="true"
                              data-bs-trigger="hover focus"
                              data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                        <li><i class='bi bi-exclamation-triangle-fill text-warning'></i> <strong>No se puede modificar el n&uacute;mero de participantes a un evento con participantes.</strong></li>
                      </ul>">
                    <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
                </span>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="input-group mb-4">
                        <div class="form-floating flex-grow-1">
                            <input type="hidden" class="is-valid" name="idCategoria" value="${sessionScope.evento.subcategoria.categoria.idCategoria}">
                            <input type="text"
                                   class="form-control is-valid"
                                   id="categoria"
                                   name="categoriaText"
                                   placeholder="Categoría"
                                   value="${sessionScope.evento.subcategoria.categoria.nombre}"
                                   readonly
                                   required>
                            <label for="categoria">Categor&iacute;a</label>
                        </div>
                        <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                              title="Categor&iacute;a"
                              data-bs-toggle="popover"
                              data-bs-placement="bottom"
                              data-bs-html="true"
                              data-bs-trigger="hover focus"
                              data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
            <li><i class='bi bi-exclamation-triangle-fill text-warning'></i> <strong>No se puede modificar la categor&iacute;a a un evento con participantes.</strong></li>
          </ul>">
        <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
    </span>
                    </div>

                    <div class="input-group mb-3">
                        <div class="form-floating flex-grow-1">
                            <input type="hidden" class="is-valid" name="idSubcategoria" value="${sessionScope.evento.subcategoria.idSubcategoria}">
                            <input type="text"
                                   class="form-control is-valid"
                                   id="subcategoria"
                                   name="subcategoriaText"
                                   placeholder="Subcategoría"
                                   value="${sessionScope.evento.subcategoria.nombre}"
                                   readonly
                                   required>
                            <label for="subcategoria">Subcategoría</label>
                        </div>
                        <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                              title="Subcategor&iacute;a"
                              data-bs-toggle="popover"
                              data-bs-placement="bottom"
                              data-bs-html="true"
                              data-bs-trigger="hover focus"
                              data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                <li><i class='bi bi-exclamation-triangle-fill text-warning'></i> <strong>No se puede modificar la subcategor&iacute;a a un evento con participantes.</strong></li>
                              </ul>">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="form-floating mb-3">
                <textarea class="form-control is-valid" id="descripcion" name="descripcion" rows="3" placeholder="Descripci&oacute;n"
                          maxlength="255" readonly required>${sessionScope.evento.descripcion}"</textarea>
                        <label for="descripcion">Descripci&oacute;n</label>
                        <small id="charCount" class="form-text text-light d-block text-end">0/255 caracteres</small>
                    </div>
                </div>
            </div>

            <button type="button" class="btn btn-main btn-lg" onclick="nextStep()">Siguiente</button>
        </div>

        <div class="step">
            <div class="mb-4">
                <h3 class="text-light text-titulo">Paso 2: Ubicaci&oacute;n del evento</h3>
                <p class="text-light text-center"><i class='bi bi-exclamation-triangle-fill text-warning'></i> Al ser un evento con participantes solo podr&aacute;s modificar la direcci&oacute;n, la fecha de Inicio y la fecha de Fin de tu evento.</p>
            </div>

            <div class="input-group mb-3">
                <div class="form-floating flex-grow-1">
                    <input type="text" class="form-control is-valid" id="direccion" name="direccion" maxlength="50"
                           placeholder="Direcci&oacute;n" value="${sessionScope.evento.direccion}" required>
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
                    <input type="text" class="form-control is-valid" id="localidad" name="localidad" maxlength="50"
                           placeholder="Localidad" value="${sessionScope.evento.localidad}" readonly required>
                    <label for="localidad">Localidad</label>
                </div>
                <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                      title="Localidad"
                      data-bs-toggle="popover"
                      data-bs-placement="bottom"
                      data-bs-html="true"
                      data-bs-trigger="hover focus"
                      data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                <li><i class='bi bi-exclamation-triangle-fill text-warning'></i> <strong>No se puede modificar la localidad a un evento con participantes.</strong></li>
              </ul>">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
            </div>

            <div class="input-group mb-3">
                <div class="form-floating flex-grow-1">
                    <input type="text" class="form-control is-valid" id="provincia" name="provincia" maxlength="50"
                           placeholder="Provincia" value="${sessionScope.evento.provincia}" readonly required>
                    <label for="provincia">Provincia</label>
                </div>
                <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                      title="Provincia"
                      data-bs-toggle="popover"
                      data-bs-placement="bottom"
                      data-bs-html="true"
                      data-bs-trigger="hover focus"
                      data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                <li><i class='bi bi-exclamation-triangle-fill text-warning'></i> <strong>No se puede modificar la provincia a un evento con participantes.</strong></li>
              </ul>">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
            </div>

            <button type="button" class="btn btn-secondary btn-lg" onclick="prevStep()">Anterior</button>
            <button type="button" class="btn btn-main btn-lg" onclick="nextStep()">Siguiente</button>
        </div>


        <div class="step">
            <div class="mb-4">
                <h3 class="text-light text-titulo">Paso 3: Fechas del evento</h3>
                <p class="text-light text-center"><i class='bi bi-exclamation-triangle-fill text-warning'></i> Al ser un evento con participantes solo podr&aacute;s modificar la direcci&oacute;n, la fecha de Inicio y la fecha de Fin de tu evento.</p>
            </div>

            <div class="input-group mb-3">
                <div class="form-floating flex-grow-1">
                    <input type="date" class="form-control is-valid" id="fechaInicio" name="fechaInicio" value="${sessionScope.evento.fechaInicio}" required>
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
                    <input type="date" class="form-control is-valid" id="fechaFin" name="fechaFin" value="${sessionScope.evento.fechaFin}" required>
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

            <button type="button" class="btn btn-secondary btn-lg" onclick="prevStep()">Anterior</button>
            <button type="submit" class="btn btn-login btn-lg" id="enviar" name="accion" value="Modificar-Evento" disabled>Modificar Evento</button>
        </div>
    </form>
</div>
</body>
</html>