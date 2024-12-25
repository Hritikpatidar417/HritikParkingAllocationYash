<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
            margin-bottom: 30px;
        }
        .nav-links {
            display: flex;
            justify-content: space-around;
            margin-bottom: 30px;
        }
        .nav-links a {
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 18px;
        }
        .nav-links a:hover {
            background-color: #0056b3;
        }
        .logout {
            text-align: center;
            margin-top: 20px;
        }
        .logout a {
            text-decoration: none;
            color: #FF5733;
            font-size: 16px;
        }
        .logout a:hover {
            color: #cc3e1f;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Admin Dashboard</h2>

    <%
        // Check if the admin is logged in, else redirect to login page
        String adminID = (String) session.getAttribute("adminUser");
        if (adminID == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
            return;
        }
    %>

    <!-- Admin Navigation Links -->
    <div class="nav-links">
        <a href="viewBookings.jsp">View Bookings</a>
        <a href="manageParking.jsp">Manage Parking</a>
    </div>

    <!-- Logout Option -->
    <div class="logout">
        <a href="logout.jsp">Logout</a>
    </div>
</div>

</body>
</html>
