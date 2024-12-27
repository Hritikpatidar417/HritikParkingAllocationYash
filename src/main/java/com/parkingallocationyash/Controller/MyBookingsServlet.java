package com.parkingallocationyash.Controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/MyBookings")
public class MyBookingsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic to fetch and display user bookings
        request.getRequestDispatcher("MyBookings.jsp").forward(request, response);
    }
}
