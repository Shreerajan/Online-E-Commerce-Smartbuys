package com.ecommerce.util;

import java.sql.SQLException;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.ecommerce.dao.OrderDAO;
import com.ecommerce.model.Order;
import com.ecommerce.model.OrderItem;

public class OrderProcessor {

    private static OrderProcessor instance = new OrderProcessor();
    private ExecutorService executor = Executors.newFixedThreadPool(5); // 5 worker threads
    private OrderDAO orderDAO = new OrderDAO();

    private OrderProcessor() {}

    public static OrderProcessor getInstance() {
        return instance;
    }

    public void submitOrder(Order order, List<OrderItem> items) {
        // Each order will be processed in a separate thread
        executor.submit(() -> {
            try {
                int orderId = orderDAO.createOrder(order);
                for (OrderItem item : items) {
                    item.setOrderId(orderId);
                }
                orderDAO.addOrderItems(orderId, items);
                System.out.println("Order processed in thread: " + Thread.currentThread().getName());
            } catch (SQLException e) {
                e.printStackTrace();
            }
        });
    }
}
