package com.parkingallocationyash.Dao;

import com.parkingallocationyash.Entity.ParkingSlot;
import com.parkingallocationyash.JDBCutils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ParkingSlotDao {
    public static List<ParkingSlot> getUserBookings(String userEmail) {
        List<ParkingSlot> bookedSlots = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM parking_slots WHERE userEmail = ? AND isBooked = TRUE";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, userEmail);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ParkingSlot slot = new ParkingSlot();
                slot.setSlotId(rs.getInt("slotId"));
                slot.setSlotName(rs.getString("slotName"));
                slot.setBooked(rs.getBoolean("isBooked"));
                bookedSlots.add(slot);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookedSlots;
    }
}
