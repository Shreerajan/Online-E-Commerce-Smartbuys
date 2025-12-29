<%@ page language="java" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
    <h3>Add New Product</h3>
    <form action="addProduct" method="post">
        <div class="mb-3">
            <label class="form-label">Name</label>
            <input class="form-control" type="text" name="name" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea class="form-control" name="description"></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Price</label>
            <input class="form-control" type="number" step="0.01" name="price" required>
        </div>
        <button class="btn btn-primary" type="submit">Save Product</button>
    </form>
</div>
