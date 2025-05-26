export function pintarEventosLogueado(eventos, contenedor, contexto) {
    contenedor.innerHTML = "";

    if (eventos.length === 0) {
        contenedor.innerHTML = `<div class="card border-0 shadow rounded-4 text-center p-4">
            <div class="card-body">
                <h5 class="card-title">No se han encontrado eventos</h5>
                <p class="card-text text-muted">Prueba con otros filtros o vuelve más tarde.</p>
            </div>
        </div>`;
        return;
    }

    let fila = null;
    eventos.forEach((evento, index) => {
        if (index % 2 === 0) {
            fila = document.createElement("div");
            fila.className = "row justify-content-center mb-4";
            contenedor.appendChild(fila);
        }

        const tarjeta = document.createElement("div");
        tarjeta.className = "col-md-6 mb-4";
        tarjeta.innerHTML = `
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
                                 style="width: ${(evento[14] / evento[6]) * 100}%"
                                 aria-valuenow="${evento[14]}" aria-valuemin="0" aria-valuemax="${evento[6]}">
                            </div>
                        </div>
                    </div>
                    <div class="row text-center small text-muted mb-2">
                        <div class="col"><i class="bi bi-calendar-event me-1"></i>Empieza: ${formatearFecha(evento[4])}</div>
                        <div class="col"><i class="bi bi-calendar-check me-1"></i>Acaba: ${formatearFecha(evento[5])}</div>
                    </div>
                    <p class="card-text small mb-1"><i class="bi bi-tags me-2"></i><strong>Subcategoría:</strong> ${evento[12]}</p>
                    <p class="card-text small mb-1"><i class="bi bi-geo me-2"></i><strong>Dirección:</strong> ${evento[7]}</p>
                    <p class="card-text small mb-1"><i class="bi bi-globe me-2"></i><strong>Localidad:</strong> ${evento[8]}, ${evento[9]}</p>
                    <p class="card-text small mb-1"><i class="bi bi-person me-2"></i><strong>Organizador:</strong> ${evento[13]}</p>
                    <p class="card-text small mb-1"><i class="bi bi-info-circle me-2"></i><strong>Estado:</strong> ${estadoBonito(evento[15])}</p>
                    ${generarBotones(evento, contexto)}
                </div>
            </div>
        `;

        fila.appendChild(tarjeta);
    });
}

function formatearFecha(fecha) {
    const date = new Date(fecha);
    if (isNaN(date.getTime())) return '';
    return `${String(date.getDate()).padStart(2, '0')}/${String(date.getMonth() + 1).padStart(2, '0')}/${date.getFullYear()}`;
}

function estadoBonito(estado) {
    if (estado === "En_Curso") return `<span class="text-info fw-bold fst-italic">En Curso</span>`;
    if (estado === "Por_Empezar") return `<span class="text-success fw-bold fst-italic">Por Empezar</span>`;
    return estado;
}

function generarBotones(evento, contexto) {
    const idEvento = evento[0];
    const participantes = evento[14];
    const maxParticipantes = evento[6];
    const rol = evento[17];
    const estado = evento[15];

    let html = "";

    if (participantes >= maxParticipantes && rol !== "creador" && rol !== "participante") {
        html += `<div class="alert alert-completo text-center p-2 rounded-pill mb-0"><span>Evento completo</span></div>`;
    } else if (rol === "creador") {
        html += `<div class="alert alert-creador text-center p-2 rounded-pill mb-0"><span>Eres el creador del evento</span></div>`;
    } else if (rol === "participante") {
        html += `<form action="${contexto}/UsuarioEventoController" method="post" class="mt-auto">
                    <input type="hidden" name="idEvento" value="${idEvento}">
                    <button class="btn btn-warning btn-sm rounded-pill w-100" name="accion" value="Desapuntarse-evento">
                        <i class="bi bi-x-circle me-2"></i>Desapuntarse
                    </button>
                </form>`;
    } else if (estado === "En_Curso") {
        html += `<div class="alert alert-creador text-center p-2 rounded-pill mb-0"><span>No puedes apuntarte a un evento en curso</span></div>`;
    } else {
        html += `<form action="${contexto}/UsuarioEventoController" method="post" class="mt-auto">
                    <input type="hidden" name="idEvento" value="${idEvento}">
                    <button class="btn btn-main btn-sm rounded-pill w-100" name="accion" value="Unirse-evento">
                        <i class="bi bi-check2-circle me-2"></i>Apuntarse
                    </button>
                </form>`;
    }

    html += `<button type="button" class="btn btn-outline-teal btn-sm rounded-pill mt-2 w-100" data-bs-toggle="modal" data-bs-target="#modalParticipantes" data-id-evento="${idEvento}"><i class="bi bi-people me-2"></i>Ver participantes</button>`;

    return html;
}
