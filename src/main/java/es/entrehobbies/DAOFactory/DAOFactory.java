package es.entrehobbies.DAOFactory;

import es.entrehobbies.DAO.*;

public abstract class DAOFactory {

    /**
     * Una clase abstracta por cada tabla de la base de datos
     *
     * @return Inteface de las operaciones a realizar con la tabla
     */
    public abstract IUsuarioDAO getUsuarioDAO();

    public abstract IGenericoDAO getGenericoDAO();

    public abstract IEventoDAO getEventoDAO();

    public abstract ICategoriaDAO getCategoriaDAO();

    public abstract ISubcategoriaDAO getSubcategoriaDAO();

    public abstract IProvinciaDAO getProvinciaDAO();

    /**
     * Fábrica abstracta
     *
     * @return Objeto de la fábrica abstracta
     */
    public static DAOFactory getDAOFactory() {

        DAOFactory daof = null;

        daof = new MySQLDAOFactory();

        return daof;
    }

}
