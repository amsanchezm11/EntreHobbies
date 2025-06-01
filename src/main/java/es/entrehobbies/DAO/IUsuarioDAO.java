package es.entrehobbies.DAO;

import es.entrehobbies.beans.Usuario;

import java.util.List;
import java.util.Map;

public interface IUsuarioDAO {

    public Usuario getUsuarioPorEmail(String email, String password);

    public Usuario getUsuarioPorUsername(String username, String password);

    public Boolean comprobarEmail(String email);

    public Boolean comprobarUsername(String username);

    public Boolean comprobarTelefono(String telefono);

    public Map<String, Long> getNumeroUsuariosPorSexo();

    public List<Object[]> getAllUsuariosResumen();

    public Usuario getUsuarioPorId(int idUsuario);

    public Object[] getUsuarioConMasEventosCreados();

    public Object[] getUsuarioConMasEventosParticipados();

    public Long getTotalUsuariosRegistrados();

    public boolean comprobarPassword(int idUsuario, String password);

    public Map<String, Long> getNumeroUsuariosPorMes(int anio);



}
