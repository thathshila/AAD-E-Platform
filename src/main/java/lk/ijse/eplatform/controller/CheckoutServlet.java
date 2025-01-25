package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.eplatform.dto.CartItemDTO;
import lk.ijse.eplatform.dto.UserDTO;
import lk.ijse.eplatform.entity.CartItem;

import javax.sql.DataSource;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;
import java.util.List;


@WebServlet(name = "CheckoutServlet", value = "/checkout")
public class CheckoutServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HttpSession session = req.getSession();
//        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
//        UserDTO user = (UserDTO) session.getAttribute("user");
//
//        if (cart == null || cart.isEmpty() || user == null) {
//            resp.sendRedirect("add-cart.jsp");
//            return;
//        }
//
//        try (Connection connection = dataSource.getConnection()) {
//            connection.setAutoCommit(false);
//
//            // Insert order into the `order` table
//            String orderSql = "INSERT INTO orders (user_id, total_amount) VALUES (?, ?)";
//            try (PreparedStatement orderStmt = connection.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
//                double totalAmount = cart.stream().mapToDouble(CartItemDTO::getSubtotal).sum();
//                orderStmt.setInt(1, user.getUserId());
//                orderStmt.setDouble(2, totalAmount);
//                orderStmt.executeUpdate();
//
//                ResultSet generatedKeys = orderStmt.getGeneratedKeys();
//                if (!generatedKeys.next()) throw new SQLException("Failed to retrieve order ID.");
//                int orderId = generatedKeys.getInt(1);
//
//                // Insert order details into `order_detail` table
//                String orderDetailSql = "INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
//                try (PreparedStatement detailStmt = connection.prepareStatement(orderDetailSql)) {
//                    for (CartItemDTO item : cart) {
//                        detailStmt.setInt(1, orderId);
//                        detailStmt.setInt(2, item.getProductId());
//                        detailStmt.setInt(3, item.getQuantity());
//                        detailStmt.setDouble(4, item.getProductPrice());
//                        detailStmt.addBatch();
//                    }
//                    detailStmt.executeBatch();
//                }
//
//                // Clear cart and commit transaction
//                session.removeAttribute("cart");
//                connection.commit();
//                resp.sendRedirect("order-confirmation.jsp");
//            } catch (Exception e) {
//                connection.rollback();
//                throw e;
//            }
//        } catch (Exception e) {
//            throw new ServletException("Error processing checkout", e);
//        }
//    }
//}
//
// Get userId from session
        HttpSession session = req.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect("signin.jsp");
            return;
        }

        int userId = user.getUserId();  // assuming UserDTO has getUserId() method

// Assuming you have a Cart class or CartItems list that you retrieved earlier from the session
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems"); // Retrieve cart items

        if (cartItems == null || cartItems.isEmpty()) {
            resp.sendRedirect("cart-empty.jsp");
            return;
        }

        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false);  // Start transaction

            // Insert the order into the orders table
            String orderQuery = "INSERT INTO orders (user_id, order_date) VALUES (?, ?)";
            try (PreparedStatement stmtOrder = connection.prepareStatement(orderQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
                stmtOrder.setInt(1, userId);
                stmtOrder.setTimestamp(2, new java.sql.Timestamp(System.currentTimeMillis()));
                stmtOrder.executeUpdate();

                // Get generated orderId from the orders table
                ResultSet rs = stmtOrder.getGeneratedKeys();
                int orderId = 0;
                if (rs.next()) {
                    orderId = rs.getInt(1);  // Get the generated orderId
                }

                // Insert order details into the order_details table
                String orderDetailsQuery = "INSERT INTO order_details (order_id, product_name, quantity, price) VALUES (?, ?, ?, ?)";
                try (PreparedStatement stmtOrderDetails = connection.prepareStatement(orderDetailsQuery)) {
                    for (CartItem cartItem : cartItems) {  // Loop through the cart items
                        stmtOrderDetails.setInt(1, orderId);  // Set the orderId
                        stmtOrderDetails.setInt(2, Integer.parseInt(cartItem.getProduct().getName()));  // Assuming CartItem has getProductId method
                        stmtOrderDetails.setInt(3, cartItem.getQuantity());  // Assuming CartItem has getQuantity method
                        stmtOrderDetails.setBigDecimal(4, BigDecimal.valueOf(cartItem.getProduct().getPrice()));  // Assuming CartItem has getPrice method
                        stmtOrderDetails.executeUpdate();
                    }
                }

                // Commit transaction
                connection.commit();

                // Optionally, clear the cart after the order is placed
                session.removeAttribute("cartItems");

                // Redirect to order confirmation page
                resp.sendRedirect("order-confirmation.jsp");

            } catch (SQLException e) {
                // If any SQL exception occurs, rollback the transaction
                connection.rollback();
                e.printStackTrace();
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to process your order.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database connection error.");
        }
    }
}