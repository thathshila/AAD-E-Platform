package lk.ijse.eplatform.bo.custom;

import lk.ijse.eplatform.bo.SuperBO;
import lk.ijse.eplatform.dto.ProductDTO;

import javax.sql.DataSource;
import java.sql.SQLException;

public interface ProductBO extends SuperBO {

    void saveProduct(ProductDTO productDTO, DataSource dataSource) throws Exception;

   void updateProduct(ProductDTO productDTO, DataSource dataSource) throws SQLException;

   void deleteProduct(int id, DataSource dataSource) throws SQLException;
}

