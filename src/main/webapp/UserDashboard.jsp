<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect("login.jsp?error=Please login first.");
        return;
    }
    String message = request.getParameter("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            max-width: 1200px;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            margin: 50px auto;
        }

        h2 {
            text-align: center;
        }

        .message {
            text-align: center;
            color: green;
        }

        .btn {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            background-color: #2575fc;
            color: white;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #6a11cb;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>User Dashboard</h2>

    <% if (message != null) { %>
    <div class="message"><%= message %></div>
    <% } %>

    <a href="BookParking.jsp" class="btn">Book Parking</a>
    <a href="MyBookings.jsp" class="btn">My Bookings</a>
    <a href="LogoutServlet" class="btn">Logout</a>
</div>

</body>
</html>
