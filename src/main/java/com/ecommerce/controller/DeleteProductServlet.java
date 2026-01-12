package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.dao.ProductDAO;

@WebServlet("/delete-product")


public class DeleteProductServlet extends HttpServlet {

    @Override
    

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String idStr = req.getParameter("id");

        if (idStr == null) {
            res.sendRedirect(req.getContextPath() + "/admin-products");
            return;
        }

        int id = Integer.parseInt(idStr);

        ProductDAO dao = new ProductDAO();
        dao.deleteProduct(id);

        res.sendRedirect(req.getContextPath() + "/admin-products");
    }
}
