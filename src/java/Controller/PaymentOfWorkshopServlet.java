/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerDAO;
import DAO.courseDAO;
import entity.CustomerDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
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
@WebServlet(name = "PaymentOfWorkshopServlet", urlPatterns = {"/PaymentOfWorkshopServlet"})
public class PaymentOfWorkshopServlet extends HttpServlet {

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
        String courseID = request.getParameter("courseID");
//        Integer userID = request.getParameter("userID");
        
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
        
        
        
        
        try  {
            System.out.println("I am here");
            CustomerDAO customerDAO = new CustomerDAO();
            int customerID = customerDAO.getCustomerID(userID);
            
            courseDAO courseDAO = new courseDAO();
            String workshopID = courseDAO.getWorkshopID(courseID);
            
            LocalDate currentDate =  LocalDate.now();
            java.sql.Date checkDate = java.sql.Date.valueOf(currentDate);
            
            courseDAO.paymentWorkshop(workshopID, customerID, checkDate, price);
            System.out.println("Payment Successfully");
            
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
