package com.ecommerce.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.ecommerce.model.*;
import com.ecommerce.util.OrderProcessor;

public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("currentUser");
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // Build Order + OrderItems
        double total = 0;
        List<OrderItem> orderItems = new ArrayList<>();
        for (CartItem ci : cart) {
            OrderItem oi = new OrderItem();
            oi.setProductId(ci.getProduct().getId());
            oi.setQuantity(ci.getQuantity());
            oi.setPrice(ci.getProduct().getPrice());
            orderItems.add(oi);

            total += ci.getSubtotal();
        }

        Order order = new Order();
        order.setUserId(user.getId());
        order.setTotalAmount(total);
        order.setStatus("PENDING");

        // MULTI-THREAD: submit to background processor
        OrderProcessor.getInstance().submitOrder(order, orderItems);

        // Clear cart immediately
        session.removeAttribute("cart");

        // Show confirmation
        request.setAttribute("message", "Your order has been placed and is being processed.");
        RequestDispatcher rd = request.getRequestDispatcher("order_success.jsp");
        rd.forward(request, response);
    }
}
