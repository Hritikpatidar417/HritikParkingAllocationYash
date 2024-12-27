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

        User user = UserDao.validateUser(email, password);
        if (user != null) {
            if ("admin".equals(user.getRole())) {
                request.getSession().setAttribute("adminEmail", email);
                response.sendRedirect("AdminDashboard.jsp");
            } else {
                request.getSession().setAttribute("userEmail", email);
                response.sendRedirect("UserDashboard.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=Invalid email or password.");
        }
    }

}
