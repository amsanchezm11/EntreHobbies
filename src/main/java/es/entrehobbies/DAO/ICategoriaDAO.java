package es.entrehobbies.DAO;

import java.util.List;

public interface ICategoriaDAO {

    public List<Object[]> getAllCategoriasOrdenadas();

    public List<Object[]> getAllCategoriasOrdenadasConImg();
}
