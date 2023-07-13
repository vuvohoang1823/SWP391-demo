/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BirdDAO;
import DAO.BookingDAO;
import DAO.CustomerDAO;
import entity.BookingDTO;
import entity.CustomerDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
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
@WebServlet(name = "FormCourseServlet", urlPatterns = {"/FormCourseServlet"})
public class FormCourseServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NamingException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        CustomerDTO user = (CustomerDTO) request.getSession().getAttribute("LOGIN_USER");
        CustomerDAO customerdao = new CustomerDAO();
        int customerID = customerdao.getCustomerID(user.getUser_id());
        BirdDAO birdDAO = new BirdDAO();
        int bird_id = birdDAO.generateBirdID();
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        String name = request.getParameter("bird_name");
        String type = request.getParameter("bird_type");
        int amount = Integer.parseInt(request.getParameter("amount"));
        Date preferred_date = Date.valueOf(request.getParameter("preferred_date"));

        try {
            System.out.println("customerID: " + customerID + " bird_id: " + " course_id: " + course_id + " amount: " + amount);
            birdDAO.addNewBird(bird_id, name, type);
            BookingDAO bookingDAO = new BookingDAO();
            bookingDAO.addNewBooking(customerID, bird_id, course_id, amount, preferred_date);
            request.setAttribute("FormSuccessBirdID", bird_id);
            request.setAttribute("Preferred_date", preferred_date);

        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("BirdCourseSuccess");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FormCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(FormCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FormCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(FormCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(FormCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FormCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
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
