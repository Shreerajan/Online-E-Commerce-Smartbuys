package com.ecommerce.controller;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;

import util.PasswordUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name  = request.getParameter("name");
        String email = request.getParameter("email");
        String pass  = request.getParameter("password");
        String hashedPassword = PasswordUtil.hashPassword(pass);

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(hashedPassword);

        UserDAO dao = new UserDAO();
        boolean status = dao.registerUser(user);

        if (status) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Registration failed");
        }
    }
}
