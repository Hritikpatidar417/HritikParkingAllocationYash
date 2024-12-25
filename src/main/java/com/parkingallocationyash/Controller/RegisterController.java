package com.parkingallocationyash.Controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.parkingallocationyash.Entity.User;

public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int empId=Integer.parseInt(req.getParameter("employeeID"));
        int phoneNo =Integer.parseInt(req.getParameter("phoneNo"));
        String email = req.getParameter("email");
        String userName = req.getParameter("Name");
        String role = req.getParameter("role");
        String password = req.getParameter("password");

        User user = new User();
        user.setUserId(empId);
        user.setPhoneNo(phoneNo);
        user.setEmail(email);
        user.setName(userName);
        user.setRole(role);
        user.setPassword(password);




        req.getRequestDispatcher("/Login.jsp").forward(req, resp);
    }
}
