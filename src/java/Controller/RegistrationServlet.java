/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;
import DBUtils.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoang
 */
@WebServlet(name = "RegistrationServlet", urlPatterns = {"/RegistrationServlet"})
public class RegistrationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
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
        try{
            // Get new User_ID
            int user_id = dao.GenerateUser_ID();
            int customer_id = dao.GenerateCustomer_ID();    
            dao.Registration(user_id, username, password, email, customer_id, FULLNAME, contact);    
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
        }
            
       

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
