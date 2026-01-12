package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(id);

        req.setAttribute("product", product);
        req.getRequestDispatcher("edit-product.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        Product p = new Product();
        p.setId(Integer.parseInt(req.getParameter("id")));
        p.setName(req.getParameter("name"));
        p.setPrice(Double.parseDouble(req.getParameter("price")));
        p.setDescription(req.getParameter("description"));

        ProductDAO dao = new ProductDAO();
        dao.updateProduct(p);

        res.sendRedirect("admin-products");
    }
    
}
