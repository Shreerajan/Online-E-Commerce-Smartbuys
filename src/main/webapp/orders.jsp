<%@ page language="java" import="java.util.*, com.ecommerce.model.Order" %>
<%@ include file="header.jsp" %>

<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    System.out.print(orders);
%>

<div class="container mt-4">
    <h3>My Orders</h3>

    <% if (orders == null || orders.isEmpty()) { %>
        <div class="alert alert-info">You have no orders yet.</div>
    <% } else { %>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Created At</th>
                </tr>
            </thead>
            <tbody>
            <% for (Order o : orders) { %>
                <tr>
                    <td><%= o.getId() %></td>
                    <td>₹ <%= o.getTotalAmount() %></td>
                    <td><%= o.getStatus() %></td>
                    <td><%= o.getCreatedAt() %></td>
                </tr>
            <% } %>
            </tbody>
        </table>
    <% } %>
</div>
