<%@ page import="lk.ijse.eplatform.dto.CategoryDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-5">
    <h1 class="text-center mb-4">Category Management</h1>
    <form action="category-list">
        <button type="submit" class="btn btn-danger">view categories</button>
    </form>
    <form action="admin.jsp">
        <button type="submit" class="btn btn-danger">home</button>
    </form>

    <%
        String message = request.getParameter("message");
        String error = request.getParameter("error");
    %>

    <% if (message != null) { %>
    <div class="alert alert-success" role="alert"><%= message %></div>
    <% } else if (error != null) { %>
    <div class="alert alert-danger" role="alert"><%= error %></div>
    <% } %>



    <!-- Form to Add Category -->
    <div class="card my-4">
        <div class="card-body">
            <h5 class="card-title">Add Category</h5>
            <form action="category-servlet" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" id="name" name="category_name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <input type="text" id="description" name="category_description" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">Save Category</button>
            </form>
        </div>
    </div>

    <!-- Form to Delete Category -->
    <div class="card my-4">
        <div class="card-body">
            <h5 class="card-title">Delete Category</h5>
            <form action="category-servlet" method="post">
                <div class="mb-3">
                    <label for="id" class="form-label">Category ID</label>
                    <input type="number" id="id" name="category_id" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-danger">Delete Category</button>
            </form>
        </div>
    </div>

    <!-- Form to Update Category -->
    <div class="card my-4">
        <div class="card-body">
            <h5 class="card-title">Update Category</h5>
            <form action="category-servlet" method="post">
                <div class="mb-3">
                    <label for="update_category_id" class="form-label">Category ID</label>
                    <input type="number" id="update_category_id" name="update_category_id" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="update_name" class="form-label">New Name</label>
                    <input type="text" id="update_name" name="update_name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="update_description" class="form-label">New Description</label>
                    <input type="text" id="update_description" name="update_description" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-warning">Update Category</button>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
