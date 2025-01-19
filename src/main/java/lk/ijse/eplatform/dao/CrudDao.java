package lk.ijse.eplatform.dao;

import lk.ijse.eplatform.entity.Product;

import java.sql.Connection;
import java.sql.SQLException;

public interface CrudDao<T> extends SuperDAO{

    void delete(int productId) throws SQLException;

    void update(Product product) throws SQLException;
}
