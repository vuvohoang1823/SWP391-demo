/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "UpdateAccount", urlPatterns = {"/UpdateAccount"})
public class UpdateAccount extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            UserDAO userDAO = new UserDAO();
            String action = request.getParameter("action");
            int user_id = Integer.parseInt(request.getParameter("user_id"));
            String oldRole = request.getParameter("role");
            String role = request.getParameter("selected-category");
            if (role == null) {
                role = oldRole;
            }

            if (action.equals("update")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String fullname = request.getParameter("fullname");
                String gmail = request.getParameter("email");
                String contact = request.getParameter("contact");

                if (role.equals("customer")) {
                    userDAO.update("tbl_customer", fullname, contact, user_id);
                } else if (role.equals("trainer")) {
                    userDAO.update("tbl_trainer", fullname, contact, user_id);
                } else if (role.equals("staff")) {
                    userDAO.update("tbl_staff", fullname, contact, user_id);
                } else if (role.equals("admin")) {
                    userDAO.update("tbl_admin", fullname, contact, user_id);
                }
                userDAO.updateUser(user_id, password, role, gmail);

            } else if (action.equals("delete")) {
                if (role.equals("customer")) {
                    userDAO.delete("tbl_customer", user_id);
                } else if (role.equals("trainer")) {
                    userDAO.delete("tbl_trainer", user_id);
                } else if (role.equals("staff")) {
                    userDAO.delete("tbl_staff", user_id);
                } else if (role.equals("admin")) {
                    userDAO.delete("tbl_admin", user_id);
                }
                userDAO.deleteUser(user_id);
            } else if (action.equals("cancel")) {

            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("Admin_listAccount.jsp");
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
            Logger.getLogger(UpdateAccount.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdateAccount.class.getName()).log(Level.SEVERE, null, ex);
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