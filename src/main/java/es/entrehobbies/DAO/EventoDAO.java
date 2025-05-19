package es.entrehobbies.DAO;

import es.entrehobbies.beans.Evento;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import java.util.*;

public class EventoDAO extends GenericoDAO<Evento> implements IEventoDAO{
    @Override
    public List<Object[]> getAllEventosPorCategoriaOrdenados(int idCategoria) {
        List<Object[]> eventos = null;
        try {
            startTransaction();

            Calendar calendar = Calendar.getInstance();
            // Primer día del mes actual
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            Date primerDia = calendar.getTime();
            // Último día del mes actual
            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
            Date ultimoDia = calendar.getTime();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, e.subcategoria.nombre, e.creador.username, COUNT(p) " +
                            "FROM Evento e " +
                            "LEFT JOIN e.participantes p " +
                            "WHERE e.subcategoria.categoria.idCategoria = :idCategoria " +
                            "AND e.estado = 'Por_Empezar' " +
                            "AND e.fechaInicio BETWEEN :primerDia AND :ultimoDia " +
                            "GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, e.subcategoria.nombre, e.creador.username " +
                            "ORDER BY e.fechaCreacion DESC",
                    Object[].class
            );

            query.setParameter("idCategoria", idCategoria);
            query.setParameter("primerDia", primerDia);
            query.setParameter("ultimoDia", ultimoDia);

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
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre,e.direccion, e.localidad, e.provincia, e.estado, e.numParticipantes, " +
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
    public List<Object[]> getEventosDondeParticipaUsuario(int idUsuario) {
        List<Object[]> eventos = null;
        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre, e.direccion, e.localidad, e.provincia, e.numParticipantes, " +
                            "COUNT(ep) " +
                            "FROM Evento e " +
                            "JOIN e.participantes p " +
                            "LEFT JOIN e.participantes ep " +
                            "WHERE p.idUsuario = :idUsuario " +
                            "GROUP BY e.idEvento " +
                            "ORDER BY e.fechaInicio DESC",
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

            for (Object[] fila : resultados) {
                Integer mes = (Integer) fila[0];
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

    @Override
    public List<Object[]> getParticipantesDeUnEvento(int idEvento) {
        List<Object[]> resultados = null;
        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT u.username, u.avatar " +
                            "FROM Evento e " +
                            "JOIN e.participantes u " +
                            "WHERE e.idEvento = :idEvento",
                    Object[].class
            );
            query.setParameter("idEvento", idEvento);

            resultados = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return resultados;
    }

     @Override
    public List<Object[]> getAllEventosPorCategoriaOrdenadosUserLogueado(int idCategoria, int idUsuario) {
        List<Object[]> eventos = new ArrayList<>();
        try {
            startTransaction();

            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            Date primerDia = calendar.getTime();
            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
            Date ultimoDia = calendar.getTime();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, " +
                            "e.subcategoria.nombre, e.creador.username, COUNT(p), e.creador.idUsuario " +
                            "FROM Evento e " +
                            "LEFT JOIN e.participantes p " +
                            "WHERE e.subcategoria.categoria.idCategoria = :idCategoria " +
                            "AND e.estado = 'Por_Empezar' " +
                            "AND e.fechaInicio BETWEEN :primerDia AND :ultimoDia " +
                            "GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, " +
                            "e.subcategoria.nombre, e.creador.username, e.creador.idUsuario " +
                            "ORDER BY e.fechaCreacion DESC",
                    Object[].class
            );

            query.setParameter("idCategoria", idCategoria);
            query.setParameter("primerDia", primerDia);
            query.setParameter("ultimoDia", ultimoDia);

            List<Object[]> resultados = query.getResultList();

            for (Object[] row : resultados) {
                Integer idEvento = (Integer) row[0];
                Integer idCreador = (Integer) row[15];

                String rol;

                if (idUsuario == idCreador) {
                    rol = "creador";
                } else {
                    Query<Long> subquery = sesion.createQuery(
                            "SELECT COUNT(u) FROM Evento e JOIN e.participantes u " +
                                    "WHERE e.idEvento = :idEvento AND u.idUsuario = :idUsuario",
                            Long.class
                    );
                    subquery.setParameter("idEvento", idEvento);
                    subquery.setParameter("idUsuario", idUsuario);

                    Long count = subquery.uniqueResult();
                    rol = (count != null && count > 0) ? "participante" : "libre";
                }

                // Añadimos el rol como evento[16]
                Object[] rowConRol = Arrays.copyOf(row, row.length + 1);
                rowConRol[row.length] = rol;

                eventos.add(rowConRol);
            }

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return eventos;
    }

}
