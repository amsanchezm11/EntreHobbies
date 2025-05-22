package es.entrehobbies.DAOFactory;

import es.entrehobbies.DAO.*;

/**
 * Fábrica concreta para la fuente de datos MySQL
 * @author alberto
 */
public class MySQLDAOFactory extends DAOFactory{



    @Override
    public IUsuarioDAO getUsuarioDAO() {
        return new UsuarioDAO();
    }

    @Override
    public IGenericoDAO getGenericoDAO() {
        return new GenericoDAO();
    }

    @Override
    public IEventoDAO getEventoDAO() {
        return new EventoDAO();
    }

    @Override
    public ICategoriaDAO getCategoriaDAO() {
        return new CategoriaDAO();
    }

    @Override
    public ISubcategoriaDAO getSubcategoriaDAO() {
        return new SubcategoriaDAO();
    }

    @Override
    public IProvinciaDAO getProvinciaDAO() {
        return new ProvinciaDAO();
    }
}
