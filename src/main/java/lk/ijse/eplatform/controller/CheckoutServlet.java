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
        HttpSession session = req.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect("signin.jsp");
            return;
        }

        int userId = user.getUserId();
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems"); // Retrieve cart items

        if (cartItems == null || cartItems.isEmpty()) {
            resp.sendRedirect("cart-empty.jsp");
            return;
        }

        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false);

            String orderQuery = "INSERT INTO orders (user_id, order_date) VALUES (?, ?)";
            try (PreparedStatement stmtOrder = connection.prepareStatement(orderQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
                stmtOrder.setInt(1, userId);
                stmtOrder.setTimestamp(2, new java.sql.Timestamp(System.currentTimeMillis()));
                stmtOrder.executeUpdate();


                ResultSet rs = stmtOrder.getGeneratedKeys();
                int orderId = 0;
                if (rs.next()) {
                    orderId = rs.getInt(1);
                }

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


                connection.commit();

                session.removeAttribute("cartItems");

                resp.sendRedirect("order-confirmation.jsp");

            } catch (SQLException e) {
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