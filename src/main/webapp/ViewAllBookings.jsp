<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="com.parkingallocationyash.Dao.BookingDao" %>
<%@ page import="com.parkingallocationyash.Entity.Booking" %>
<%
    String adminEmail = (String) session.getAttribute("adminEmail");
    if (adminEmail == null) {
        response.sendRedirect("login.jsp?error=Please login as admin.");
        return;
    }

    List<Booking> bookings = BookingDao.getAllBookings();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Bookings</title>
    <style>
        /* Same styling as other pages */
    </style>
</head>
<body>
<div class="container">
    <h2>All Bookings</h2>
    <table>
        <thead>
        <tr>
            <th>Booking ID</th>
            <th>User Email</th>
            <th>Slot</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (bookings != null && !bookings.isEmpty()) {
                for (Booking booking : bookings) {
        %>
        <tr>
            <td><%= booking.getId() %></td>
            <td><%= booking.getUserEmail() %></td>
            <td><%= booking.getSlot() %></td>
            <td><%= booking.getDate() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No bookings found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <a href="AdminDashboard.jsp" class="btn">Back to Dashboard</a>
</div>
</body>
</html>
