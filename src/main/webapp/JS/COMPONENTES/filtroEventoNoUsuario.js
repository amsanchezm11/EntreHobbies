import {pintarEventos} from "./pintarEventos.js";

document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("#formFiltros");
    const contenedor = document.querySelector("#contenedorEventos");
    const contexto = document.body.getAttribute("data-contexto");

    async function enviarFormulario() {
        const data = new URLSearchParams();
        data.append("accion", "Filtro-Evento-No-User");
        data.append("idCategoria", document.getElementById("categoria").value);
        data.append("idSubcategoria", document.getElementById("subcategoria").value || "");
        data.append("provincia", document.getElementById("provincia").value || "");

        try {
            const response = await fetch(`Ajax`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded",
                },
                body: data.toString(),
            });

            if (!response.ok) throw new Error(`HTTP ${response.status}`);

            const eventos = await response.json();
            contenedor.innerHTML = "";

            if (eventos.length === 0) {
                contenedor.innerHTML = `
                        <div class="card shadow rounded-4 border-0 bg-light-subtle mx-auto mt-5" style="max-width: 600px;">
                            <div class="card-body text-center p-5">
                                <i class="bi bi-emoji-frown fs-1 text-secondary mb-3"></i>
                                <h5 class="card-title text-muted mb-3">No se han encontrado eventos</h5>
                                <p class="card-text text-muted">Prueba ajustando los filtros seleccionando otra subcategoría o provincia.</p>
                            </div>
                        </div>`;
                return;
            }

            pintarEventos(eventos, contenedor, contexto);

        } catch (err) {
            console.error("Error al aplicar filtros:", err);
            contenedor.innerHTML = `<p class="text-danger text-center mt-4">Ocurrió un error al filtrar los eventos.</p>`;
        }
    }

    ["subcategoria", "provincia"].forEach(id => {
        const campo = document.getElementById(id);
        if (campo) {
            campo.addEventListener("change", async () => {
                if (campo.value && campo.value !== "") {
                    await enviarFormulario();
                }
            });
        }
    });
});
