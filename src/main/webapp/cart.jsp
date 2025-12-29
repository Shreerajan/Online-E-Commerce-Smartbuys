<%@ page language="java" import="java.util.*, com.ecommerce.model.CartItem" %>
<%@ include file="header.jsp" %>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    double total = 0;
%>

<div class="container mt-4">
    <h3>Your Cart</h3>

    <% if (cart == null || cart.isEmpty()) { %>
        <div class="alert alert-info">Your cart is empty.</div>
    <% } else { %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Product</th><th>Qty</th><th>Price</th><th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
            <% for (CartItem item : cart) {
                    total += item.getSubtotal();
            %>
                <tr>
                    <td><%= item.getProduct().getName() %></td>
                    <td><%= item.getQuantity() %></td>
                    <td>₹ <%= item.getProduct().getPrice() %></td>
                    <td>₹ <%= item.getSubtotal() %></td>
                </tr>
            <% } %>
            </tbody>
        </table>

        <h4>Total: ₹ <%= total %></h4>

        <form action="placeOrder" method="post">
            <button class="btn btn-primary mt-3">Place Order</button>
        </form>
    <% } %>
</div>
