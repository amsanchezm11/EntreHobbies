package es.entrehobbies.DAO;

import java.util.List;

public interface IEventoDAO {

    public List<Object[]> getAllEventosPorCategoriaOrdenados(int idCategoria);
}
