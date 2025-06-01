package es.entrehobbies.DAO;

import java.util.List;

public interface ISubcategoriaDAO {

    public List<Object[]> getAllSubcategoriasOrdenadas(int idCategoria);
}
