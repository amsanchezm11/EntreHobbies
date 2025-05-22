package es.entrehobbies.DAO;

import es.entrehobbies.beans.Categoria;
import es.entrehobbies.beans.Subcategoria;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public List<Map<String, Object>> getAllCategoriasResumen() {
        List<Map<String, Object>> resultado = new ArrayList<>();

        try {
            startTransaction();

            Query<Categoria> query = sesion.createQuery(
                    "SELECT DISTINCT c FROM Categoria c LEFT JOIN FETCH c.subcategorias ORDER BY c.idCategoria",
                    Categoria.class);

            List<Categoria> categorias = query.getResultList();

            for (Categoria c : categorias) {
                Map<String, Object> map = new HashMap<>();
                map.put("idCategoria", c.getIdCategoria());
                map.put("nombre", c.getNombre());
                map.put("imagen", c.getImagen());

                List<Map<String, Object>> subcategorias = new ArrayList<>();
                if (c.getSubcategorias() != null) {
                    for (Subcategoria s : c.getSubcategorias()) {
                        Map<String, Object> subMap = new HashMap<>();
                        subMap.put("idSubcategoria", s.getIdSubcategoria());
                        subMap.put("nombre", s.getNombre());
                        subcategorias.add(subMap);
                    }
                }

                map.put("numSubcategorias", subcategorias.size());
                map.put("subcategorias", subcategorias);

                resultado.add(map);
            }

            endTransaction();

        } catch (HibernateException he) {
            handleExcepcion(he);
        }

        return resultado;
    }


}
