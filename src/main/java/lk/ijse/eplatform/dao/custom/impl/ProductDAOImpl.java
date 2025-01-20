package lk.ijse.eplatform.dao.custom.impl;

import lk.ijse.eplatform.dao.custom.ProductDAO;
import lk.ijse.eplatform.entity.Product;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductDAOImpl implements ProductDAO {
    private final DataSource dataSource;

    public ProductDAOImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    @Override
    public boolean save(Product product, Connection connection) {
        String sql = "INSERT INTO products (product_name, product_description, product_price, product_quantity, category_id, image_path) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setInt(4, product.getQuantity());
            preparedStatement.setInt(5, product.getCategoryId());
            preparedStatement.setString(6, product.getImage_path());

            return preparedStatement.executeUpdate() > 0; // Return true if a row is inserted
        } catch (SQLException e) {
            throw new RuntimeException("Failed to save the product: " + e.getMessage(), e);
        }
    }
}
