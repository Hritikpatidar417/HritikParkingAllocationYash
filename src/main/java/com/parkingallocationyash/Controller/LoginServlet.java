package com.parkingallocationyash.Controller;

import com.parkingallocationyash.Dao.UserDao;
import com.parkingallocationyash.Entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate user
        User user = UserDao.validateUser(email, password);

        if (user != null) {
            // Successful login
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userRole", user.getRole()); // Optionally, save the user's role in session
            response.sendRedirect("UserDashboard.jsp?message=Welcome back, " + user.getName());
        } else {
            // Invalid credentials
            response.sendRedirect("login.jsp?error=Invalid credentials. Please try again.");
        }
    }
}
