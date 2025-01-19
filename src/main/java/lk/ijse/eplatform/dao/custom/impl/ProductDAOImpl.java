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
    public void save(Product product) throws Exception {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO products (product_id, product_name, product_description, product_price, product_quantity, category_id) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pst = connection.prepareStatement(sql)) {
                pst.setInt(1, product.getId());
                pst.setString(2, product.getName());
                pst.setString(3, product.getDescription());
                pst.setDouble(4, product.getPrice());
                pst.setInt(5, product.getQuantity());
                pst.setInt(6, product.getCategoryId());
                pst.executeUpdate();
            }
        }
    }

    @Override
    public void delete(int productId) throws SQLException {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "DELETE FROM products WHERE product_id = ?";
            try (PreparedStatement pst = connection.prepareStatement(sql)) {
                pst.setInt(1, productId);
                pst.executeUpdate();
            }
        }
    }

    @Override
    public void update(Product product) throws SQLException {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "UPDATE products SET product_name = ?, product_description = ?, product_price = ?, product_quantity = ?, category_id = ? WHERE product_id = ?";
            try (PreparedStatement pst = connection.prepareStatement(sql)) {
                pst.setString(1, product.getName());
                pst.setString(2, product.getDescription());
                pst.setDouble(3, product.getPrice());
                pst.setInt(4, product.getQuantity());
                pst.setInt(5, product.getCategoryId());
                pst.setInt(6, product.getId());
                pst.executeUpdate();
            }
        }
    }

}
