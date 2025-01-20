package lk.ijse.eplatform.dao.custom;

import lk.ijse.eplatform.dao.CrudDao;
import lk.ijse.eplatform.entity.Product;

import java.sql.Connection;

public interface ProductDAO extends CrudDao<Product> {

    boolean save(Product product, Connection connection);
}

