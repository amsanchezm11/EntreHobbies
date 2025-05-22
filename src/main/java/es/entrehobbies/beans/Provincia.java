package es.entrehobbies.beans;

import javax.persistence.*;

@Entity
@Table(name = "provincias")
public class Provincia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdProvincia")
    private int idProvincia;

    @Column(name = "Nombre", nullable = false, unique = true, length = 50)
    private String nombre;

    // GETTERS AND SETTERS

    public int getIdProvincia() {
        return idProvincia;
    }

    public void setIdProvincia(int idProvincia) {
        this.idProvincia = idProvincia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
