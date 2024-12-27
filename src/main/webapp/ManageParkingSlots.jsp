<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="com.parkingallocationyash.Dao.ParkingSlotDao" %>
<%@ page import="com.parkingallocationyash.Entity.ParkingSlot" %>
<%
    String adminEmail = (String) session.getAttribute("adminEmail");
    if (adminEmail == null) {
        response.sendRedirect("login.jsp?error=Please login as admin.");
        return;
    }

    List<ParkingSlot> parkingSlots = ParkingSlotDao.getAllSlots();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Parking Slots</title>
    <style>
        /* Same styling as other pages */
    </style>
</head>
<body>
<div class="container">
    <h2>Manage Parking Slots</h2>
    <form action="AddParkingSlotServlet" method="POST">
        <input type="text" name="slotName" placeholder="Enter new slot name" required>
        <button type="submit">Add Slot</button>
    </form>
    <h3>Existing Slots</h3>
    <table>
        <thead>
        <tr>
            <th>Slot ID</th>
            <th>Slot Name</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (parkingSlots != null && !parkingSlots.isEmpty()) {
                for (ParkingSlot slot : parkingSlots) {
        %>
        <tr>
            <td><%= slot.getSlotId() %></td>
            <td><%= slot.getSlotName() %></td>
            <td>
                <form action="RemoveParkingSlotServlet" method="POST" style="display:inline;">
                    <input type="hidden" name="slotId" value="<%= slot.getSlotId() %>">
                    <button type="submit">Remove</button>
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">No parking slots available.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <a href="AdminDashboard.jsp" class="btn">Back to Dashboard</a>
</div>
</body>
</html>
