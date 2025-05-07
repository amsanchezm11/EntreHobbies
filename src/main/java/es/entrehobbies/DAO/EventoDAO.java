package es.entrehobbies.DAO;

import es.entrehobbies.beans.Evento;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import java.util.List;

public class EventoDAO extends GenericoDAO<Evento> implements IEventoDAO{
    @Override
    public List<Object[]> getAllEventosPorCategoriaOrdenados(int idCategoria) {
        List<Object[]> eventos = null;
        try {
            startTransaction();

            // Consulta HQL para obtener los datos del evento por categoría, ordenados por fecha de creación descendente
            Query<Object[]> query = sesion.createQuery(
                    "SELECT e.idEvento, e.titulo, e.descripcion, e.fechaInicio, e.fechaFin, e.numParticipantes " +
                            "FROM Evento e " +
                            "WHERE e.subcategoria.categoria.idCategoria = :idCategoria " +
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

}
