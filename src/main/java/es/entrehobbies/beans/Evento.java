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

    @Column(name = "NumParticipantes", nullable = false)
    private int numParticipantes;

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

    // GETTERS AND SETTERS


    public Integer getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(Integer idEvento) {
        this.idEvento = idEvento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public Usuario getCreador() {
        return creador;
    }

    public void setCreador(Usuario creador) {
        this.creador = creador;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public int getNumParticipantes() {
        return numParticipantes;
    }

    public void setNumParticipantes(int numParticipantes) {
        this.numParticipantes = numParticipantes;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public ModoEvento getModo() {
        return modo;
    }

    public void setModo(ModoEvento modo) {
        this.modo = modo;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public List<Usuario> getParticipantes() {
        return participantes;
    }

    public void setParticipantes(List<Usuario> participantes) {
        this.participantes = participantes;
    }


}
