package com.ecommerce.dao;

import java.sql.*;
import java.util.*;
import com.ecommerce.model.ProductImage;
import com.ecommerce.util.DBConnection;

public class ProductImageDAO {

    public void addImage(int productId, String imagePath) {
        String sql = "INSERT INTO product_images (product_id, image_path) VALUES (?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ps.setString(2, imagePath);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<String> getImagesByProduct(int productId) {
        List<String> images = new ArrayList<>();

        String sql = "SELECT image_path FROM product_images WHERE product_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                images.add(rs.getString("image_path"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return images;
    }
}
