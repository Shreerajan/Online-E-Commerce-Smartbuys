package com.ecommerce.controller;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
@WebServlet("/products")

public class ProductServlet extends HttpServlet {

    //private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();

        String search = request.getParameter("search");
        String sort = request.getParameter("sort");

        int limit = 6;
        int page = 1;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        int offset = (page - 1) * limit;

        List<Product> products =
                dao.getProducts(search, sort, limit, offset);

        int totalProducts = dao.getProductCount(search);
        int totalPages = (int) Math.ceil((double) totalProducts / limit);

        request.setAttribute("productList", products);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("search", search);
        request.setAttribute("sort", sort);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
