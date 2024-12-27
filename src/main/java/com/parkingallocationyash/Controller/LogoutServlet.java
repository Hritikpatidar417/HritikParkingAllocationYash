package com.parkingallocationyash.Controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Invalidate session and redirect to login page
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("Login.jsp?message=You have successfully logged out.");
    }
}
