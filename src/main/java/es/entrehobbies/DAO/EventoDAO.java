package es.entrehobbies.DAO;

import es.entrehobbies.beans.Evento;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class EventoDAO extends GenericoDAO<Evento> implements IEventoDAO{
    @Override
    public List<Object[]> getAllEventosPorCategoriaOrdenados(int idCategoria) {
        List<Object[]> eventos = null;
        try {
            startTransaction();

            // Consulta HQL para obtener los datos del evento por categoría, ordenados por fecha de creación descendente
            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, e.subcategoria.nombre, e.creador.nombre, COUNT(p) " +
                            "FROM Evento e " +
                            "LEFT JOIN e.participantes p " +
                            "WHERE e.subcategoria.categoria.idCategoria = :idCategoria " +
                            "GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia, " +
                            "e.subcategoria.categoria.imagen, e.creador.nombre " +
                            "ORDER BY e.fechaCreacion DESC",
                    Object[].class
            );
            query.setParameter("idCategoria", idCategoria);

            eventos = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return eventos;
    }

    @Override
    public List<Object[]> getAllEventosUsuariosOrdenadosCrono(int idUsuario) {
        List<Object[]> eventos = null;
        try {
            startTransaction();

            // Consulta HQL para obtener los eventos creados por el usuario, con la información solicitada y ordenados por fecha de creación
            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre,e.direccion, e.localidad, e.provincia, e.numParticipantes, " +
                            "COUNT(ep) " +
                            "FROM Evento e " +
                            "LEFT JOIN e.participantes ep " +
                            "WHERE e.creador.idUsuario = :idUsuario " +
                            "GROUP BY e.idEvento " +
                            "ORDER BY e.fechaCreacion DESC",
                    Object[].class
            );
            query.setParameter("idUsuario", idUsuario);

            eventos = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return eventos;
    }

    @Override
    public List<Object[]> getNumeroEventosPorCategoria() {
        List<Object[]> resultados = null;
        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.subcategoria.categoria.nombre, COUNT(e) " +
                            "FROM Evento e " +
                            "GROUP BY e.subcategoria.categoria.nombre",
                    Object[].class
            );

            resultados = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return resultados;
    }

    @Override
    public Map<String, Long> getNumeroEventosPorMes(int anio) {
        Map<String, Long> mapaMeses = new LinkedHashMap<>();
        String[] nombresMeses = {
                "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
        };

        // Inicializamos todos los meses en 0
        for (int i = 0; i < 12; i++) {
            String clave = nombresMeses[i] + " " + anio;
            mapaMeses.put(clave, 0L);
        }

        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT MONTH(e.fechaCreacion), COUNT(e) " +
                            "FROM Evento e " +
                            "WHERE YEAR(e.fechaCreacion) = :anio " +
                            "GROUP BY MONTH(e.fechaCreacion) " +
                            "ORDER BY MONTH(e.fechaCreacion)",
                    Object[].class
            );
            query.setParameter("anio", anio);
            List<Object[]> resultados = query.getResultList();

            // Rellenamos con los datos obtenidos
            for (Object[] fila : resultados) {
                Integer mes = (Integer) fila[0]; // de 1 a 12
                Long total = (Long) fila[1];
                String clave = nombresMeses[mes - 1] + " " + anio;
                mapaMeses.put(clave, total);
            }

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }

        return mapaMeses;
    }

    @Override
    public List<Object[]> getTop5ProvinciasConMasEventos() {
        List<Object[]> resultados = null;
        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.provincia, COUNT(e)\n" +
                            "FROM Evento e\n" +
                            "GROUP BY e.provincia\n" +
                            "ORDER BY COUNT(e) DESC\n",
                    Object[].class
            ).setMaxResults(5); // LIMIT 5

            resultados = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return resultados;
    }

    @Override
    public List<Object[]> getTop5UsuariosConMasEventos() {
        List<Object[]> resultados = null;
        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.creador.username, COUNT(e) " +
                            "FROM Evento e " +
                            "GROUP BY e.creador.username " +
                            "ORDER BY COUNT(e) DESC",
                    Object[].class
            ).setMaxResults(5);

            resultados = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return resultados;
    }

    @Override
    public List<Object[]> getTop5CategoriasConMasEventos() {
        List<Object[]> resultados = null;
        try {
            startTransaction();

            // Consulta para obtener las 5 categorías con más eventos
            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.subcategoria.categoria.nombre, COUNT(e) " +
                            "FROM Evento e " +
                            "GROUP BY e.subcategoria.categoria.nombre " +
                            "ORDER BY COUNT(e) DESC",
                    Object[].class
            ).setMaxResults(5);

            resultados = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return resultados;
    }

    @Override
    public List<Object[]> getTop5SubcategoriasConMasEventos() {
        List<Object[]> resultados = null;
        try {
            startTransaction();

            // Consulta para obtener las 5 subcategorías con más eventos
            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.subcategoria.nombre, COUNT(e) " +
                            "FROM Evento e " +
                            "GROUP BY e.subcategoria.nombre " +
                            "ORDER BY COUNT(e) DESC",
                    Object[].class
            ).setMaxResults(5);

            resultados = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return resultados;
    }


}
