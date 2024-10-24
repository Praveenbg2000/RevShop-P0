package finalproject.com.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import finalproject.com.connection.DBConnection;
import finalproject.com.model.Product;

public class ProductAddDao {
	
	
	public List<Product> getProductsByCategory(String category) {
	    List<Product> products = new ArrayList<>();
	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    try {
	        con = DBConnection.getConnection();
	        String query = "SELECT * FROM product;";
	        ps = con.prepareStatement(query);
	        ps.setString(1, category);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            Product product = new Product();
	            product.setId(rs.getInt("pid"));
	            product.setName(rs.getString("pname"));
	            product.setPrice(rs.getDouble("price"));
	            product.setDescription(rs.getString("description"));
	            product.setImage(rs.getString("image"));
	            product.setQuantity(rs.getInt("qty"));
	            product.setCategory(rs.getString("category"));

	            products.add(product);
	        }
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return products;
	}


}
