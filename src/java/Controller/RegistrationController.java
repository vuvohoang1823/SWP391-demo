/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;
import entity.Account;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.SystemFlavorMap;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
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
@WebServlet(name = "RegistrationController", urlPatterns = {"/RegistrationServlet"})
public class RegistrationController extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String username = request.getParameter("txtusername");
        String password = request.getParameter("txtpassword");
        String confimpassword = request.getParameter("confirm");

        //sum first name + lastname => fullName
        String FULLNAME = null;
        try {
            if (!firstname.isEmpty() && !lastname.isEmpty()) {
                FULLNAME = firstname + lastname;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        AccountDAO dao = new AccountDAO();
        try {
            // Get new User_ID
            int user_id = dao.GenerateUser_ID();
            int customer_id = dao.GenerateCustomer_ID();
            // validate fullname 

            if (firstname.isEmpty() || lastname.isEmpty() || email.isEmpty() || contact.isEmpty() || username.isEmpty() || password.isEmpty() || confimpassword.isEmpty()) {
                // Handle case when required fields are missing
                request.setAttribute("errorMessage", "Please fill in all the required fields.");
                request.getRequestDispatcher("signUp.jsp").forward(request, response);
                return; // Stop further execution
            }
            if (!password.equals(confimpassword)) {
                // Handle case when passwords don't match
                request.setAttribute("errorMessage", "Password and confirm password do not match.");
                request.getRequestDispatcher("signUp.jsp").forward(request, response);
                return; // Stop further execution
            }
            if (dao.isUsernameTaken(username)) {
                request.setAttribute("errorMessage", "Username is already taken.");
                request.getRequestDispatcher("signUp.jsp").forward(request, response);
                return; // Stop further execution
            }
      dao.Registration(user_id, username, password, email, customer_id, FULLNAME, contact);
      request.getRequestDispatcher("signin.jsp").forward(request, response);
         //  request.getRequestDispatcher("EnterOtpRegister.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
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
