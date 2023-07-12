/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.FormApppointmentDAO;
import entity.AppointmentDDD;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hoang
 */
@WebServlet(name = "SearchFormConsultation", urlPatterns = {"/SearchFormConsultation"})
public class SearchFormConsultation extends HttpServlet {

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
        String actionButton = request.getParameter("action");
        String SeachValue = request.getParameter("txtSearch");

        Logger logger = Logger.getLogger(getClass().getName());
        logger.info("action:" + actionButton);
        logger.info("search valuye: " + SeachValue);
        if (actionButton.equals("pending")) {
            FormApppointmentDAO dao = new FormApppointmentDAO();
            List<AppointmentDDD> dto = new ArrayList<>();
            dto = dao.SEARCHAppointmentFormPendingbyCustomer(SeachValue);
            if (null != dto) {
                request.setAttribute("searchMessage", dto.size());
            }
            request.setAttribute("ListPending", dto);
            request.setAttribute("SeachValue", SeachValue);
            request.getRequestDispatcher("Staff_ConsultationForm_Pending.jsp").forward(request, response);
        }
        if (actionButton.equals("processing")) {
            FormApppointmentDAO dao = new FormApppointmentDAO();
            List<AppointmentDDD> dto = new ArrayList<>();
            dto = dao.SEARCHAppointmentFormProcessingbyCustomer(SeachValue);
            if (null != dto) {
                request.setAttribute("searchMessage", dto.size());
            }
            request.setAttribute("ListProcessing", dto);
            request.setAttribute("SeachValue", SeachValue);
            request.getRequestDispatcher("Staff_ConsultationForm_Processing.jsp").forward(request, response);
        }
        if (actionButton.equals("completed")) {
            FormApppointmentDAO dao = new FormApppointmentDAO();
            List<AppointmentDDD> dto = new ArrayList<>();
            dto = dao.SEARCHAppointmentFormCompltedbyCustomer(SeachValue);
            if (null != dto) {
                request.setAttribute("searchMessage", dto.size());
            }
            request.setAttribute("ListCompleted", dto);
            request.setAttribute("SeachValue", SeachValue);
            request.getRequestDispatcher("Staff_OrderList_Consult_Completed.jsp").forward(request, response);
        }
        if (actionButton.equals("history")) {
            FormApppointmentDAO dao = new FormApppointmentDAO();
            List<AppointmentDDD> dto = new ArrayList<>();
            dto = dao.SEARCHAppointmentFormHistorybyCustomer(SeachValue);
            if (null != dto) {
                request.setAttribute("searchMessage", dto.size());
            }
            request.setAttribute("LisHistory", dto);
            request.setAttribute("SeachValue", SeachValue);
            request.getRequestDispatcher("Staff_OrderList_Consult_History.jsp").forward(request, response);
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
