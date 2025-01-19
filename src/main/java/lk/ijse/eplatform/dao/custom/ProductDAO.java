package lk.ijse.eplatform.dao.custom;

import lk.ijse.eplatform.dao.CrudDao;
import lk.ijse.eplatform.entity.Product;

public interface ProductDAO extends CrudDao<Product> {
    void save(Product product) throws Exception;
}
