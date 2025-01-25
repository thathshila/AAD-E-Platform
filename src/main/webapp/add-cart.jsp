
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.eplatform.dto.CartItemDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .navbar-brand {
            font-size: 1.75rem;
            font-weight: bold;
            color: #f0c14b !important;
        }

        .navbar-nav .nav-link {
            color: #fff !important;
        }
        .cart-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .cart-item-card {
            border: none;
            margin-bottom: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 10px;
        }

        .cart-item-card img {
            width: 100%;
            height: auto;
            max-height: 120px;
            object-fit: cover;
            border-radius: 5px;
        }

        .cart-summary {
            background-color: #ffffff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .checkout-btn {
            background-color: #28a745;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            display: inline-block;
        }

        .checkout-btn:hover {
            background-color: #218838;
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
<div class="container">
    <div class="cart-container">
        <h1 class="text-center mb-4">Your Shopping Cart</h1>
        <form action="index.jsp" class="mb-4">
            <button type="submit" class="btn btn-secondary">Home</button>
        </form>
        <div class="row">
            <%
                List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
                if (cart != null && !cart.isEmpty()) {
                    for (CartItemDTO item : cart) {
            %>
            <div class="col-md-6 col-lg-4">
                <div class="card cart-item-card">
                    <img src="<%= item.getImage_path() %>" alt="Product Image" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title"><%= item.getProductName() %></h5>
                        <p class="card-text">Price: LKR <%= item.getProductPrice() %></p>
                        <form action="cart" method="post" class="d-flex align-items-center mb-3">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="product_id" value="<%= item.getProductId() %>">
                            <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" class="form-control me-2" style="max-width: 80px;">
                            <button type="submit" class="btn btn-primary btn-sm">Update</button>
                        </form>
                        <p>Subtotal: LKR <%= item.getSubtotal() %></p>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="product_id" value="<%= item.getProductId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <div class="col-12 text-center">
                <p>Your cart is empty.</p>
            </div>
            <%
                }
            %>
        </div>

        <!-- Cart Summary -->
        <div class="cart-summary mt-4">
            <%
                double subtotal = 0;
                if (cart != null) {
                    for (CartItemDTO item : cart) {
                        subtotal += item.getSubtotal();
                    }
                }
            %>
            <h3>Subtotal: <span class="text-primary">LKR <%= subtotal %></span></h3>
            <a href="cart.jsp" class="checkout-btn">Proceed to Checkout</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
