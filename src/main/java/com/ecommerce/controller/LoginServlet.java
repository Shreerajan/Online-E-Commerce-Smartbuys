package com.ecommerce.controller;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;

import util.PasswordUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String pass  = request.getParameter("password");
        String hashedPassword = PasswordUtil.hashPassword(pass);

        UserDAO dao = new UserDAO();
        User user = dao.login(email, hashedPassword);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            session.setMaxInactiveInterval(15 * 60); // 1 minutes
            response.sendRedirect("products");
           
            

            

        } else {
            response.getWriter().println("Invalid Email or Password");
        }
    }
}
