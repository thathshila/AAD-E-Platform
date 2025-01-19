package lk.ijse.eplatform.controller;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.eplatform.dto.CategoryDTO;
import lk.ijse.eplatform.dto.UserDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user-list")
public class UserServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<UserDTO> userList = new ArrayList<>();

        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT user_id, user_name, email, phone, address, role , status FROM users";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        UserDTO user = new UserDTO(
                                resultSet.getInt("user_id"),
                                resultSet.getString("user_name"),
                                null, // Password is not needed for display
                                resultSet.getString("email"),
                                resultSet.getString("phone"),
                                resultSet.getString("address"),
                                resultSet.getString("role"),
                                resultSet.getString("status")
                        );
                        userList.add(user);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Unable to load user data.");
        }


        req.setAttribute("userList", userList);
        req.getRequestDispatcher("user-list.jsp").forward(req, resp);
    }
}
