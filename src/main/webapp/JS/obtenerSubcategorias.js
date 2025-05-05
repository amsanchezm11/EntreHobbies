document.addEventListener("DOMContentLoaded", () => {
    const categoriaSelect = document.getElementById("categoria");
    const subcategoriaSelect = document.getElementById("subcategoria");

    categoriaSelect.addEventListener("change", () => {
        const idCategoria = categoriaSelect.value;

        fetch(`Ajax`, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: `accion=obtenerSubcategorias&idCategoria=${idCategoria}`,
        })
            .then(response => response.json())
            .then(data => {
                // Limpiamos subcategorías anteriores
                subcategoriaSelect.innerHTML = '<option value="" disabled selected>Selecciona una subcategoría</option>';

                data.forEach(sub => {
                    const option = document.createElement("option");
                    option.value = sub.id;
                    option.textContent = sub.nombre;
                    subcategoriaSelect.appendChild(option);
                });
            })
            .catch(error => console.error("Error al obtener subcategorías:", error));
    });
});
