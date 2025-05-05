package es.entrehobbies.DAO;

import java.util.List;

public interface ISubcategoriaDAO {

    public abstract List<Object[]> getAllSubcategoriasOrdenadas(int idCategoria);
}
