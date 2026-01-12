<%@ page language="java" import="java.util.*, com.ecommerce.model.Product" %>
<jsp:include page="header.jsp" />
<div class="container">

<form method="get" action="products" class="row mb-3">
    <div class="col-md-4">
        <input type="text" name="search" class="form-control"
               placeholder="Search products">
    </div>

    <div class="col-md-3">
        <select name="sort" class="form-select">
            <option value="default">Newest</option>
            <option value="price_asc">Low To High</option>
            <option value="price_desc">High To Low</option>
        </select>
    </div>

    <div class="col-md-2">
        <button class="btn btn-primary">Apply</button>
    </div>
</form>

<div class="row">
<%
List<Product> productList =
    (List<Product>) request.getAttribute("productList");
   

if (productList != null && !productList.isEmpty()) {
    for (Product p : productList) {
%>
        <div class="col-md-4 mb-3">
            <div class="card">
               
     <img src="${pageContext.request.contextPath}/uploads/<%= 
    (p.getImage() != null && !p.getImage().trim().isEmpty()
        ? p.getImage()
        : "default.png") %>"
     class="card-img-top"
     style="height:200px; object-fit:cover;"
     onerror="this.src='${pageContext.request.contextPath}/uploads/default.png'">


     
                <div class="card-body">
                    <h5><%= p.getName() %></h5>
                    <p>Rs. <%= p.getPrice() %></p>

                    <!-- VIEW ONLY -->
                   <a href="<%= request.getContextPath() %>/product-detail?id=<%= p.getId() %>"
   class="btn btn-outline-primary">
   View Product
</a>

       <form action="wishlist" method="get" style="display:inline;">
    <input type="hidden" name="action" value="add">
    <input type="hidden" name="productId" value="<%= p.getId() %>">

    <button type="submit"
            class="btn btn-outline-danger btn-sm mt-1">
        <img width="20" height="20" src="https://img.icons8.com/cotton/20/like--v1.png" alt="like--v1"/> </button>
</form>


                </div>
            </div>
        </div>
<%
    }
} else {
%>
    <div class="col-12">
        <div class="alert alert-info text-center">
            No products found.
        </div>
    </div>
<%
}
%>
</div>


<!-- PAGINATION -->
<%
Integer currentPage = (Integer) request.getAttribute("currentPage");
Integer totalPages = (Integer) request.getAttribute("totalPages");
String search = request.getParameter("search");
String sort = request.getParameter("sort");

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
           href="${pageContext.request.contextPath}/products?page=<%= currentPage - 1 %>&search=<%= search != null ? search : "" %>&sort=<%= sort != null ? sort : "" %>">
            Prev
        </a>
    </li>
    <% } %>

    <!-- NEXT -->
    <% if (currentPage < totalPages) { %>
    <li class="page-item">
        <a class="page-link"
           href="${pageContext.request.contextPath}/products?page=<%= currentPage + 1 %>&search=<%= search != null ? search : "" %>&sort=<%= sort != null ? sort : "" %>">
            Next
        </a>
    </li>
    <% } %>

</ul>
</nav>

<% } %>


</div>
<jsp:include page="footer.jsp" />
