package com.ecommerce.controller;


import com.ecommerce.dao.WishlistDAO;
import com.ecommerce.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {

    WishlistDAO wishlistDAO = new WishlistDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");

        // user not logged in
        if (user == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        String action = req.getParameter("action");
        int userId = user.getId();

        if ("add".equals(action)) {
            int productId = Integer.parseInt(req.getParameter("productId"));
            wishlistDAO.addToWishlist(userId, productId);
            res.sendRedirect("products");
        }
        else if ("remove".equals(action)) {
            int productId = Integer.parseInt(req.getParameter("productId"));
            wishlistDAO.removeFromWishlist(userId, productId);
            res.sendRedirect("wishlist");
        }
        else {
            req.setAttribute("wishlist", wishlistDAO.getWishlistByUser(userId));
            req.getRequestDispatcher("wishlist.jsp").forward(req, res);
        }
    }
}
