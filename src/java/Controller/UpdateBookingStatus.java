/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BookingDAO;
import DAO.TrainerDAO;
import entity.CustomerDTO;
import entity.Trainer;
import entity.TrainerSP;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoang
 */
@WebServlet(name = "UpdateBookingStatus", urlPatterns = {"/UpdateBookingStatus"})
public class UpdateBookingStatus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NamingException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");

//        CustomerDTO user = (CustomerDTO) request.getSession().getAttribute("LOGIN_USER");
//        TrainerDAO trainerDAO = new TrainerDAO();
//        int trainer_id = trainerDAO.getTrainerIID(user.getUser_id());
        String action = request.getParameter("button");

        TrainerSP user = (TrainerSP) request.getSession().getAttribute("LOGIN_USER");
        TrainerDAO trainerDAO = new TrainerDAO();
        int trainer_id = user.getTrainerID();

        int bird_id = Integer.parseInt(request.getParameter("bird_id"));

        String status = request.getParameter("status");

        try {
            if (action.equals("submit")) {
                BookingDAO bookingDAO = new BookingDAO();
                if (status.equals("checkin")) {
                    bookingDAO.startBoooking(bird_id);
                } else if (status.equals("in-training")) {
                    bookingDAO.updateStatus(bird_id, status);
                } else if (status.equals("completed")) {
                    bookingDAO.updateStatus(bird_id, status);
                    trainerDAO.setTrainerAvailable(trainer_id);
                }
            }
        } finally {
            response.sendRedirect("Trainer_Tracking");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBookingStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(UpdateBookingStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateBookingStatus.class.getName()).log(Level.SEVERE, null, ex);
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBookingStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(UpdateBookingStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateBookingStatus.class.getName()).log(Level.SEVERE, null, ex);
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
