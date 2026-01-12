<%@ page import="com.ecommerce.model.Product" %>
<jsp:include page="header.jsp"/>

<%
Product p = (Product) request.getAttribute("product");
%>

<div class="container">
<h2>Edit Product</h2>

<form method="post" action="edit-product">
    <input type="hidden" name="id" value="<%= p.getId() %>">

    <input class="form-control mb-2"
           name="name"
           value="<%= p.getName() %>" required>

    <input class="form-control mb-2"
           name="price"
           type="number"
           value="<%= p.getPrice() %>" required>

    <textarea class="form-control mb-2"
              name="description"><%= p.getDescription() %></textarea>

    <button class="btn btn-success">Update</button>
</form>
</div>

<jsp:include page="footer.jsp"/>
