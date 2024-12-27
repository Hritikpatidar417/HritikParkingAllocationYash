package com.parkingallocationyash.Controller;

import com.parkingallocationyash.Dao.ParkingSlotDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RemoveParkingSlotServlet")
public class RemoveParkingSlotServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int slotId = Integer.parseInt(request.getParameter("slotId"));

        boolean isRemoved = ParkingSlotDao.removeSlot(slotId);

        if (isRemoved) {
            response.sendRedirect("ManageParkingSlots.jsp?success=Slot removed successfully.");
        } else {
            response.sendRedirect("ManageParkingSlots.jsp?error=Failed to remove slot.");
        }
    }
}
