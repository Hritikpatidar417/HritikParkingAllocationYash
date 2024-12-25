<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 20%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
        .form-group input:focus {
            border-color: #007BFF;
            outline: none;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
        .message {
            color: green;
            text-align: center;
            font-size: 16px;
        }
        .error {
            color: red;
            text-align: center;
            font-size: 16px;
        }
.logoContainer{
display:flex;
width:full;
justify-content :center;
padding:4px;
}       .yashlogo{
        width:20vw;
        height:15vh

        }
    </style>
</head>
<body>

<div class="container">
    <h2>Login Page</h2>

    <%
        // Display registration success message if exists
        String registrationSuccess = (String) session.getAttribute("registrationSuccess");
        if (registrationSuccess != null) {
            out.println("<div class='message'>" + registrationSuccess + "</div>");
            session.removeAttribute("registrationSuccess");  // Clear the session message after displaying
        }

        // Handle login error message if exists
        String loginError = (String) session.getAttribute("loginError");
        if (loginError != null) {
            out.println("<div class='error'>" + loginError + "</div>");
            session.removeAttribute("loginError");  // Clear error message
        }
    %>

    <div class="logoContainer" >
<img class="yashlogo" src="../image/YashLogo1.png"/>   </div>

    <form action="login.jsp" method="POST">
        <!-- Employee ID -->
        <div class="form-group">
            <label for="empID">Employee ID:</label>
            <input type="text" id="empID" name="empID" required>
        </div>

        <!-- Password -->
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>

        <!-- Login Button -->
        <div class="form-group">
            <button type="submit">Login</button>
        </div>
    </form>



</div>

</body>
</html>
