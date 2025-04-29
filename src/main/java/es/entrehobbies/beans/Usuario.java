package es.entrehobbies.beans;



import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "usuarios", uniqueConstraints = {
        @UniqueConstraint(columnNames = "Email", name = "UK_usuario_email"),
        @UniqueConstraint(columnNames = "Telefono", name = "UK_usuario_telefono"),
        @UniqueConstraint(columnNames = "Username", name = "UK_usuario_username")})
public class Usuario implements Serializable {

    public enum Rol {
        Admin, Organizador, Colaborador
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdUsuario")
    private Integer idUsuario;

    @Column(name = "Nombre", length = 30, nullable = false)
    private String nombre;

    @Column(name = "Apellidos", length = 40, nullable = false)
    private String apellidos;

    @Column(name = "Username", length = 20, nullable = false)
    private String username;

    @Column(name = "Email", length = 60, nullable = false)
    private String email;

    @Column(name = "Password", length = 100, nullable = false)
    private String password;

    @Column(name = "Telefono", length = 9, nullable = false)
    private String telefono;

    @Column(name = "FechaNacimiento", nullable = true)
    @Temporal(TemporalType.DATE)
    private Date fechaNacimiento;

    @Column(name = "Rol", length = 11, nullable = false)
    @Enumerated(EnumType.STRING)
    private Rol rol;

    @Column(name = "Localidad", length = 50, nullable = false)
    private String localidad;

    @Column(name = "Provincia", length = 50, nullable = false)
    private String provincia;

    // ***De momento este atributo queda pendiente de revisión con el tutor
   // @Column(name = "UltimoAcceso", nullable = true)
   //  @Temporal(TemporalType.DATE)
   // private Date ultimoAcceso;

    @Column(name = "Avatar", length = 30, nullable = false)
    private String avatar = "avatar.svg";

    // ***Este atributo queda pendiente de revisión
    @ManyToMany(fetch = FetchType.EAGER)
    @Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
    @JoinTable(
            name = "usuarioeventos",
            joinColumns = @JoinColumn(name = "IdUsuario", foreignKey = @ForeignKey(name = "FK_usuarioeventos_eventos")),
            inverseJoinColumns = @JoinColumn(name = "IdEvento")
    )
    private List<Evento> eventos;

    // GETTERS AND SETTERS


    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public List<Evento> getEventos() {
        return eventos;
    }

    public void setEventos(List<Evento> eventos) {
        this.eventos = eventos;
    }
}
