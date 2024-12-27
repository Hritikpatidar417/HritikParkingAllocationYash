package com.parkingallocationyash.Controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/BookParking")
public class BookParkingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to a JSP for booking parking
        request.getRequestDispatcher("BookParking.jsp").forward(request, response);
    }
}
