package lk.ijse.eplatform.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import jakarta.annotation.Resource;
import lk.ijse.eplatform.dto.CartItemDTO;

@WebServlet(name = "OrderServlet",value = "/process-order")
public class OrderServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
        int userId = (int) session.getAttribute("user_id"); // Assuming user_id is stored in session after login

        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect("cart.jsp?error=Your cart is empty.");
            return;
        }

        Connection connection = null;
        PreparedStatement orderStmt = null;
        PreparedStatement orderDetailsStmt = null;

        try {
            connection = dataSource.getConnection();
            connection.setAutoCommit(false);

            String insertOrderSQL = "INSERT INTO orders (user_id, total_price, date) VALUES (?, ?, ?)";
            orderStmt = connection.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS);
            double totalPrice = calculateTotalPrice(cart); // Helper method to calculate total price
            orderStmt.setInt(1, userId);
            orderStmt.setBigDecimal(2, BigDecimal.valueOf(totalPrice));
            orderStmt.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            orderStmt.executeUpdate();


            ResultSet generatedKeys = orderStmt.getGeneratedKeys();
            if (!generatedKeys.next()) {
                throw new SQLException("Failed to retrieve order ID.");
            }
            int orderId = generatedKeys.getInt(1);


            String insertOrderDetailsSQL = "INSERT INTO order_details (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            orderDetailsStmt = connection.prepareStatement(insertOrderDetailsSQL);

            for (CartItemDTO item : cart) {
                orderDetailsStmt.setInt(1, orderId);
                orderDetailsStmt.setInt(2, item.getProductId());
                orderDetailsStmt.setInt(3, item.getQuantity());
                orderDetailsStmt.setBigDecimal(4, BigDecimal.valueOf(item.getProductPrice()));
                orderDetailsStmt.addBatch();
            }
            orderDetailsStmt.executeBatch();


            connection.commit();

            session.removeAttribute("cart");

            resp.sendRedirect("order-confirmation.jsp?status=success");

        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            resp.sendRedirect("cart.jsp?error=An error occurred during order processing.");
        } finally {
            try {
                if (orderStmt != null) orderStmt.close();
                if (orderDetailsStmt != null) orderDetailsStmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private double calculateTotalPrice(List<CartItemDTO> cart) {
        double total = 0;
        for (CartItemDTO item : cart) {
            total += item.getProductPrice() * item.getQuantity();
        }
        return total;
    }
}