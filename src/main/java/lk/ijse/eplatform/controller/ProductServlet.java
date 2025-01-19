//package lk.ijse.eplatform.controller;
//
//import jakarta.annotation.Resource;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import lk.ijse.eplatform.bo.custom.ProductBO;
//import lk.ijse.eplatform.dto.ProductDTO;
//
//import lk.ijse.eplatform.bo.BoFactory;
//import javax.sql.DataSource;
//import java.io.IOException;
//import java.sql.Connection;
//
//@WebServlet(name = "ProductServlet",value = "/product-servlet")
//public class ProductServlet extends HttpServlet {
//    @Resource(name = "java:comp/env/jdbc/pool")
//    private DataSource dataSource;
//    ProductBO productBO = (ProductBO) BoFactory.getBoFactory().getBoType(BoFactory.BoType.PRODUCT);
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String action = req.getParameter("action");
//
//        try {
//            Connection conn = dataSource.getConnection();
//            if ("save".equalsIgnoreCase(action)) {
//                String name = req.getParameter("productName");
//                String description = req.getParameter("productDescription");
//                double price = Double.parseDouble(req.getParameter("productPrice"));
//                int quantity = Integer.parseInt(req.getParameter("productQuantity"));
//
//                ProductDTO productDTO = new ProductDTO(name, description, price, quantity);
//                productBO.saveProduct(productDTO);
//
//                resp.sendRedirect("success.jsp");
//            } else if ("update".equalsIgnoreCase(action)) {
//                int id = Integer.parseInt(req.getParameter("productId"));
//                String name = req.getParameter("productName");
//                String description = req.getParameter("productDescription");
//                double price = Double.parseDouble(req.getParameter("productPrice"));
//                int quantity = Integer.parseInt(req.getParameter("productQuantity"));
//
//                ProductDTO productDTO = new ProductDTO(id, name, description, price, quantity);
//                productBO.updateProduct(productDTO);
//
//                resp.sendRedirect("success.jsp");
//            } else if ("delete".equalsIgnoreCase(action)) {
//                int id = Integer.parseInt(req.getParameter("productId"));
//                productBO.deleteProduct(id);
//
//                resp.sendRedirect("success.jsp");
//            }
//        } catch (Exception e) {
//            throw new ServletException("Error processing product action", e);
//        }
//    }
//    }
//
package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.eplatform.bo.custom.ProductBO;
import lk.ijse.eplatform.dto.ProductDTO;
import lk.ijse.eplatform.bo.BoFactory;

import javax.sql.DataSource;
import java.io.IOException;

@WebServlet(name = "ProductServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        System.out.println("action: " + action);
        try {
            // Obtain ProductBO instance
            ProductBO productBO = (ProductBO) BoFactory.getBoFactory().getBoType(BoFactory.BoType.PRODUCT, dataSource);

            if ("save".equalsIgnoreCase(action)) {
                System.out.println("done");
               // int productId = Integer.parseInt(req.getParameter("product_id"));
                String name = req.getParameter("product_name");
                String description = req.getParameter("product_description");
                double price = Double.parseDouble(req.getParameter("product_price"));
                int quantity = Integer.parseInt(req.getParameter("product_quantity"));
                int category_id = Integer.parseInt(req.getParameter("category_id"));

                ProductDTO productDTO = new ProductDTO(null,name, description, price, quantity,category_id);
                System.out.println("productDTO: " + productDTO);
                productBO.saveProduct(productDTO, dataSource); // Pass DataSource

                resp.sendRedirect("product-list.jsp");
            } else if ("update".equalsIgnoreCase(action)) {
             //   int id = Integer.parseInt(req.getParameter("productId"));
                String name = req.getParameter("productName");
                String description = req.getParameter("productDescription");
                double price = Double.parseDouble(req.getParameter("productPrice"));
                int quantity = Integer.parseInt(req.getParameter("productQuantity"));
                int category_id = Integer.parseInt(req.getParameter("productCategoryId"));

                ProductDTO productDTO = new ProductDTO( null,name, description, price, quantity,category_id);
                productBO.updateProduct(productDTO, dataSource); // Pass DataSource

                resp.sendRedirect("success.jsp");
            } else if ("delete".equalsIgnoreCase(action)) {
                int id = Integer.parseInt(req.getParameter("productId"));
                productBO.deleteProduct(id, dataSource); // Pass DataSource

                resp.sendRedirect("success.jsp");
            }
        } catch (Exception e) {
            throw new ServletException("Error processing product action", e);
        }
    }
}

