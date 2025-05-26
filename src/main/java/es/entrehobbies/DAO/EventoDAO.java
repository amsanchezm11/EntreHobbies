package es.entrehobbies.DAO;

import es.entrehobbies.beans.Evento;
import es.entrehobbies.beans.Usuario;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import java.util.*;

public class EventoDAO extends GenericoDAO<Evento> implements IEventoDAO {
    @Override
    public List<Object[]> getAllEventosPorCategoriaOrdenados(int idCategoria) {
        List<Object[]> eventos = null;
        try {
            startTransaction();

            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            Date hoy = calendar.getTime();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia.nombre, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, e.subcategoria.nombre, e.creador.username, COUNT(p), e.estado " +
                            "FROM Evento e " +
                            "LEFT JOIN e.participantes p " +
                            "WHERE e.subcategoria.categoria.idCategoria = :idCategoria " +
                            "AND (e.estado = 'Por_Empezar' OR e.estado = 'En_Curso') " +
                            "AND e.fechaInicio >= :hoy " +
                            "GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia.nombre, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, e.subcategoria.nombre, e.creador.username, e.estado " +
                            "ORDER BY e.fechaInicio DESC",
                    Object[].class
            );

            query.setParameter("idCategoria", idCategoria);
            query.setParameter("hoy", hoy);


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

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre, e.direccion, e.localidad, e.provincia.nombre, e.estado, e.numParticipantes, " +
                            "COUNT(ep) " +
                            "FROM Evento e " +
                            "LEFT JOIN e.participantes ep " +
                            "WHERE e.creador.idUsuario = :idUsuario AND (e.estado = 'En_Curso' OR e.estado = 'Por_Empezar') " +
                            "GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre, e.direccion, e.localidad, e.provincia.nombre, e.estado, e.numParticipantes " +
                            "ORDER BY CASE WHEN e.estado = 'En_Curso' THEN 1 WHEN e.estado = 'Por_Empezar' THEN 2 ELSE 3 END, e.fechaInicio DESC",
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
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre, e.direccion, e.localidad, e.provincia.nombre, e.numParticipantes, " +
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
                    "SELECT e.provincia.nombre, COUNT(e)\n" +
                            "FROM Evento e\n" +
                            "GROUP BY e.provincia.nombre\n" +
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
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            Date hoy = calendar.getTime();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia.nombre, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, " +
                            "e.subcategoria.nombre, e.creador.username, COUNT(p),e.estado, e.creador.idUsuario " +
                            "FROM Evento e " +
                            "LEFT JOIN e.participantes p " +
                            "WHERE e.subcategoria.categoria.idCategoria = :idCategoria " +
                            "AND (e.estado = 'Por_Empezar' OR e.estado = 'En_Curso') " +
                            "AND e.fechaInicio >= :hoy " +
                            "GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia.nombre, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, " +
                            "e.subcategoria.nombre, e.creador.username, e.creador.idUsuario " +
                            "ORDER BY e.fechaInicio DESC",
                    Object[].class
            );

            query.setParameter("idCategoria", idCategoria);
            query.setParameter("hoy", hoy);

            List<Object[]> resultados = query.getResultList();

            for (Object[] row : resultados) {
                Integer idEvento = (Integer) row[0];
                Integer idCreador = (Integer) row[16];

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

    @Override
    public Evento getEventoCompletoPorId(int idEvento) {
        Evento evento = null;
        try {
            startTransaction();

            Query<Evento> query = sesion.createQuery(
                    "SELECT e FROM Evento e " +
                            "JOIN FETCH e.creador " +
                            "JOIN FETCH e.subcategoria sc " +
                            "JOIN FETCH sc.categoria c " +
                            "WHERE e.idEvento = :idEvento", Evento.class);

            query.setParameter("idEvento", idEvento);
            evento = query.getSingleResult();

            // Obtenemos las colecciones lazy (participantes y subcategorías)
            Hibernate.initialize(evento.getParticipantes());
            Hibernate.initialize(evento.getSubcategoria().getCategoria().getSubcategorias());

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }

        return evento;
    }

    @Override
    public List<Object[]> getAllEventosResumen() {
        List<Object[]> resultados = null;
        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaInicio, e.fechaFin, " +
                            "e.localidad, e.provincia.nombre, e.creador.username, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre, " +
                            "e.modo, e.estado, COUNT(p), e.numParticipantes " +
                            "FROM Evento e LEFT JOIN e.participantes p " +
                            "GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaInicio, e.fechaFin, " +
                            "e.localidad, e.provincia.nombre, e.creador.username, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre, " +
                            "e.modo, e.estado, e.numParticipantes",
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
    public void actualizarEventosEnCurso(Date fecha) {
        try {
            startTransaction();

            Query query = sesion.createQuery(
                    "UPDATE Evento e SET e.estado = 'En_Curso' " +
                            "WHERE e.fechaInicio = :fecha AND e.estado = 'Por_Empezar'"
            );
            query.setParameter("fecha", fecha);

            query.executeUpdate();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
    }

    @Override
    public void actualizarEventosFinalizados(Date fecha) {
        try {
            startTransaction();

            Query query = sesion.createQuery(
                    "UPDATE Evento e SET e.estado = 'Finalizado' " +
                            "WHERE e.fechaFin = :fecha And e.estado = 'En_Curso'"
            );
            query.setParameter("fecha", fecha);

            query.executeUpdate();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
    }

    @Override
    public List<Object[]> getAllEventosParticipadosOrdenadosPorFechaInicio(Usuario usuario) {
        List<Object[]> eventos = null;
        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre, e.direccion, e.localidad, e.provincia.nombre, " +
                            "e.estado, e.numParticipantes, COUNT(ep), e.creador.username " +
                            "FROM Evento e " +
                            "LEFT JOIN e.participantes ep " +
                            "WHERE :usuario MEMBER OF e.participantes " +
                            "AND (e.estado = 'En_Curso' OR e.estado = 'Por_Empezar') " +
                            "GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre, e.direccion, e.localidad, e.provincia.nombre, " +
                            "e.estado, e.numParticipantes, e.creador.username " +
                            "ORDER BY CASE WHEN e.estado = 'En_Curso' THEN 1 WHEN e.estado = 'Por_Empezar' THEN 2 ELSE 3 END, e.fechaInicio DESC",
                    Object[].class
            );

            query.setParameter("usuario", usuario);

            eventos = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return eventos;
    }

    @Override
    public List<Object[]> getEventosResumenPorUsuario(int idUsuario) {
        List<Object[]> resultados = null;
        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaInicio, e.fechaFin, " +
                            "e.localidad, e.provincia.nombre, e.creador.username, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre, " +
                            "e.modo, e.estado, COUNT(p), e.numParticipantes " +
                            "FROM Evento e LEFT JOIN e.participantes p " +
                            "WHERE e.creador.id = :idUsuario " +
                            "GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaInicio, e.fechaFin, " +
                            "e.localidad, e.provincia.nombre, e.creador.username, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre, " +
                            "e.modo, e.estado, e.numParticipantes",
                    Object[].class
            );

            query.setParameter("idUsuario", idUsuario);

            resultados = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return resultados;
    }

    @Override
    public List<Object[]> getEventosResumenPorUsuarioParticipados(int idUsuario) {
        List<Object[]> resultados = null;
        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaInicio, e.fechaFin, " +
                            "e.localidad, e.provincia.nombre, e.creador.username, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre, " +
                            "e.modo, e.estado, COUNT(p), e.numParticipantes " +
                            "FROM Evento e LEFT JOIN e.participantes p " +
                            "WHERE :idUsuario IN (SELECT u.idUsuario FROM e.participantes u) " +
                            "GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaInicio, e.fechaFin, " +
                            "e.localidad, e.provincia.nombre, e.creador.username, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.nombre, " +
                            "e.modo, e.estado, e.numParticipantes",
                    Object[].class
            );

            query.setParameter("idUsuario", idUsuario);

            resultados = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return resultados;
    }

    public List<Object[]> buscarEventosPorTextoYCategoria(String texto, int idCategoria, int idUsuario) {
        List<Object[]> eventos = new ArrayList<>();

        try {
            startTransaction();

            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            Date hoy = calendar.getTime();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia.nombre, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, " +
                            "e.subcategoria.nombre, e.creador.username, COUNT(p), e.estado, e.creador.idUsuario " +
                            "FROM Evento e " +
                            "LEFT JOIN e.participantes p " +
                            "WHERE (LOWER(e.titulo) LIKE :filtro OR LOWER(e.descripcion) LIKE :filtro) " +
                            "AND e.subcategoria.categoria.idCategoria = :idCategoria " +
                            "AND (e.estado = 'Por_Empezar' OR e.estado = 'En_Curso') " +
                            "AND e.fechaInicio >= :hoy " +
                            "GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia.nombre, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, " +
                            "e.subcategoria.nombre, e.creador.username, e.creador.idUsuario " +
                            "ORDER BY e.fechaInicio DESC", Object[].class
            );

            query.setParameter("filtro", "%" + texto.toLowerCase() + "%");
            query.setParameter("hoy", hoy);
            query.setParameter("idCategoria", idCategoria);

            List<Object[]> resultados = query.getResultList();

            for (Object[] row : resultados) {
                Integer idEvento = (Integer) row[0];
                Integer idCreador = (Integer) row[16];

                String rol;
                if (idUsuario == idCreador) {
                    rol = "creador";
                } else {
                    Query<Long> subquery = sesion.createQuery(
                            "SELECT COUNT(u) FROM Evento e JOIN e.participantes u " +
                                    "WHERE e.idEvento = :idEvento AND u.idUsuario = :idUsuario", Long.class
                    );
                    subquery.setParameter("idEvento", idEvento);
                    subquery.setParameter("idUsuario", idUsuario);
                    Long count = subquery.uniqueResult();
                    rol = (count != null && count > 0) ? "participante" : "libre";
                }

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

    @Override
    public List<Object[]> buscarEventosPublicosPorTextoYCategoria(String texto, int idCategoria) {
        List<Object[]> eventos = new ArrayList<>();
        try {
            startTransaction();

            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            Date hoy = calendar.getTime();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia.nombre, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, " +
                            "e.subcategoria.nombre, e.creador.username, COUNT(p), e.estado " +
                            "FROM Evento e " +
                            "LEFT JOIN e.participantes p " +
                            "WHERE (LOWER(e.titulo) LIKE :filtro OR LOWER(e.descripcion) LIKE :filtro) " +
                            "AND (e.estado = 'Por_Empezar' OR e.estado = 'En_Curso') " +
                            "AND e.fechaInicio >= :hoy " +
                            "AND e.subcategoria.categoria.idCategoria = :idCategoria " +
                            "GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia.nombre, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, " +
                            "e.subcategoria.nombre, e.creador.username, e.estado " +
                            "ORDER BY e.fechaInicio DESC",
                    Object[].class
            );

            query.setParameter("filtro", "%" + texto.toLowerCase() + "%");
            query.setParameter("hoy", hoy);
            query.setParameter("idCategoria", idCategoria);

            eventos = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }

        return eventos;
    }

    public List<Object[]> filtrarEventosPublicos(int idCategoria, Integer idSubcategoria, String provincia) {
        List<Object[]> eventos = new ArrayList<>();
        try {
            startTransaction();

            StringBuilder hql = new StringBuilder(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia.nombre, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, " +
                            "e.subcategoria.nombre, e.creador.username, COUNT(p), e.estado " +
                            "FROM Evento e LEFT JOIN e.participantes p " +
                            "WHERE e.subcategoria.categoria.idCategoria = :idCategoria " +
                            "AND (e.estado = 'Por_Empezar' OR e.estado = 'En_Curso') " +
                            "AND e.fechaInicio >= CURRENT_DATE ");

            if (idSubcategoria != null) {
                hql.append("AND e.subcategoria.idSubcategoria = :idSubcategoria ");
            }
            if (provincia != null && !provincia.trim().isEmpty()) {
                hql.append("AND LOWER(e.provincia.nombre) = :provincia ");
            }

            hql.append("GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                    "e.numParticipantes, e.direccion, e.localidad, e.provincia.nombre, " +
                    "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, " +
                    "e.subcategoria.nombre, e.creador.username, e.estado " +
                    "ORDER BY e.fechaInicio DESC");

            Query<Object[]> query = sesion.createQuery(hql.toString(), Object[].class);
            query.setParameter("idCategoria", idCategoria);

            if (idSubcategoria != null) {
                query.setParameter("idSubcategoria", idSubcategoria);
            }
            if (provincia != null && !provincia.trim().isEmpty()) {
                query.setParameter("provincia", provincia.trim().toLowerCase());
            }

            eventos = query.getResultList();
            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }

        return eventos;
    }

    @Override
    public List<Object[]> filtrarEventosPorSubcategoriaYProvinciaLogueado(int idCategoria, Integer idSubcategoria, Integer idProvincia, int idUsuario) {
        List<Object[]> eventos = new ArrayList<>();
        try {
            startTransaction();

            StringBuilder hql = new StringBuilder(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                            "e.numParticipantes, e.direccion, e.localidad, e.provincia.nombre, " +
                            "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, " +
                            "e.subcategoria.nombre, e.creador.username, COUNT(p), e.estado, e.creador.idUsuario " +
                            "FROM Evento e LEFT JOIN e.participantes p " +
                            "WHERE e.subcategoria.categoria.idCategoria = :idCategoria " +
                            "AND (e.estado = 'Por_Empezar' OR e.estado = 'En_Curso') " +
                            "AND e.fechaInicio >= CURRENT_DATE ");

            if (idSubcategoria != null) {
                hql.append("AND e.subcategoria.idSubcategoria = :idSubcategoria ");
            }
            if (idProvincia != null) {
                hql.append("AND e.provincia.idProvincia = :idProvincia ");
            }

            hql.append("GROUP BY e.idEvento, e.titulo, e.descripcion, e.fechaCreacion, e.fechaInicio, e.fechaFin, " +
                    "e.numParticipantes, e.direccion, e.localidad, e.provincia.nombre, " +
                    "e.subcategoria.categoria.nombre, e.subcategoria.categoria.imagen, " +
                    "e.subcategoria.nombre, e.creador.username, e.creador.idUsuario, e.estado " +
                    "ORDER BY e.fechaInicio DESC");

            Query<Object[]> query = sesion.createQuery(hql.toString(), Object[].class);
            query.setParameter("idCategoria", idCategoria);

            if (idSubcategoria != null) {
                query.setParameter("idSubcategoria", idSubcategoria);
            }
            if (idProvincia != null) {
                query.setParameter("idProvincia", idProvincia);
            }

            List<Object[]> resultados = query.getResultList();

            for (Object[] row : resultados) {
                Integer idEvento = (Integer) row[0];
                Integer idCreador = (Integer) row[16];

                String rol;
                if (idUsuario == idCreador) {
                    rol = "creador";
                } else {
                    Query<Long> subquery = sesion.createQuery(
                            "SELECT COUNT(u) FROM Evento e JOIN e.participantes u " +
                                    "WHERE e.idEvento = :idEvento AND u.idUsuario = :idUsuario", Long.class
                    );
                    subquery.setParameter("idEvento", idEvento);
                    subquery.setParameter("idUsuario", idUsuario);
                    Long count = subquery.uniqueResult();
                    rol = (count != null && count > 0) ? "participante" : "libre";
                }

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