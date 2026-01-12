package com.ecommerce.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

@MultipartConfig

public class AddProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String desc = request.getParameter("description");
        String priceStr = request.getParameter("price");
        Part imagePart = request.getPart("image");

        if (name == null || desc == null || priceStr == null ||
                priceStr.trim().isEmpty() || imagePart == null || imagePart.getSize() == 0) {

                response.sendRedirect("add_product.jsp?error=invalid");
                return;
            }

        double price = Double.parseDouble(priceStr);
        
     // 🔥 SAVE IMAGE
        String imageName = System.currentTimeMillis() + "_" +
                           imagePart.getSubmittedFileName();

        String uploadPath = getServletContext().getRealPath("/uploads");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        imagePart.write(uploadPath + File.separator + imageName);

        Product p = new Product();
        p.setName(name);
        p.setDescription(desc);
        p.setPrice(price);
        p.setImage(imageName);

        productDAO.addProduct(p);

        response.sendRedirect("products");
    }

}
