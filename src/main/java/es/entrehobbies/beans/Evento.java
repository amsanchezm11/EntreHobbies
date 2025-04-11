package es.entrehobbies.beans;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "eventos")
public class Evento implements Serializable {

    public enum ModoEvento {
        Comunitario, Competitivo
    }

    public enum Estado {
        Por_Empezar, En_Curso, Finalizado, Cancelado
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdEvento")
    private Integer idEvento;

    @Column(name = "Titulo", length = 40, nullable = false)
    private String nombre;

    @Column(name = "Descripcion", length = 100, nullable = false)
    private String descripcion;

    @Column(name = "FechaCreacion", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechaCreacion;

    @Column(name = "FechaInicio", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;

    @Column(name = "FechaFin", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechaFin;

    @ManyToOne
    @JoinColumn(name = "Creador", nullable = false)
    private Usuario creador;

    @ManyToOne
    @JoinColumn(name = "Categoria", nullable = false)
    private Categoria categoria;

    @Column(name = "Direccion", length = 50, nullable = false)
    private String direccion;

    @Column(name = "Localidad", length = 50, nullable = false)
    private String localidad;

    @Column(name = "Provincia", length = 50, nullable = false)
    private String provincia;

    //@Column(name = "ModoEvento", columnDefinition = "VARCHAR(11) NOT NULL DEFAULT 'Comunitario'") ***Revisar
    @Column(name = "ModoEvento", length = 11, nullable = false)
    @Enumerated(EnumType.STRING)
    private ModoEvento modo;

    //@Column(name = "Estado", columnDefinition = "VARCHAR(11) NOT NULL DEFAULT 'Por Empezar'") ***Revisar
    @Column(name = "Estado", length = 11, nullable = false)
    @Enumerated(EnumType.STRING)
    private Estado estado;

    @ManyToMany(fetch = FetchType.EAGER, mappedBy = "eventos")
    @Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
    private List<Usuario> participantes;
}
