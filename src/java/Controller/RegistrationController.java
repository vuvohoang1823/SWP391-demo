/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;

import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.SystemFlavorMap;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
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
            throws ServletException, IOException, ClassNotFoundException, SQLException, AddressException, MessagingException {

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
            //Start to set parameter
            // "Fullname"
//            request.setAttribute("fullname_params", FULLNAME);
//            // "email"
//            request.setAttribute("email_params", email);
//            // "contact"
//            request.setAttribute("contact_params", contact);
//            // "username"
//            request.setAttribute("username_paramas", username);
//            // "password"
//            request.setAttribute("password_params", password);
//            // End to set Parameter

            // ******************************************************************************
            // @@@@@send otp
            RequestDispatcher dispatcher = null;
            int otpvalue = 0;
            HttpSession mySession = request.getSession();
            if (email != null || !email.equals("")) {
                // sending otp
                Random rand = new Random();
                otpvalue = rand.nextInt(1255650);

                String to = email;// change accordingly
                // Get the session object
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("hoangnam1772004@gmail.com", "lrgcuihkpszkyjrx");// Put your email
                        // id and
                        // password here
                    }
                });
                // compose message
                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email));// change accordingly
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject("Hello");
                    message.setText("your OTP is: " + otpvalue);
                    // send message
                    Transport.send(message);
                    System.out.println("message sent successfully");
                } catch (MessagingException e) {
                    throw new RuntimeException(e);

                }
                request.setAttribute("message", "OTP is sent to your email id");
            }
            dispatcher = request.getRequestDispatcher("EnterOTPregister.jsp");
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
            // fullname 
            mySession.setAttribute("fullname_params", FULLNAME);
            // "email"
            mySession.setAttribute("email_params", email);
            // "contact"
            mySession.setAttribute("contact_params", contact);
            // "username"
            mySession.setAttribute("username_paramas", username);
            // "password"
            mySession.setAttribute("password_params", password);
            // End to set Parameter
            dispatcher.forward(request, response);
            //@@@@@@ end senmd otp
            // ******************************************************************************
            //     request.getRequestDispatcher("EnterOTPregister.jsp").forward(request, response);
            //  request.getRequestDispatcher("EnterOtpRegister.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
//dao.Registration(user_id, username, password, email, customer_id, FULLNAME, contact);
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
        } catch (MessagingException ex) {
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
        } catch (MessagingException ex) {
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
