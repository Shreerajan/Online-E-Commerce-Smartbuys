package com.ecommerce.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

public class AddProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String desc = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));

        Product p = new Product();
        p.setName(name);
        p.setDescription(desc);
        p.setPrice(price);

        productDAO.addProduct(p);

        response.sendRedirect("products"); // reload product list
    }
}
