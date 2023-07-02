/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.AppointmentDAO;
import DAO.FormApppointmentDAO;
import entity.AppointmentDDD;
import entity.AppointmentDTO;

/**
 *
 * @author LAPTOP
 */
@WebServlet(name = "viewFormDetailServlet", urlPatterns = {"/viewFormDetailServlet"})
public class viewFormDetailPendingServlet extends HttpServlet {

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
        String consultation_id = request.getParameter("consultation_id");

        try  {
            FormApppointmentDAO appointmentDAO = new FormApppointmentDAO();
            AppointmentDDD appointment_detail_Pending = null;
            
            if (!consultation_id.isEmpty() && appointmentDAO.getRequestTrainerID(consultation_id) == null) {
               appointment_detail_Pending = appointmentDAO.getAppointmentDetailPendingTHAT_Cus_NOTChoose_Trainer(consultation_id);
            }else if(!consultation_id.isEmpty() && !appointmentDAO.getRequestTrainerID(consultation_id).isEmpty()){
                appointment_detail_Pending = appointmentDAO.getAppointmentDetailPendingTHAT_Cus_Choose_Trainer(consultation_id);
            }
            
            HttpSession session =  request.getSession(true);
            session.setAttribute("Appointment_Detail_Pending",appointment_detail_Pending );
            
            RequestDispatcher rd = request.getRequestDispatcher("Staff_ConsultationForm_FormDetail.jsp");
            rd.forward(request, response);
            
            
        } catch (Exception ex) {
            System.out.println(ex);
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
