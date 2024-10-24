package finalproject.com.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import finalproject.com.model.User;

public class Userdoa {
	private Connection connection;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public Userdoa(Connection connection) {
		this.connection = connection;
	}
	
	
	public User userlogin(String email, String password) {
	    User user = null;
	    String query = "SELECT * FROM users WHERE email = ? AND password = ?";
	    try (PreparedStatement pst = this.connection.prepareStatement(query)) {
	        pst.setString(1, email);
	        pst.setString(2, password);
	        try (ResultSet rs = pst.executeQuery()) {
	            if (rs.next()) {
	                user = new User();
	                user.setId(rs.getInt("id"));
	                user.setName(rs.getString("username"));
	                user.setEmail(rs.getString("email"));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return user;
	}


	

}
