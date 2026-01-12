package com.ecommerce.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.ecommerce.model.Product;
import com.ecommerce.util.DBConnection;

public class ProductDAO {
	
	
	public List<Product> getProducts(String search, String sort, int limit, int offset) {

	    List<Product> list = new ArrayList<>();
	    StringBuilder sql = new StringBuilder("SELECT * FROM products WHERE 1=1");

	    if (search != null && !search.trim().isEmpty()) {
	        sql.append(" AND name LIKE ?");
	    }

	    if ("price_asc".equals(sort)) {
	        sql.append(" ORDER BY price ASC");
	    } else if ("price_desc".equals(sort)) {
	        sql.append(" ORDER BY price DESC");
	    } else {
	        sql.append(" ORDER BY id DESC");
	    }

	    sql.append(" LIMIT ? OFFSET ?");

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql.toString())) {

	        int index = 1;

	        if (search != null && !search.trim().isEmpty()) {
	            ps.setString(index++, "%" + search + "%");
	        }

	        ps.setInt(index++, limit);
	        ps.setInt(index, offset);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Product p = new Product(
	                rs.getInt("id"),
	                rs.getString("name"),
	                rs.getDouble("price"),
	                rs.getString("description"),
	                rs.getString("image")
	            );
	            list.add(p);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}


 

    // ========== GET PRODUCT BY ID ==========
    public Product getProductById(int id) {
        Product product = null;
        String sql = "SELECT * FROM products WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getDouble("price"));
                product.setDescription(rs.getString("description"));
                product.setImage(rs.getString("image")); // ✅ FIX
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
    
    public int getProductCount(String search) {
        String sql = "SELECT COUNT(*) FROM products WHERE 1=1";

        if (search != null && !search.trim().isEmpty()) {
            sql += " AND name LIKE ?";
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            if (search != null && !search.trim().isEmpty()) {
                ps.setString(1, "%" + search + "%");
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }



    // ========== ADD PRODUCT ==========
    public boolean addProduct(Product product) {
        String sql = "INSERT INTO products (name, price, description, image) VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getDescription());
            ps.setString(4, product.getImage()); // ✅ FIX

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    //update product
    public boolean updateProduct(Product p) {
        String sql = "UPDATE products SET name=?, price=?, description=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setString(3, p.getDescription());
            ps.setInt(4, p.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    //delete product
    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


}
