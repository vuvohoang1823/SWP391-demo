/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerDAO;
import DAO.TrainerDAO;
import DAO.UserDAO;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author hoang
 */
@WebServlet(name = "AddAccountServlet", urlPatterns = {"/AddAccountServlet"})
public class AddAccountServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String thumbnailBase64 = "";
            UserDAO userDAO = new UserDAO();
            int user_id = userDAO.generateUserID();
            String fullname = request.getParameter("fullname");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String role = request.getParameter("selected-category");
            String contact = request.getParameter("contact");

            if (role.equals("trainer")) {
                Part thumbnailPart = request.getPart("thumbnail");
                String thumbnailFileName = thumbnailPart.getSubmittedFileName();
                InputStream thumbnailinputStream = thumbnailPart.getInputStream();
                thumbnailBase64 = convertToBase64(thumbnailinputStream);
            }

            userDAO.addNewUser(user_id, username, role, email);

            if (role.equals("customer")) {
                CustomerDAO customerDAO = new CustomerDAO();
                int customer_id = customerDAO.generateCustomerID();
                customerDAO.addNewCustomer(customer_id, user_id, fullname, contact);
            } else if (role.equals("trainer")) {
                TrainerDAO trainerDAO = new TrainerDAO();
                int trainer_id = trainerDAO.generateTrainerID();
                trainerDAO.addNewTrainer(trainer_id, user_id, fullname, thumbnailBase64, contact);
            } else if (role.equals("staff")) {
                int staff_id = userDAO.generateStaffID();
                userDAO.addNewStaff(user_id, staff_id, fullname, contact);
            } else if (role.equals("admin")) {
                int admin_id = userDAO.generateAdminID();
                userDAO.addNewAdmin(user_id, admin_id, fullname, contact);
            }

        } finally {
            response.sendRedirect("Admin_listAccount.jsp");
        }
    }

    private String convertToBase64(InputStream inputStream) throws IOException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        byte[] bytes = outputStream.toByteArray();
        String base64String = Base64.getEncoder().encodeToString(bytes);
        return base64String;
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
            Logger.getLogger(AddAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
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