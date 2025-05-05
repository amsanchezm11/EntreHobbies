package es.entrehobbies.beans;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "subcategorias", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"Nombre", "IdCategoria"}, name = "UK_subcategoria_nombre_categoria")
})
public class Subcategoria implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdSubcategoria")
    private Integer idSubcategoria;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdCategoria", nullable = false,
            foreignKey = @ForeignKey(name = "fk_subcategoria_categoria"))
    private Categoria categoria;

    @Column(name = "Nombre", length = 40, nullable = false)
    private String nombre;

    // GETTERS AND SETTERS

    public Integer getIdSubcategoria() {
        return idSubcategoria;
    }

    public void setIdSubcategoria(Integer idSubcategoria) {
        this.idSubcategoria = idSubcategoria;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}