<%@ page language="java" %>
<%@ page import="com.ecommerce.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Online Ecommerce App</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>

    <style>
		#sessionTimer {
		    font-size: 0.8rem;
		    vertical-align: middle;
		}
   </style>


<body>
<%
    HttpSession sessionObj = request.getSession(false);
    User currentUser = null;
    String userName = null;

    if (sessionObj != null) {
        currentUser = (User) sessionObj.getAttribute("currentUser");
        if (currentUser != null) {
            userName = currentUser.getName();
        }
    }
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">

    <a class="navbar-brand" href="products">Smartbuy</a>

    <div class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto">

        <% if (currentUser != null) { %>
            <li class="nav-item">
              <span class="nav-link">
                Welcome, <%= userName %>
                <span id="sessionTimer" class="badge bg-warning text-dark ms-2"></span>
              </span>
            </li>
            
            <li class="nav-item">
            <a class="nav-link" href="admin-products">All Products</a>
        </li>
   
 <!-- Add Product -->
        <li class="nav-item">
            <a class="nav-link" href="add_product.jsp">Add Product</a>
        </li>
        
        <!---wishlist link--->
        <li class="nav-item">
		    <a class="nav-link" href="wishlist">Wishlist <img width="20" height="20" src="https://img.icons8.com/cotton/20/like--v1.png" alt="like--v1"/></a>
		</li>
        

        <!-- Cart Page -->
        <li class="nav-item">
            <a class="nav-link" href="cart.jsp">Cart <img width="20" height="20" src="https://img.icons8.com/lollipop/20/favorite-cart.png" alt="favorite-cart"/></a>
        </li>

        <!-- Orders Page -->
        <li class="nav-item">
            <a class="nav-link" href="orders">My Orders</a>
        </li>
            <li class="nav-item">
              <a class="nav-link text-danger" href="logout">Logout</a>
            </li>
        <% } else { %>
            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
            <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
        <% } %>

      </ul>
    </div>
  </div>
</nav>
