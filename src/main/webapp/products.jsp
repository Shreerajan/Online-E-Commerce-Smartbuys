<%@ page language="java" import="java.util.*, com.ecommerce.model.Product" %>
<%@ include file="header.jsp" %>

<%
    // Protect page – only logged-in users can access
    //if (session == null || session.getAttribute("user") == null) {
        //response.sendRedirect("login.jsp");
        //return;
    //}

    List<Product> productList = (List<Product>) request.getAttribute("productList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-4">

    <h2 class="mb-4">Product List</h2>

    <% if (productList == null || productList.isEmpty()) { %>
        <div class="alert alert-warning">No products available.</div>
    <% } else { %>

        <div class="row">

            <% for (Product p : productList) { %>

                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm h-100">

                        <div class="card-body">
                            <h5 class="card-title"><%= p.getName() %></h5>

                            <p class="card-text text-muted">
                                <%= p.getDescription() != null ? p.getDescription() : "No description available." %>
                            </p>

                            <h6 class="text-primary">Price: ₹ <%= p.getPrice() %></h6>

                            <form action="addToCart" method="post" class="mt-2">
							    <input type="hidden" name="id" value="<%= p.getId() %>">
							    <input type="number" name="quantity" value="1" min="1" class="form-control mb-2">
							    <button class="btn btn-success w-100">Add to Cart</button>
							</form>
                        </div>

                    </div>
                </div>

            <% } %>

        </div>

    <% } %>

</div>

</body>
</html>
