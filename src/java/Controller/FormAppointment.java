/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.FormApppointmentDAO;
import entity.CustomerDTO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import entity.FormAppointmentDTO;
import java.sql.Date;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;
import org.apache.catalina.Session;

/**
 *
 * @author hoang
 */
@WebServlet(name = "FormAppointment", urlPatterns = {"/formappointment"})
public class FormAppointment extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        String address = request.getParameter("Address");
        /// Choose value of trainer
//        String trainer = request.getParameter("trainer");
//        String selectedTrainerID = null;
//        if (trainer != null && trainer.equals("choose")) {
//            selectedTrainerID = request.getParameter("selected-trainer");
//        } else if (trainer != null && trainer.equals("not-choose")) {
//            selectedTrainerID = null;
//        }
        // END choose Trainer
        // Choose new traiuner
        String selectedTrainer = request.getParameter("selected-trainer");
        String selectedTrainerID = null;

        if (selectedTrainer == null || selectedTrainer.equals("none")) {
            selectedTrainerID = null;
        } else {
            selectedTrainerID = selectedTrainer;
        }

        // end choose trainer
        String datestart = request.getParameter("startdate");
        String note = request.getParameter("note");
        String type = request.getParameter("type");
        FormApppointmentDAO dao = new FormApppointmentDAO();
        CustomerDAO customerdao = new CustomerDAO();
        int consultationID = dao.GenerateConsultationID();
        CustomerDTO user = (CustomerDTO) request.getSession().getAttribute("LOGIN_USER");
        int customerID = customerdao.getCustomerID(user.getUser_id());
        if (address == null || selectedTrainer == null || datestart == null || note == null || type == null) {
            response.sendRedirect("error.jsp");
            return;
        }
        java.sql.Date datestartSql = null;
        if (!datestart.isEmpty()) {
            datestartSql = java.sql.Date.valueOf(datestart);
        } else {
            // Handle the case when userID is empty
            // For example, you could assign a default value or show an error message
            System.out.println("Error message with NumberFormatException");
        }

        // get userID
//         HttpSession session = request.getSession();
//         Object loginAttribute = session.getAttribute("LOGIN_USER");
//          if (loginAttribute instanceof Integer) {
//           userID = (Integer) loginAttribute;
//        // Use the userID as needed
//        } else {
//        // Handle the case where the attribute is not an Integer
//              System.out.println("login deo");
//       }
        dao.InputFormAppointment(consultationID, customerID, datestartSql, note, address, type, selectedTrainerID);
        response.sendRedirect("formsuccess.jsp");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FormAppointment.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(FormAppointment.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(FormAppointment.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            try {
                processRequest(request, response);
            } catch (NamingException ex) {
                Logger.getLogger(FormAppointment.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FormAppointment.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(FormAppointment.class.getName()).log(Level.SEVERE, null, ex);
        }
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
