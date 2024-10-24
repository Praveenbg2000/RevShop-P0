package finalproject.com.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import finalproject.com.model.Admin;

public class AdminDao {
    private Connection conn;

    public AdminDao(Connection conn) {
        this.conn = conn;
    }

    public Admin adminLogin(String email, String password) throws SQLException {
        // Logic to check for admin in the database
        String sql = "SELECT email,password,role FROM admin WHERE email = ? AND password = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            Admin admin = new Admin();
            admin.setEmail(rs.getString("email"));
            admin.setRole(rs.getString("role"));  // Assuming the role is stored in the database
            return admin;
        }
        return null;
    }
}

