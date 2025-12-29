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
           <img src="${pageContext.request.contextPath}/uploads/<%= 
    (p.getImage() != null && !p.getImage().trim().isEmpty()
        ? p.getImage()
        : "default.png") %>"
     class="card-img-top"
     style="height:200px; object-fit:cover;"
     onerror="this.src='${pageContext.request.contextPath}/uploads/default.png'">
    </div>

    <div class="col-md-6">
        <h2><%= p.getName() %></h2>
        <h4>₹ <%= p.getPrice() %></h4>
        <p><%= p.getDescription() %></p>

        <% if (loggedIn) { %>
            <form action="<%= request.getContextPath() %>/addToCart" method="post">
    <input type="hidden" name="productId" value="<%= p.getId() %>">
    <input type="number" name="quantity" value="1" min="1" required>
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
