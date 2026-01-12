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
     style="height:500px; width:400px; object-fit:cover;"
     onerror="this.src='${pageContext.request.contextPath}/uploads/default.png'">

    </div>

    <div class="col-md-6">
        <h2><%= p.getName() %></h2>
        <h4>₹ <%= p.getPrice() %></h4>
        <p><%= p.getDescription() %></p>

        <% if (loggedIn) { %>
            <form action="<%= request.getContextPath() %>/addToCart" method="post">
    <input type="hidden" name="productId" value="<%= p.getId() %>">
    Quantity:
    <input type="number" name="quantity" value="1" min="1" required>
    <button type="submit" class="btn btn-success">Add to Cart <img width="20" height="20" src="https://img.icons8.com/lollipop/20/favorite-cart.png" alt="favorite-cart"/></button>
       </form> 
       
       
       <form action="wishlist" method="get" style="display:inline;">
    <input type="hidden" name="action" value="add">
    <input type="hidden" name="productId" value="<%= p.getId() %>">

    <button type="submit"
            class="btn btn-outline-danger btn-sm mt-1">
        ❤️ Add to Wishlist
    </button>
</form>


        <% } else { %>
            <a href="login.jsp" class="btn btn-warning">
                Login to Add to Cart
            </a>
        <% } %>
    </div>
</div>

<jsp:include page="footer.jsp" />
