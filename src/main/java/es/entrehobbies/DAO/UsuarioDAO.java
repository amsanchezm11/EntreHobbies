package es.entrehobbies.DAO;

import es.entrehobbies.beans.Usuario;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

public class UsuarioDAO extends GenericoDAO<Usuario> implements IUsuarioDAO {

    @Override
    public Usuario getUsuarioPorEmail(String email, String password) {
        Usuario user = null;
        try {
            startTransaction();

            Query<Usuario> query = sesion.createQuery(
                    "FROM Usuario u WHERE u.email = :email AND u.password = :password", Usuario.class);
            query.setParameter("email", email);
            query.setParameter("password", password);
            user = query.uniqueResult();

            if (user != null) {
                System.out.println("Usuario encontrado: " + user.getEmail());
            } else {
                System.out.println("No se encontró ningún usuario con esos datos");
            }

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return user;
    }


    @Override
    public Usuario getUsuarioPorUsername(String username, String password) {
        Usuario user = null;
        try {
            startTransaction();

            Query<Usuario> query = sesion.createQuery(
                    "FROM Usuario u WHERE u.username = :username AND u.password = :password", Usuario.class);
            query.setParameter("username", username);
            query.setParameter("password", password);
            user = query.uniqueResult();

            if (user != null) {
                System.out.println("Usuario encontrado: " + user.getUsername());
            } else {
                System.out.println("No se encontró ningún usuario con esos datos");
            }

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return user;
    }

    @Override
    public Boolean comprobarEmail(String email) {
        boolean existe = false;
        try {
            startTransaction();

            Query<Long> query = sesion.createQuery(
                    "SELECT COUNT(u) FROM Usuario u WHERE u.email = :email", Long.class);
            query.setParameter("email", email);

            Long count = query.uniqueResult();
            if (count != null && count > 0) {
                existe = true;
            }

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return existe;
    }

    @Override
    public Boolean comprobarUsername(String username) {
        boolean existe = false;
        try {
            startTransaction();

            Query<Long> query = sesion.createQuery(
                    "SELECT COUNT(u) FROM Usuario u WHERE u.username = :username", Long.class);
            query.setParameter("username", username);

            Long count = query.uniqueResult();
            if (count != null && count > 0) {
                existe = true;
            }

            endTransaction();
        }  catch (HibernateException he) {
            handleExcepcion(he);
        }
        return existe;
    }

    @Override
    public Boolean insertarUsuario(Usuario usuario) {
        boolean insertado = false;

        try {
            startTransaction();

            Query query = sesion.createQuery("INSERT INTO Usuario (nombre, apellidos, username, email, password ,telefono, fechaNacimiento, rol, localidad, provincia) " +
                    "VALUES (:nombre, :apellidos, :username, :email, :password, :telefono, :fechaNacimiento, :rol, :localidad, :provincia)");

            query.setParameter("nombre", usuario.getNombre());
            query.setParameter("apellidos", usuario.getApellidos());
            query.setParameter("username", usuario.getUsername());
            query.setParameter("email", usuario.getEmail());
            query.setParameter("password", usuario.getPassword());
            query.setParameter("telefono", usuario.getTelefono());
            query.setParameter("fechaNacimiento", usuario.getFechaNacimiento());
            query.setParameter("rol", usuario.getRol());
            query.setParameter("localidad", usuario.getLocalidad());
            query.setParameter("provincia", usuario.getProvincia());
            query.executeUpdate();

            Query idQuery = sesion.createQuery("SELECT idUsuario FROM Usuario u WHERE u.username = :username");
            int userId = (int) idQuery.uniqueResult();

            // Seteamos el id al usuario
            usuario.setIdUsuario(userId);

            endTransaction();
            insertado = true;

        } catch (HibernateException he){
            handleExcepcion(he);
        }

        return insertado;
    }


}
