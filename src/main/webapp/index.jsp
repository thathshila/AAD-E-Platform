<%@ page import="lk.ijse.eplatform.dto.ProductDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/20/2025
  Time: 6:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Shop</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
        }

        .navbar-brand {
            font-size: 1.75rem;
            font-weight: bold;
            color: #f0c14b !important;
        }

        .navbar-nav .nav-link {
            color: #fff !important;
        }

        /* Hero Carousel Customization */
        .hero-carousel {
            height: 100vh;
        }

        .hero-carousel img {
            object-fit: cover;
            height: 100%;
        }

        .carousel-caption {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        .carousel-caption .search-container {
            margin-bottom: 20px;
        }

        .carousel-caption input {
            max-width: 400px;
        }

        .carousel-caption .btn-warning {
            padding: 10px 20px;
            font-size: 1.1rem;
        }

        .footer {
            background-color: #343a40;
            color: white;
            padding: 30px 0;
        }

        .footer a {
            color: #f0c14b;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container">
        <a class="navbar-brand" href="#">E-Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="new-product-list">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="signin.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin-login.jsp">Admin</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="add-cart.jsp">Cart <span class="badge bg-primary">0</span></a>
                </li>
                <li>
                    <a href="logout.jsp" class="btn btn-danger">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Carousel -->
<div id="heroCarousel" class="carousel slide hero-carousel" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="uploads/books.avif" class="d-block w-100 h-100" alt="Slide 1">
            <div class="carousel-caption d-md-block">
                <div class="search-container">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for products...">
                        <button class="btn btn-warning">Search</button>
                    </div>
                    <h1 style="color: white; font-size: 50px;">Just in: Holiday Gifts</h1>
                    <p style="font-size: 20px;">Find the perfect gift for your loved ones.</p>
                </div>
                <a href="new-product-list" class="btn btn-warning">Shop Now</a>
            </div>
        </div>
        <div class="carousel-item">
            <img src="uploads/02.jpg" class="d-block w-100 " alt="Slide 2">
            <div class="carousel-caption d-md-block">
                <div class="search-container">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for products...">
                        <button class="btn btn-warning">Search</button>
                    </div>
                    <h1 style="color: white; font-size: 50px;">Just in: Holiday Gifts</h1>
                    <p style="font-size: 20px;">Find the perfect gift for your loved ones.</p>
                </div>
                <a href="new-product-list" class="btn btn-warning">Shop Now</a>
            </div>
        </div>
        <div class="carousel-item">
            <img src="uploads/03.jpg" class="d-block w-100" alt="Slide 3">
            <div class="carousel-caption d-md-block">
                <div class="search-container">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for products...">
                        <button class="btn btn-warning">Search</button>
                    </div>
                    <h1 style="color: white; font-size: 50px;">Just in: Holiday Gifts</h1>
                    <p style="font-size: 20px;">Find the perfect gift for your loved ones.</p>
                </div>
                <a href="new-product-list" class="btn btn-warning">Shop Now</a>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
    </button>
</div>
<%--<!-- Categories Section -->--%>
<div class="container mt-5">
    <h1 class="text-center mb-4">Our Products</h1>

    <%
        // Fetch the product list passed from the servlet
        List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
        if (productList != null && !productList.isEmpty()) {
    %>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
        <%
            for (ProductDTO product : productList) {
        %>
        <div class="col">
            <div class="card h-100">
                <!-- Product Image -->
                <img src="<%= product.getImage_path() %>" class="card-img-top" alt="<%= product.getProductName() %>" style="height: 200px; object-fit: cover;">

                <div class="card-body">
                    <!-- Product Name -->
                    <h5 class="card-title"><%= product.getProductName() %></h5>

                    <!-- Product Description -->
                    <p class="card-text text-muted"><%= product.getProductDescription() %></p>

                    <!-- Product Price -->
                    <p class="fw-bold">Price: $<%= product.getProductPrice() %></p>

                    <!-- Product Quantity -->
                    <p>Available: <%= product.getProductQuantity() %> units</p>

                    <!-- Action Button -->
                    <form action="cart" method="post">
                        <input type="hidden" name="product_id" value="<%= product.getProduct_id() %>">
                        <input type="hidden" name="product_name" value="<%= product.getProductName() %>">
                        <input type="hidden" name="product_price" value="<%= product.getProductPrice() %>">
                        <input type="hidden" name="product_quantity" value="1">
                        <input type="hidden" name="product_image" value="<%= product.getImage_path() %>">
                        <button type="submit" class="btn btn-danger">Add to Cart</button>
                    </form>

                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <% } else { %>
    <div class="alert alert-warning text-center" role="alert">
        No products available at the moment.
    </div>
    <% } %>
</div>
<!-- Footer -->
<footer class="footer">
    <div class="container text-center">
        <p>Follow us on:</p>
        <a href="#"><i class="fab fa-facebook fa-lg me-3"></i></a>
        <a href="#"><i class="fab fa-twitter fa-lg me-3"></i></a>
        <a href="#"><i class="fab fa-instagram fa-lg me-3"></i></a>
        <a href="#"><i class="fab fa-linkedin fa-lg"></i></a>
        <p class="mt-3">© 2025 E-Shop. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>