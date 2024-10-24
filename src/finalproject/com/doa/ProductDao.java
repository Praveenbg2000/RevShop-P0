package finalproject.com.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import finalproject.com.model.Product;

public class ProductDao {
	private Connection connection;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public ProductDao(Connection connection) {
		this.connection = connection;
	}
	
	
	public List<Product> getAllProduct(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "select *from product";
			pst = this.connection.prepareStatement(query);
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("pid"));
				row.setName(rs.getString("pname"));
				row.setPrice(rs.getDouble("price"));
				row.setDescription(rs.getString("discription"));
				row.setImage(rs.getString("image"));
				row.setCategory(rs.getString("category"));
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		
		
		return products;
	}
	
	
}
