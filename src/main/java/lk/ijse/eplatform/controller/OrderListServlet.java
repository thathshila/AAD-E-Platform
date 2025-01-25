
package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.eplatform.dto.OrderDTO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderListServlet", value = "/order-list")
public class OrderListServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // List to store all orders
        List<OrderDTO> orderList = new ArrayList<>();

        // Query to fetch all orders
        String query = "SELECT order_id, user_id, total_price, date FROM orders";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement pst = connection.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {

            // Iterate through the result set and populate the order list
            while (rs.next()) {
                OrderDTO order = new OrderDTO();
                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setTotalPrice(rs.getDouble("total_price"));
                order.setDate(rs.getTimestamp("date"));

                orderList.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(javax.servlet.http.HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to fetch orders.");
            return;
        }

        // Set the order list as a request attribute
        req.setAttribute("orderList", orderList);

        // Forward to JSP page for rendering
        req.getRequestDispatcher("/order-list.jsp").forward(req, resp);
    }
}
