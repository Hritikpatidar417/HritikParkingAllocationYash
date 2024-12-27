package com.parkingallocationyash.Controller;

import com.parkingallocationyash.Dao.ParkingSlotDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddParkingSlotServlet")
public class AddParkingSlotServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String slotName = request.getParameter("slotName");

        boolean isAdded = ParkingSlotDao.addSlot(slotName);

        if (isAdded) {
            response.sendRedirect("ManageParkingSlots.jsp?success=Slot added successfully.");
        } else {
            response.sendRedirect("ManageParkingSlots.jsp?error=Failed to add slot.");
        }
    }
}
