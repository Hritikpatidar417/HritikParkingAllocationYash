<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="com.parkingallocationyash.Dao.BookingDao" %>
<%@ page import="com.parkingallocationyash.Entity.Booking" %>
<%
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect("login.jsp?error=Please login first.");
        return;
    }

    List<Booking> bookings = BookingDao.getBookingsByUser(userEmail);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        td {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            margin: 20px 0;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .no-booking {
            text-align: center;
            color: #ff5733;
            font-size: 18px;
        }

    </style>
</head>
<body>
<div class="container">
    <h2>My Bookings</h2>
    <table>
        <thead>
        <tr>
            <th>Booking ID</th>
            <th>Date</th>
            <th>Slot</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (bookings != null && !bookings.isEmpty()) {
                for (Booking booking : bookings) {
        %>
        <tr>
            <td><%= booking.getId() %></td>
            <td><%= booking.getDate() %></td>
            <td><%= booking.getSlot() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3" class="no-booking">No bookings found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <a href="UserDashboard.jsp" class="btn">Back to Dashboard</a>
</div>
</body>
</html>
