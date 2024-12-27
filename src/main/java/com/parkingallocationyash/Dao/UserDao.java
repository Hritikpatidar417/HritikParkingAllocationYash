package com.parkingallocationyash.Dao;

import com.parkingallocationyash.Entity.User;
import com.parkingallocationyash.JDBCutils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {

    // Method to save a user to the database
    public static boolean saveUser(User user) {
        boolean isSaved = false;
        try (Connection connection = DatabaseConnection.getConnection()) {
            String query = "INSERT INTO users (name, employeeID, email, phoneNo, password, role) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmployeeID());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPhoneNo());
            pstmt.setString(5, user.getPassword());
            pstmt.setString(6, user.getRole());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isSaved = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSaved;
    }

    // Method to validate a user's login credentials
    public static User validateUser(String email, String password) {
        User user = null;
        try (Connection connection = DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setName(rs.getString("name"));
                user.setEmployeeID(rs.getString("employeeID"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNo(rs.getString("phoneNo"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
