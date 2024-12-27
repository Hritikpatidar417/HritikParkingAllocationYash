package com.parkingallocationyash.Dao;

import com.parkingallocationyash.Entity.ParkingSlot;
import com.parkingallocationyash.JDBCutils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ParkingSlotDao {

    // Method to fetch all parking slots
    public static List<ParkingSlot> getAllSlots() {
        List<ParkingSlot> parkingSlots = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM park_slots";
            PreparedStatement pstmt = connection.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                ParkingSlot slot = new ParkingSlot();
                slot.setSlotId(rs.getInt("slotId"));
                slot.setSlotName(rs.getString("slotName"));
                parkingSlots.add(slot);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return parkingSlots;
    }


    // Other methods like addSlot() and removeSlot()
    public static boolean addSlot(String slotName) {
        boolean isAdded = false;
        try (Connection connection = DatabaseConnection.getConnection()) {
            String query = "INSERT INTO parking_slots (slotName) VALUES (?)";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, slotName);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isAdded = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isAdded;
    }

    public static boolean removeSlot(int slotId) {
        boolean isRemoved = false;
        try (Connection connection = DatabaseConnection.getConnection()) {
            String query = "DELETE FROM parking_slots WHERE slotId = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, slotId);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isRemoved = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isRemoved;
    }

}
