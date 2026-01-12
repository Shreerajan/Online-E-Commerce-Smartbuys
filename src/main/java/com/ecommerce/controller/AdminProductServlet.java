package com.ecommerce.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

@WebServlet("/admin-products")
public class AdminProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();

        int limit = 5; // products per page
        int page = 1;

        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (Exception e) {
                page = 1;
            }
        }

        int offset = (page - 1) * limit;

        // 🔹 Get paginated products
        List<Product> products = dao.getProducts(null, null, limit, offset);

        // 🔹 Get total count
        int totalProducts = dao.getProductCount(null);
        int totalPages = (int) Math.ceil((double) totalProducts / limit);

        request.setAttribute("products", products);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("admin-products.jsp")
               .forward(request, response);
    }
}
