/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AttendanceDAO;
import DAO.WorkshopDAO;
import entity.WorkshopDDD;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LAPTOP
 */
@WebServlet(name = "Trainer_Workshop_CheckAttendanceServlet", urlPatterns = {"/Trainer_Workshop_CheckAttendanceServlet"})
public class Trainer_Workshop_CheckAttendanceServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        WorkshopDAO dao = new WorkshopDAO();
        for (WorkshopDDD booking : dao.CustomerListInProgressWorkshop()) {
            String customerId = request.getParameter("customer_id_" + booking.getCustomer_id());
            String attendance = request.getParameter("check_attendance_" + booking.getCustomer_id());
            String workshop_id = request.getParameter("workshop_id");

            // Process the data as needed (e.g., update the database, perform calculations, etc.)
            dao.CheckAttendanceWorkshop(customerId, attendance, workshop_id);
        }

//        List<WorkshopDDD> list = dao.ListOfCustomerInProgressWorkshop(course_id);
        HttpSession session = request.getSession(true);
        String course_id = (String) session.getAttribute("course_id");
        List<WorkshopDDD> list = dao.ListOfCustomerInProgressWorkshop(course_id);

        session.setAttribute("customer_list", list);

        RequestDispatcher rd = request.getRequestDispatcher("Trainer_Workshop_CustomerList_In-progress.jsp");
        rd.forward(request, response);
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
