package es.entrehobbies.DAO;

import es.entrehobbies.beans.Usuario;

import java.util.List;
import java.util.Map;

public interface IUsuarioDAO {

    /**
     * Obtiene un usuario a partir de su email.
     *
     * Este método consulta la base de datos para buscar un usuario cuyo correo
     * electrónico coincida con el proporcionado. Si se encuentra un usuario, se
     * devuelve el objeto Usuario. En caso contrario, se retorna null.
     *
     * Consulta HQL --> 'SELECT * FROM Usuario u WHERE u.email = :email'
     *
     * @param email El correo electrónico del usuario que se quiere buscar.
     * @return El objeto Usuario si se encuentra, null si no se encuentra ningún
     * usuario con el correo proporcionado.
     */
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



}
