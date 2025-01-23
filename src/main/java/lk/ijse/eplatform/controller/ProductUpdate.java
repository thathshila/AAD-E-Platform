package lk.ijse.eplatform.controller;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.eplatform.dto.ProductDTO;

import javax.sql.DataSource;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/manageProducts")
public class ProductUpdate extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Connection connection = dataSource.getConnection()) {
            if ("add".equals(action)) {
                addProduct(request, connection);
            } else if ("update".equals(action)) {
                updateProduct(request, connection);
            } else if ("delete".equals(action)) {
                deleteProduct(request, connection);
            }
            response.sendRedirect("manageProducts.jsp");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Connection connection = dataSource.getConnection()) {
            if ("search".equals(action)) {
                searchProducts(request, connection);
            } else {
                listAllProducts(request, connection);
            }
            request.getRequestDispatcher("manageProducts.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void addProduct(HttpServletRequest request, Connection connection) throws SQLException {
        String name = request.getParameter("productName");
        String description = request.getParameter("productDescription");
        double price = Double.parseDouble(request.getParameter("productPrice"));
        int quantity = Integer.parseInt(request.getParameter("productQuantity"));
        int categoryId = Integer.parseInt(request.getParameter("category_id"));

        String sql = "INSERT INTO products (name, description, price, quantity, category_id) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setString(2, description);
            stmt.setDouble(3, price);
            stmt.setInt(4, quantity);
            stmt.setInt(5, categoryId);
            stmt.executeUpdate();
        }
    }

    private void updateProduct(HttpServletRequest request, Connection connection) throws SQLException {
        int id = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("productName");
        String description = request.getParameter("productDescription");
        double price = Double.parseDouble(request.getParameter("productPrice"));
        int quantity = Integer.parseInt(request.getParameter("productQuantity"));
        int categoryId = Integer.parseInt(request.getParameter("category_id"));

        String sql = "UPDATE products SET name = ?, description = ?, price = ?, quantity = ?, category_id = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setString(2, description);
            stmt.setDouble(3, price);
            stmt.setInt(4, quantity);
            stmt.setInt(5, categoryId);
            stmt.setInt(6, id);
            stmt.executeUpdate();
        }
    }

    private void deleteProduct(HttpServletRequest request, Connection connection) throws SQLException {
        int id = Integer.parseInt(request.getParameter("productId"));

        String sql = "DELETE FROM products WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    private void searchProducts(HttpServletRequest request, Connection connection) throws SQLException {
        String query = request.getParameter("query");

        String sql = "SELECT * FROM products WHERE name LIKE ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + query + "%");
            ResultSet rs = stmt.executeQuery();

            List<ProductDTO> products = new ArrayList<>();
            while (rs.next()) {
                products.add(mapRowToProduct(rs));
            }
            request.setAttribute("products", products);
        }
    }

    private void listAllProducts(HttpServletRequest request, Connection connection) throws SQLException {
        String sql = "SELECT * FROM products";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            List<ProductDTO> products = new ArrayList<>();
            while (rs.next()) {
                products.add(mapRowToProduct(rs));
            }
            request.setAttribute("products", products);
        }
    }

    private ProductDTO mapRowToProduct(ResultSet rs) throws SQLException {
        ProductDTO product = new ProductDTO();
        product.setProduct_id(rs.getInt("id"));
        product.setProductName(rs.getString("name"));
        product.setProductDescription(rs.getString("description"));
        product.setProductPrice(rs.getDouble("price"));
        product.setProductQuantity(rs.getInt("quantity"));
        product.setCategory_id(rs.getInt("category_id"));
        return product;
    }
}
