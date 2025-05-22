package es.entrehobbies.DAO;

import es.entrehobbies.beans.Provincia;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import java.util.List;

public class ProvinciaDAO extends GenericoDAO<Provincia> implements IProvinciaDAO{

    @Override
    public List<Object[]> getAllProvinciasOrdenadas() {
        List<Object[]> provincias = null;
        try {
            startTransaction();

            Query<Object[]> query = sesion.createQuery(
                    "SELECT p.idProvincia, p.nombre FROM Provincia p ORDER BY p.nombre",
                    Object[].class
            );

            provincias = query.getResultList();

            endTransaction();
        } catch (HibernateException he) {
            handleExcepcion(he);
        }
        return provincias;
    }

}
