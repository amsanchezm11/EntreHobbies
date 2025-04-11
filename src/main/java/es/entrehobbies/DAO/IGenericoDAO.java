package es.entrehobbies.DAO;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author alberto
 */
public interface IGenericoDAO<T> {
   
    public void insertOrUpdate(T objeto);

    public <T> List<T> selectAll(Class<T> claseEntidad);

    public <T> T getById(Serializable pk, Class<T> claseEntidad);

    public void delete(T objeto);
        
}
