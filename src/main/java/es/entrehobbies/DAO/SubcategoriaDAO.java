package es.entrehobbies.DAO;

import es.entrehobbies.beans.Subcategoria;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import java.util.List;

public class SubcategoriaDAO extends GenericoDAO<Subcategoria>  implements ISubcategoriaDAO{


    @Override
    public List<Object[]> getAllSubcategoriasOrdenadas(int idCategoria) {
        List<Object[]> subcategorias = null;
        try {
            startTransaction();

            // Consulta para obtener id y nombre de las subcategorías filtradas por idCategoria
            Query<Object[]> query = sesion.createQuery(
                    "SELECT s.idSubcategoria, s.nombre FROM Subcategoria s WHERE s.categoria.idCategoria = :idCategoria ORDER BY s.nombre",
                    Object[].class
            );
            query.setParameter("idCategoria", idCategoria);

            subcategorias = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return subcategorias;
    }

}
