<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.ecommerce.model.Product" %>

<jsp:include page="header.jsp" />

<%
Product p = (Product) request.getAttribute("products");
if (p == null) {
%>
    <h3>Product not found</h3>
<%
    return;
}
%>
<% HttpSession sessionObj = request.getSession(false); %>
<% boolean loggedIn = session.getAttribute("currentUser") != null; %>

<div class="row">
    <div class="col-md-6">
            <img src="https://www.dummyimg.in/placeholder"
     class="img-fluid">
    </div>

    <div class="col-md-6">
        <h2><%= p.getName() %></h2>
        <h4>₹ <%= p.getPrice() %></h4>
        <p><%= p.getDescription() %></p>

        <% if (loggedIn) { %>
            <form action="<%= request.getContextPath() %>/addToCart" method="post">
    <input type="hidden" name="productId" value="<%= p.getId() %>">
    <button type="submit" class="btn btn-success">Add to Cart</button>
</form>

        <% } else { %>
            <a href="login.jsp" class="btn btn-warning">
                Login to Add to Cart
            </a>
        <% } %>
    </div>
</div>

<jsp:include page="footer.jsp" />
