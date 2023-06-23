/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerDAO;
import DAO.courseDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author LAPTOP
 */
@WebServlet(name = "PaymentForOnlineCourseServlet", urlPatterns = {"/PaymentForOnlineCourseServlet"})
public class PaymentForOnlineCourseServlet extends HttpServlet {
    
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
            throws ServletException, IOException, SQLException, NamingException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        
        String courseID = request.getParameter("courseID");
        Long price = null;
        
            try {
                price = Long.parseLong(request.getParameter("price"));
            } catch (NumberFormatException e) {
                System.out.println("Invalid price value: " + request.getParameter("price"));
        e.printStackTrace();
        return;
            }
            
        Integer userID = null;
            try {
            userID = Integer.parseInt(request.getParameter("userID"));
        } catch (NumberFormatException e) {
            System.out.println("Invalid userID value: " + request.getParameter("userID"));
        e.printStackTrace();
        return;
        }
        
        
        
        try (PrintWriter out = response.getWriter()) {
            
            CustomerDAO customerDAO = new CustomerDAO();
            int customerID = customerDAO.getCustomerID(userID);
            
            LocalDate currentDate =  LocalDate.now();
            java.sql.Date checkDate = java.sql.Date.valueOf(currentDate);
            
            courseDAO courseDAO = new courseDAO();
            courseDAO.paymentOnlineCourse(courseID, customerID, checkDate, price);
            
            RequestDispatcher rd = request.getRequestDispatcher("Successfully.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            System.out.println("An error occurred during payment processing: " + ex.getMessage());
        ex.printStackTrace();
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
            Logger.getLogger(PaymentForOnlineCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(PaymentForOnlineCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PaymentForOnlineCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PaymentForOnlineCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(PaymentForOnlineCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PaymentForOnlineCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
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
