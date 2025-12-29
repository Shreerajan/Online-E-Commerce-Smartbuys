<%@ page language="java" %>
<%
    Object userObj = session.getAttribute("currentUser");
    String userName = null;
    //System.out.print(userObj);

    if (userObj != null) {
        // Adjust this depending on your User model
        userName = ((com.ecommerce.model.User) userObj).getName();
    }
%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Online Ecommerce App</a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navMenu" aria-controls="navMenu"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navMenu">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

        <% if (userObj != null) { %>
            <!-- USER LOGGED IN -->
            <li class="nav-item">
              <a class="nav-link active" href="#">Welcome, <%= userName %></a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="products">Products</a>
            </li>
             <!-- Add Product -->
        <li class="nav-item">
            <a class="nav-link" href="add_product.jsp">Add Product</a>
        </li>

        <!-- Cart Page -->
        <li class="nav-item">
            <a class="nav-link" href="cart.jsp">Cart</a>
        </li>

        <!-- Orders Page -->
        <li class="nav-item">
            <a class="nav-link" href="orders">My Orders</a>
        </li>

            <li class="nav-item">
              <a class="nav-link" href="logout">Logout</a>
            </li>

        <% } else { %>
            <!-- USER NOT LOGGED IN -->
            <li class="nav-item">
              <a class="nav-link" href="login.jsp">Login</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="register.jsp">Register</a>
            </li>
        <% } %>

      </ul>
    </div>
  </div>
</nav>
