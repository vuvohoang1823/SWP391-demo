/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DashboardDAO;
import entity.DashboardDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoang
 */
@WebServlet(name = "Dashboard", urlPatterns = {"/Dashboard"})
public class Dashboard extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            DashboardDAO dashboardDAO = new DashboardDAO();
            int month = dashboardDAO.getCurrentMonth();
            int month6minus = month - 5;
            DashboardDTO dashboard6 = dashboardDAO.getTotalRevenue(month);
            DashboardDTO dashboard5 = dashboardDAO.getTotalRevenue(month-1);
            DashboardDTO dashboard4 = dashboardDAO.getTotalRevenue(month-2);
            DashboardDTO dashboard3 = dashboardDAO.getTotalRevenue(month-3);
            DashboardDTO dashboard2 = dashboardDAO.getTotalRevenue(month-4);
            DashboardDTO dashboard1 = dashboardDAO.getTotalRevenue(month-5);
            request.setAttribute("DASHBOARD6", dashboard6);
            request.setAttribute("DASHBOARD5", dashboard5);
            request.setAttribute("DASHBOARD4", dashboard4);
            request.setAttribute("DASHBOARD3", dashboard3);
            request.setAttribute("DASHBOARD2", dashboard2);
            request.setAttribute("DASHBOARD1", dashboard1);
            
            List<Integer> revenueData = new ArrayList<>();
            revenueData.add(dashboard1.getTotal());
            revenueData.add(dashboard2.getTotal());
            revenueData.add(dashboard3.getTotal());
            revenueData.add(dashboard4.getTotal());
            revenueData.add(dashboard5.getTotal());
            revenueData.add(dashboard6.getTotal());
            request.setAttribute("MONTH", month6minus);
            request.setAttribute("DASHBOARD", revenueData);
        }finally{
            RequestDispatcher rd = request.getRequestDispatcher("Staff_Dashboard.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}