<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
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
        .profile-info {
            padding: 10px;
            border-bottom: 2px solid #ddd;
            margin-bottom: 20px;
        }
        .profile-info p {
            font-size: 18px;
            margin: 10px 0;
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
    <h2>User Dashboard</h2>

    <%
        // Check if the user is logged in, else redirect to login page
        String empID = (String) session.getAttribute("loginUser");
        if (empID == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Simulating user profile data (in a real app, this should come from a database)
        String userName = "John Doe";  // Example name; this should be fetched from the database based on the empID
    %>

    <!-- Profile Section -->
    <div class="profile-info">
        <h3>Profile Info</h3>
        <p><strong>Name:</strong> <%= userName %></p>
        <p><strong>Employee ID:</strong> <%= empID %></p>
    </div>

    <!-- Navigation Links -->
    <div class="nav-links">
        <a href="bookParking.jsp">Book Parking</a>
        <a href="myBookings.jsp">My Bookings</a>
    </div>

    <!-- Logout Option -->
    <div class="logout">
        <a href="logout.jsp">Logout</a>
    </div>

</div>

</body>
</html>
