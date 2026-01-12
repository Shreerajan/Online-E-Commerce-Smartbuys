<%@ page import="java.util.*, com.ecommerce.model.Product" %>
<jsp:include page="header.jsp"/>

<div class="container mt-4">
<h2>Product Management</h2>

<table class="table table-bordered table-striped">
<thead>
<tr>
    <th>ID</th>
   
    <th>Name</th>
    <th>Price</th>
    <th>Actions</th>
</tr>
</thead>

<tbody>
<%
List<Product> products = (List<Product>) request.getAttribute("products");

if (products != null) {
    for (Product p : products) {
%>
<tr>
    <td><%= p.getId() %></td>

  

    <td><%= p.getName() %></td>
    <td>Rs. <%= p.getPrice() %></td>

    <td>
        <a href="edit-product?id=<%= p.getId() %>"
           class="btn btn-sm btn-warning">Edit</a>

<form method="post" action="${pageContext.request.contextPath}/delete-product">
    <input type="hidden" name="id" value="<%= p.getId() %>">
    <button class="btn btn-danger"
            onclick="return confirm('Delete this product?')">
        Delete
    </button>
</form>


    </td>
</tr>
<%
    }
}
%>
</tbody>
</table>

<%
Integer currentPage = (Integer) request.getAttribute("currentPage");
Integer totalPages = (Integer) request.getAttribute("totalPages");

if (currentPage == null) currentPage = 1;
if (totalPages == null) totalPages = 1;

if (totalPages > 1) {
%>

<nav>
<ul class="pagination justify-content-center">

    <!-- PREVIOUS -->
    <% if (currentPage > 1) { %>
    <li class="page-item">
        <a class="page-link"
           href="${pageContext.request.contextPath}/admin-products?page=<%= currentPage - 1 %>">
           Prev
        </a>
    </li>
    <% } %>

    <!-- PAGE NUMBERS -->
    <% for (int i = 1; i <= totalPages; i++) { %>
    <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
        <a class="page-link"
           href="${pageContext.request.contextPath}/admin-products?page=<%= i %>">
           <%= i %>
        </a>
    </li>
    <% } %>

    <!-- NEXT -->
    <% if (currentPage < totalPages) { %>
    <li class="page-item">
        <a class="page-link"
           href="${pageContext.request.contextPath}/admin-products?page=<%= currentPage + 1 %>">
           Next
        </a>
    </li>
    <% } %>

</ul>
</nav>

<% } %>

</div>

<jsp:include page="footer.jsp"/>
