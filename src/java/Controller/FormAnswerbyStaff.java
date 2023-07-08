/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.GuestDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
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
@WebServlet(name = "FormAnswerbyStaff", urlPatterns = {"/FormAnswerbyStaff"})
public class FormAnswerbyStaff extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        if (action != null && action.equals("yes")) {
            String email = request.getParameter("email_email");
            String messages = request.getParameter("message_answer");
            String id = request.getParameter("formid");
            Logger logger = Logger.getLogger(getClass().getName());
            logger.info("******************************");
            logger.info("Email: " + email);
            logger.info("Message" + messages);
            logger.info("INFO" + id);
            logger.info("******************************");
            RequestDispatcher dispatcher = null;
            int otpvalue = 0;
            HttpSession mySession = request.getSession();

            // set current time
            LocalDateTime currentTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedTime = currentTime.format(formatter);
            //
            if (email != null || !email.equals("")) {
                //  String from = email;
                String to = email;
                // Get the session object
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
//                    String username = System.getenv("EMAIL_USERNAME");
//                    String password = System.getenv("EMAIL_PASSWORD");
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
//                message.setSubject("OTP from Bird Training Center");
//                message.setText(messages);
                    String htmlContent = "<h1>Email Details</h1>\n";
                    htmlContent += "<table border='1'>\n";
                    htmlContent += "<tr>\n";
                    htmlContent += "<th>Field</th>\n";
                    htmlContent += "<th>Value</th>\n";
                    htmlContent += "</tr>\n";
                    htmlContent += "<tr>\n";
                    htmlContent += "<td>Email</td>\n";
                    htmlContent += "<td>" + email + "</td>\n";
                    htmlContent += "</tr>\n";
                    htmlContent += "<tr>\n";
                    htmlContent += "<td>Message</td>\n";
                    htmlContent += "<td><textarea rows='5' cols='50' disabled style='background: white; color: black; font-weight: 700'>" + messages + "</textarea></td>\n";
                    htmlContent += "</tr>\n";
                    htmlContent += "<tr>\n";
                    htmlContent += "<td>Date Submitted</td>\n";
                    htmlContent += "<td>" + formattedTime + "</td>\n";
                    htmlContent += "</tr>\n";
                    htmlContent += "</table>";

                    message.setContent(htmlContent, "text/html");
                    Transport.send(message);

                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }

                GuestDAO dao = new GuestDAO();
                dao.updateAnswerForm(messages, id);
                dispatcher = request.getRequestDispatcher("Staff_QuestionAndAnswer_AnsweredList.jsp");
                dispatcher.forward(request, response);
                //request.setAttribute("status", "success");
            }

        } else {
            response.sendRedirect("Staff_QuestionAndAnswer_QuestionDetail.jsp");
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
            Logger.getLogger(FormAnswerbyStaff.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(FormAnswerbyStaff.class.getName()).log(Level.SEVERE, null, ex);
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
