package es.entrehobbies.DAO;

import es.entrehobbies.beans.Evento;
import es.entrehobbies.beans.Usuario;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
    public Boolean comprobarTelefono(String telefono) {
        boolean existe = false;
        try {
            startTransaction();

            Query<Long> query = sesion.createQuery(
                    "SELECT COUNT(u) FROM Usuario u WHERE u.telefono = :telefono", Long.class);
            query.setParameter("telefono", telefono);

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
    public Map<String, Long> getNumeroUsuariosPorSexo() {
        Map<String, Long> resultados = new LinkedHashMap<>();

        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT u.sexo, COUNT(u) FROM Usuario u GROUP BY u.sexo",
                    Object[].class
            );

            List<Object[]> datos = query.getResultList();

            for (Object[] fila : datos) {
                Usuario.Sexo sexoEnum = (Usuario.Sexo) fila[0];
                String sexo = (sexoEnum != null) ? sexoEnum.name() : "No especificado";
                Long total = (Long) fila[1];
                resultados.put(sexo, total);
            }

            endTransaction();
        } catch (HibernateException he) {
            he.printStackTrace();
            handleExcepcion(he);
        }

        return resultados;
    }

    @Override
    public List<Object[]> getAllUsuariosResumen() {
        List<Object[]> resultados = null;
        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT u.idUsuario, u.nombre, u.apellidos, u.username, u.email, u.telefono, " +
                            "u.fechaNacimiento, u.localidad, u.provincia, " +
                            "(SELECT COUNT(e1) FROM Evento e1 WHERE e1.creador.idUsuario = u.idUsuario), " +
                            "(SELECT COUNT(e2) FROM Evento e2 JOIN e2.participantes p WHERE p.idUsuario = u.idUsuario) " +
                            "FROM Usuario u",
                    Object[].class
            );

            resultados = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return resultados;
    }


}
