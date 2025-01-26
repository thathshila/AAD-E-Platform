package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.eplatform.dto.ProductDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "SearchProductServlet", value = "/search-product")
public class SearchProductServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("update".equalsIgnoreCase(action)) {
            updateProduct(req, resp);
        } else if ("delete".equalsIgnoreCase(action)) {
            deleteProduct(req, resp);
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Invalid action");
        }
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String productIdStr = req.getParameter("product_id");
        String productName = req.getParameter("product_name");
        String productDescription = req.getParameter("product_description");
        String categoryIdStr = req.getParameter("category_id");
        String imagePath = req.getParameter("product_img");
        String productPriceStr = req.getParameter("product_price");
        String productQtyStr = req.getParameter("product_qty");

        try {
            int productId = Integer.parseInt(productIdStr);
            int categoryId = Integer.parseInt(categoryIdStr);
            double productPrice = Double.parseDouble(productPriceStr);
            int productQty = Integer.parseInt(productQtyStr);

            Connection connection = dataSource.getConnection();
            String query = "UPDATE products SET product_name=?, product_description=?, product_price=?, product_quantity=?, category_id=?, image_path=? WHERE product_id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, productName);
            preparedStatement.setString(2, productDescription);
            preparedStatement.setDouble(3, productPrice);
            preparedStatement.setInt(4, productQty);
            preparedStatement.setInt(5, categoryId);
            preparedStatement.setString(6, imagePath);
            preparedStatement.setInt(7, productId);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                resp.sendRedirect("update-product.jsp?message=Product updated successfully");
            } else {
                resp.sendRedirect("update-product.jsp?error=Product not updated");
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("update-product.jsp?error=An error occurred while updating the product");
        }
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String productIdStr = req.getParameter("product_id");

        try {
            int productId = Integer.parseInt(productIdStr);

            Connection connection = dataSource.getConnection();
            String query = "DELETE FROM products WHERE product_id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productId);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                resp.sendRedirect("update-product.jsp?message=Product deleted successfully");
            } else {
                resp.sendRedirect("update-product.jsp?error=Product not deleted");
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("update-product.jsp?error=An error occurred while deleting the product");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("product_name");

        if (productName == null || productName.trim().isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Product name is required");
            return;
        }

        try {
            ProductDTO productDTO = getProductByName(productName);

            if (productDTO != null) {
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                PrintWriter out = resp.getWriter();
                out.print("{");
                out.print("\"productId\":\"" + productDTO.getProduct_id() + "\",");
                out.print("\"productName\":\"" + productDTO.getProductName() + "\",");
                out.print("\"productDescription\":\"" + productDTO.getProductDescription() + "\",");
                out.print("\"productPrice\":\"" + productDTO.getProductPrice() + "\",");
                out.print("\"productQuantity\":\"" + productDTO.getProductQuantity() + "\",");
                out.print("\"categoryId\":\"" + productDTO.getCategory_id() + "\",");
                out.print("\"imagePath\":\"" + productDTO.getImage_path() + "\"");
                out.print("}");
                out.flush();
            } else {
                resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                resp.getWriter().write("Product not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("An error occurred while searching for the product");
        }
    }

    private ProductDTO getProductByName(String productName) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            connection = dataSource.getConnection();

            String query = "SELECT * FROM products WHERE product_name = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, productName);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                return new ProductDTO(
                        resultSet.getInt("product_id"),
                        resultSet.getString("product_name"),
                        resultSet.getString("product_description"),
                        resultSet.getDouble("product_price"),
                        resultSet.getInt("product_quantity"),
                        resultSet.getInt("category_id"),
                        resultSet.getString("image_path")
                );
            }
        } finally {

            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        }
        return null;
    }
}
