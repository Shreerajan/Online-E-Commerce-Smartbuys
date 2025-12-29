<%@ page language="java" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
    <div class="alert alert-success">
        <%= request.getAttribute("message") %>
    </div>
    <a href="orders" class="btn btn-primary">View My Orders</a>
</div>
