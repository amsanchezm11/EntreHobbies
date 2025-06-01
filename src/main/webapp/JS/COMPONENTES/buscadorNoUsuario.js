document.addEventListener("DOMContentLoaded", () => {
    const input = document.querySelector("#buscador");
    const contenedor = document.querySelector("#contenedorEventos");
    const contexto = document.body.getAttribute("data-contexto");

    let timeout = null;

    input.addEventListener("input", () => {
        const filtro = input.value.trim();

        clearTimeout(timeout);
        if (filtro.length >= 4 || filtro.length === 0) {
            timeout = setTimeout(async () => {
                const data = new URLSearchParams();
                data.append("accion", "Buscar-Eventos-No-User");
                data.append("filtro", filtro);
                data.append("idCategoria", document.getElementById("categoriaId").value);

                try {
                    const response = await fetch("Ajax", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/x-www-form-urlencoded",
                            "Accept-Charset": "utf-8"
                        },
                        body: data.toString()
                    });

                    if (!response.ok) throw new Error(`HTTP ${response.status}`);
                    const eventos = await response.json();

                    contenedor.innerHTML = "";

                    if (eventos.length === 0) {
                        contenedor.innerHTML = "<p class='text-center text-muted mt-4'>No se han encontrado eventos.</p>";
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
                                                style="width: ${(evento[14] / evento[6]) * 100}%;"
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
                                    <p class="card-text small mb-1"><i class="bi bi-person me-2"></i><strong>Creador:</strong> ${evento[13]}</p>
                                    <p class="card-text small mb-1"><i class="bi bi-info-circle me-2"></i><strong>Estado:</strong> ${estadoBonito(evento[15])}</p>
                                    <div class="d-flex flex-column gap-1 mt-2">
                                        <div class="alert alert-creador text-center p-2 rounded-pill mb-0">
                                            <span>Regístrate para poder unirte</span>
                                        </div>
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
                        `;
                        fila.appendChild(tarjeta);
                    });

                } catch (err) {
                    console.error("Error en el buscador:", err);
                    contenedor.innerHTML = "<p class='text-danger text-center mt-4'>Error al buscar eventos.</p>";
                }
            }, 300);
        }
    });

    function formatearFecha(fecha) {
        const date = new Date(fecha);
        if (isNaN(date.getTime())) return '';

        const dia = String(date.getDate()).padStart(2, '0');
        const mes = String(date.getMonth() + 1).padStart(2, '0');
        const anio = date.getFullYear();

        return `${dia}/${mes}/${anio}`;
    }


    function estadoBonito(estado) {
        if (estado === "En_Curso") return `<span class="text-info fw-bold fst-italic">En Curso</span>`;
        if (estado === "Por_Empezar") return `<span class="text-success fw-bold fst-italic">Por Empezar</span>`;
        return estado;
    }
});
