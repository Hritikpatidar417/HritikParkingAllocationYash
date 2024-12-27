package com.parkingallocationyash.Controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.parkingallocationyash.Dao.UserDao;
import com.parkingallocationyash.Entity.*;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String employeeID = request.getParameter("employeeID");
        String email = request.getParameter("email");
        String phoneNo = request.getParameter("phoneNo");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Create User entity and populate data
        User user = new User();
        user.setName(name);
        user.setEmployeeID(employeeID);
        user.setEmail(email);
        user.setPhoneNo(phoneNo);
        user.setPassword(password);
        user.setRole(role);

        // Save the user
        boolean isSaved = UserDao.saveUser(user);

        if (isSaved) {
            // Redirect to login page with success notification
            response.sendRedirect("login.jsp?message=Registration Successful! Please log in.");
        } else {
            // Handle registration failure
            response.setContentType("text/html");
            response.getWriter().println("<h2>Registration Failed!</h2>");
            response.getWriter().println("<p>There was an issue saving your details. Please try again later.</p>");
        }
    }
}