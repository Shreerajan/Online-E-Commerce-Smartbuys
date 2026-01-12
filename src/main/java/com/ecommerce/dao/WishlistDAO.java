package com.ecommerce.dao;

import java.sql.*;
import java.util.*;
import com.ecommerce.model.Product;
import com.ecommerce.util.DBConnection;

public class WishlistDAO {

    // Add product to wishlist
    public void addToWishlist(int userId, int productId) {
        String sql = "INSERT IGNORE INTO wishlist (user_id, product_id) VALUES (?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Remove product from wishlist
    public void removeFromWishlist(int userId, int productId) {
        String sql = "DELETE FROM wishlist WHERE user_id=? AND product_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get wishlist products of user
    public List<Product> getWishlistByUser(int userId) {
        List<Product> list = new ArrayList<>();

        String sql = """
            SELECT p.* FROM products p
            JOIN wishlist w ON p.id = w.product_id
            WHERE w.user_id = ?
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setImage(rs.getString("image"));
                p.setDescription(rs.getString("description"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
