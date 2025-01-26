package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
import lk.ijse.eplatform.dto.UserDTO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "UserSearchServlet", value = "/user-search")
public class UserSearchServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String userName = req.getParameter("user_name");

        if (userName == null || userName.trim().isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("User name is required");
            return;
        }

        try {
            UserDTO userDTO = getUserByName(userName);

            if (userDTO != null) {
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                PrintWriter out = resp.getWriter();
                out.print("{");
                out.print("\"userId\":\"" + userDTO.getUserId() + "\",");
                out.print("\"userName\":\"" + userDTO.getUserName() + "\",");
                out.print("\"email\":\"" + userDTO.getEmail() + "\",");
                out.print("\"phone\":\"" + userDTO.getPhone() + "\",");
                out.print("\"address\":\"" + userDTO.getAddress() + "\",");
                out.print("\"role\":\"" + userDTO.getRole() + "\",");
                out.print("\"status\":\"" + userDTO.getStatus() + "\"");
                out.print("}");
                out.flush();
            } else {
                resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                resp.getWriter().write("User not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("An error occurred while searching for the user");
        }
    }

    private UserDTO getUserByName(String userName) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            connection = dataSource.getConnection();

            String query = "SELECT * FROM users WHERE user_name = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return new UserDTO(
                        resultSet.getInt("user_id"),
                        resultSet.getString("user_name"),
                        null,
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("role"),
                        resultSet.getString("status")
                );
            }
        } finally {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        }
        return null;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String action = req.getParameter("action");
        String userId = req.getParameter("user_id");
        String userName = req.getParameter("user_name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String role = req.getParameter("role");
        String status = req.getParameter("status");

        if (action == null || userId == null || userId.trim().isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Invalid request");
            return;
        }

        try (Connection connection = dataSource.getConnection()) {
            if (action.equalsIgnoreCase("update")) {
                // Update user details
                String updateQuery = "UPDATE users SET user_name = ?, password = ?, email = ?, phone = ?, address = ?, role = ?, status = ? WHERE user_id = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                    preparedStatement.setString(1, userName);
                    preparedStatement.setString(2, password); // Consider encrypting the password before storing
                    preparedStatement.setString(3, email);
                    preparedStatement.setString(4, phone);
                    preparedStatement.setString(5, address);
                    preparedStatement.setString(6, role);
                    preparedStatement.setString(7, status);
                    preparedStatement.setInt(8, Integer.parseInt(userId));

                    int rowsUpdated = preparedStatement.executeUpdate();
                    if (rowsUpdated > 0) {
                        resp.setStatus(HttpServletResponse.SC_OK);
                        resp.getWriter().write("User updated successfully");
                    } else {
                        resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                        resp.getWriter().write("User not found");
                    }
                }
            } else if (action.equalsIgnoreCase("delete")) {
                // Delete user
                String deleteQuery = "DELETE FROM users WHERE user_id = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                    preparedStatement.setInt(1, Integer.parseInt(userId));

                    int rowsDeleted = preparedStatement.executeUpdate();
                    if (rowsDeleted > 0) {
                        resp.setStatus(HttpServletResponse.SC_OK);
                        resp.getWriter().write("User deleted successfully");
                    } else {
                        resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                        resp.getWriter().write("User not found");
                    }
                }
            } else {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resp.getWriter().write("Invalid action");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("An error occurred while processing the request");
        }
    }

}


