import {pintarEventosLogueado} from "./pintarEventosLogueado.js";

document.addEventListener("DOMContentLoaded", () => {
    const contenedor = document.querySelector("#contenedorEventos");
    const contexto = document.body.getAttribute("data-contexto");

    const campos = ["subcategoria", "provincia"];
    const categoria = document.getElementById("categoria");

    async function aplicarFiltro() {
        const data = new URLSearchParams();
        data.append("accion", "filtrarEventosUsuario");
        data.append("idCategoria", categoria?.value || "");
        data.append("idSubcategoria", document.getElementById("subcategoria")?.value || "");
        data.append("provincia", document.getElementById("provincia")?.value || "");

        try {
            const response = await fetch(`Ajax`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: data.toString()
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

            pintarEventosLogueado(eventos, contenedor, contexto);
        } catch (err) {
            console.error("Error al filtrar eventos (logueado):", err);
            contenedor.innerHTML = `
                <div class="col-12 text-center mt-4">
                    <div class="card border-0 shadow-sm rounded-4 p-4">
                        <h5 class="text-danger mb-0">Error al aplicar los filtros.</h5>
                    </div>
                </div>`;
        }
    }


    campos.forEach(id => {
        const campo = document.getElementById(id);
        campo?.addEventListener("change", async () => {
            if (campo.value) {
                await aplicarFiltro();
            }
        });
    });
});
