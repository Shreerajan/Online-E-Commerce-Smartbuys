<%@ page import="java.util.*, com.ecommerce.model.Product" %>
<jsp:include page="header.jsp" />

<div class="container mt-4">
    <h2>My Wishlist <img width="40" height="40" src="https://img.icons8.com/cotton/40/like--v1.png" alt="like--v1"/></h2>
    <hr>

<%
List<Product> wishlist = (List<Product>) request.getAttribute("wishlist");
if (wishlist != null && !wishlist.isEmpty()) {
    for (Product p : wishlist) {
%>
    <div class="card mb-3 p-3">
        <h5><%= p.getName() %></h5>
        <p>₹ <%= p.getPrice() %></p>

        <form action="<%= request.getContextPath() %>/addToCart" method="post">
    <input type="hidden" name="productId" value="<%= p.getId() %>">
    Quantity:
    <input type="number" name="quantity" value="1" min="1" required>
    <button type="submit" class="btn btn-success">Add to Cart</button>
       </form> 

        <a href="wishlist?action=remove&productId=<%= p.getId() %>"
           class="btn btn-danger btn-sm">Remove</a>
    </div>
<%
    }
} else {
%>
    <p>Your wishlist is empty.</p>
<%
}
%>
</div>

<jsp:include page="footer.jsp" />
