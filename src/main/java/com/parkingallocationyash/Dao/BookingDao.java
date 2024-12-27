package com.parkingallocationyash.Dao;

import com.parkingallocationyash.Entity.Booking;
import com.parkingallocationyash.JDBCutils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingDao {

    // Add a new booking
    public static boolean addBooking(Booking booking) {
        boolean isAdded = false;
        try (Connection connection = DatabaseConnection.getConnection()) {
            String query = "INSERT INTO bookings (userEmail, date, slot) VALUES (?, ?, ?)";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, booking.getUserEmail());
            pstmt.setString(2, booking.getDate());
            pstmt.setString(3, booking.getSlot());

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                isAdded = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isAdded;
    }

    // Get bookings for a specific user
    public static List<Booking> getBookingsByUser(String userEmail) {
        List<Booking> bookings = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM bookings WHERE userEmail = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, userEmail);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setId(rs.getInt("id"));
                booking.setUserEmail(rs.getString("userEmail"));
                booking.setDate(rs.getString("date"));
                booking.setSlot(rs.getString("slot"));
                bookings.add(booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookings;
    }
}
