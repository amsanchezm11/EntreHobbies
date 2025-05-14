package es.entrehobbies.DAO;

import es.entrehobbies.beans.Categoria;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import java.util.List;

public class CategoriaDAO extends GenericoDAO<Categoria>  implements ICategoriaDAO{
    @Override
    public List<Object[]> getAllCategoriasOrdenadas() {
        List<Object[]> categorias = null;
        try {
            startTransaction();

            // Consulta para obtener solo los id y nombre de cada categoría
            Query<Object[]> query = sesion.createQuery(
                    "SELECT c.idCategoria, c.nombre FROM Categoria c ORDER BY c.nombre", Object[].class);

            categorias = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return categorias;
    }

    @Override
    public List<Object[]> getAllCategoriasOrdenadasConImg() {
        List<Object[]> categorias = null;
        try {
            startTransaction();

            // Consulta para obtener solo los id y nombre de cada categoría
            Query<Object[]> query = sesion.createQuery(
                    "SELECT c.idCategoria, c.nombre, c.imagen FROM Categoria c ORDER BY c.nombre", Object[].class);

            categorias = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return categorias;
    }

    @Override
    public String getNombreCategoriaPorId(int idCategoria) {
        String nombre = null;
        try {
            startTransaction();

            Query<String> query = sesion.createQuery(
                    "SELECT c.nombre FROM Categoria c WHERE c.idCategoria = :idCategoria", String.class);
            query.setParameter("idCategoria", idCategoria);

            nombre = query.uniqueResult();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return nombre;
    }

}
