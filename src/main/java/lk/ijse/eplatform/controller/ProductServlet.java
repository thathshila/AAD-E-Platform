package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.eplatform.bo.BoFactory;
import lk.ijse.eplatform.bo.custom.ProductBO;
import lk.ijse.eplatform.dto.CategoryDTO;
import lk.ijse.eplatform.dto.ProductDTO;

import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("save".equalsIgnoreCase(action)) {
            String name = req.getParameter("product_name");
            String description = req.getParameter("product_description");
            double price = Double.parseDouble(req.getParameter("product_price"));
            int quantity = Integer.parseInt(req.getParameter("product_quantity"));
            int categoryId = Integer.parseInt(req.getParameter("category_id"));
            System.out.println("name: " + name);
            System.out.println("description: " + description);
            System.out.println("price: " + price);
            System.out.println("quantity: " + quantity);
            System.out.println("categoryId: " + categoryId);

            // Handle file upload
            Part imagePart = req.getPart("image_path");
            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            String imagePath = "uploads/" + fileName;
            File uploadsDir = new File(getServletContext().getRealPath("/uploads"));
            if (!uploadsDir.exists()) {
                uploadsDir.mkdirs();
            }
            File imageFile = new File(uploadsDir, fileName);
            try (InputStream input = imagePart.getInputStream()) {
                Files.copy(input, imageFile.toPath());
            }

            ProductDTO product = new ProductDTO(1, name, description, price, quantity, categoryId, imagePath);

            // Pass the DataSource to BoFactory
            ProductBO productBO = (ProductBO) BoFactory.getBoFactory(dataSource).getBoType(BoFactory.BoType.PRODUCT);

            // Call the saveProduct method
            productBO.saveProduct(product, dataSource);

            resp.sendRedirect("admin.jsp");
        }
    }
}
