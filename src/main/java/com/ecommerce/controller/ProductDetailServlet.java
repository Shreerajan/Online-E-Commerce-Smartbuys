package com.ecommerce.controller;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/product-detail")

public class ProductDetailServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO(); // ✅ create object

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null) {
            response.sendRedirect("products?view=index");
            return;
        }

        int id = Integer.parseInt(idParam);

        // ✅ CALL NON-STATIC METHOD USING OBJECT
        Product product = productDAO.getProductById(id);

        if (product == null) {
            response.sendRedirect("products?view=index");
            return;
        }

        request.setAttribute("products", product);
        boolean loggedIn = request.getSession().getAttribute("user") != null;
        request.setAttribute("loggedIn", loggedIn);

        request.getRequestDispatcher("product_details.jsp")
               .forward(request, response);
    }
}
