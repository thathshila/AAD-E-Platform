<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/21/2025
  Time: 12:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Listing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .product-card {
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            transition: transform 0.3s, box-shadow 0.3s;
            height: 400px; /* Fixed height for uniformity */
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* Distribute space between elements */
        }

        .product-card img {
            width: 100%;
            height: 200px; /* Fixed height for images */
            object-fit: contain; /* Scale the image proportionally */
            border-radius: 8px;
        }

        .product-card h5 {
            font-size: 1rem;
            font-weight: bold;
            margin: 15px 0;
            flex-grow: 1; /* Allow the title to fill available space */
        }

        .product-card .rating {
            color: #f7c308;
            font-size: 1rem;
            margin-bottom: 10px;
        }

        .product-card .price {
            color: #b12704;
            font-weight: bold;
            font-size: 1.1rem;
            margin-bottom: 10px;
        }

        .product-card .delivery {
            font-size: 0.9rem;
            color: #565959;
        }

        .product-card .discount {
            color: #28a745;
            font-weight: bold;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .page-header {
            text-align: center;
            margin-bottom: 40px;
            color: #333;
        }

        .page-header h2 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .page-header p {
            font-size: 1rem;
            color: #555;
        }

    </style>
</head>
<body>

<div class="container my-5">
    <div class="page-header">
        <h2>Discover Our Latest Products</h2>
        <p>Check out the latest offers and get your favorite items now! Prices and availability may vary by product size and color.</p>
    </div>

    <div class="row g-4">
        <!-- Product Cards -->
        <div class="col-12 col-md-6 col-lg-3">
            <div class="product-card">
                <img src="images/03.jpg" alt="LEVOIT Top Fill Humidifiers for Bedroom">
                <h5>LEVOIT Top Fill Humidifiers for Bedroom</h5>
                <p class="rating">⭐⭐⭐⭐☆</p>
                <p class="price">$39.99</p>
                <p class="delivery">Delivery Wed, Jan 29</p>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="product-card">
                <img src="images/03.jpg" alt="Dreo Humidifiers for Bedroom">
                <h5>Dreo Humidifiers for Bedroom</h5>
                <p class="rating">⭐⭐⭐⭐☆</p>
                <p class="price">$39.99 <span class="discount">Save 10%</span></p>
                <p class="delivery">Delivery Wed, Jan 29</p>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="product-card">
                <img src="images/03.jpg" alt="LEVOIT Air Purifiers for Bedroom">
                <h5>LEVOIT Air Purifiers for Bedroom</h5>
                <p class="rating">⭐⭐⭐⭐⭐</p>
                <p class="price">$46.86</p>
                <p class="delivery">Delivery Wed, Jan 29</p>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="product-card">
                <img src="images/03.jpg" alt="OLANLY Bathroom Rugs">
                <h5>OLANLY Bathroom Rugs</h5>
                <p class="rating">⭐⭐⭐⭐☆</p>
                <p class="price">$9.99 <span class="discount">Save 10%</span></p>
                <p class="delivery">Delivery Wed, Jan 29</p>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="product-card">
                <img src="images/04.jpg" alt="Product 5">
                <h5>Product 5 Title</h5>
                <p class="rating">⭐⭐⭐⭐☆</p>
                <p class="price">$29.99</p>
                <p class="delivery">Delivery Fri, Feb 1</p>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="product-card">
                <img src="images/05.jpg" alt="Product 6">
                <h5>Product 6 Title</h5>
                <p class="rating">⭐⭐⭐⭐⭐</p>
                <p class="price">$49.99</p>
                <p class="delivery">Delivery Fri, Feb 1</p>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="product-card">
                <img src="images/06.jpg" alt="Product 7">
                <h5>Product 7 Title</h5>
                <p class="rating">⭐⭐⭐⭐☆</p>
                <p class="price">$39.99</p>
                <p class="delivery">Delivery Fri, Feb 1</p>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="product-card">
                <img src="images/07.jpg" alt="Product 8">
                <h5>Product 8 Title</h5>
                <p class="rating">⭐⭐⭐⭐⭐</p>
                <p class="price">$59.99</p>
                <p class="delivery">Delivery Fri, Feb 1</p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
