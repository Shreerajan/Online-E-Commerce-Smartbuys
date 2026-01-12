package com.ecommerce.controller;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

@WebServlet("/uploads/*")
public class ImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String fileName = req.getPathInfo(); // /abc.jpg
        if (fileName == null || fileName.equals("/") ) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        if (fileName.startsWith("/")) {
            fileName = fileName.substring(1);
        }

        String uploadsDir = getServletContext().getRealPath("/uploads");
        File file = new File(uploadsDir, fileName);

        if (!file.exists() || !file.isFile()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String mime = getServletContext().getMimeType(file.getName());
        if (mime == null) {
            mime = Files.probeContentType(file.toPath());
        }
        if (mime == null) {
            mime = "application/octet-stream";
        }

        resp.setContentType(mime);
        resp.setContentLengthLong(file.length());
        Files.copy(file.toPath(), resp.getOutputStream());
    }
}


