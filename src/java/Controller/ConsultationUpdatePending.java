/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.FormApppointmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoang
 */
@WebServlet(name = "ConsultationUpdatePending", urlPatterns = {"/ConsultationUpdatePending"})
public class ConsultationUpdatePending extends HttpServlet {

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
        String  action   = request.getParameter("action");
          
        if (action.equals("approve")) {
            String consultationId = request.getParameter("consultationId");
            String TrainerID = request.getParameter("selected-trainer");
            String RequestTrainerID = request.getParameter("selected-trainer");
            // Create an instance of your DAO
            FormApppointmentDAO dao = new FormApppointmentDAO();
            try {
                dao.updateAppointmentForm(consultationId,TrainerID, RequestTrainerID);
                response.sendRedirect("Staff_ConsultationForm_Pending.jsp");
            } catch (SQLException | IOException ex) {
                ex.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else if (action.equals("deny")) {
             String consultationId = request.getParameter("consultationId");
           FormApppointmentDAO dao = new FormApppointmentDAO();
           try{
               dao.updateAppointmentFormDeny(consultationId);
               response.sendRedirect("Staff_ConsultationForm_Pending.jsp");
           } catch (SQLException | IOException ex) {
                ex.printStackTrace();
                response.sendRedirect("error.jsp");
            }

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
