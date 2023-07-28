/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.FormApppointmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Properties;
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
@WebServlet(name = "ConsultationUpdatePending", urlPatterns = {"/ConsultationUpdatePending"})
public class ConsultationUpdatePending extends HttpServlet {

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
        String action = request.getParameter("action");

        if (action.equals("approve")) {

            String email = request.getParameter("email_email");
            String fullname = request.getParameter("fullname");
            String date = request.getParameter("date");
            String duration = request.getParameter("duration");

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
                    message.setSubject("Update about your Private Consultation request");
//                message.setText(messages);
                    String htmlContent = "";
                    htmlContent += "<h1>Your Private Consultation has been approved - Bird Training Center</h1>\n";
                    htmlContent += "<p>Dear ," + fullname + "</p>\n\n";
                    htmlContent += "<p>We are pleased to inform you that your request for a private consultation regarding the bird training system has been approved. We value your interest and commitment to enhancing your bird's training skills, and we are dedicated to providing you with the best guidance and support.</p>\n\n";
                    htmlContent += "<h2>Consultation Details:</h2>\n";
                    htmlContent += "<table border='1'>\n";
                    htmlContent += "<tr>\n";
                    htmlContent += "<th>Field</th>\n";
                    htmlContent += "<th>Value</th>\n";
                    htmlContent += "</tr>\n";
                    htmlContent += "<tr>\n";
                    htmlContent += "<td>Date</td>\n";
                    htmlContent += "<td> " + date + "</td>\n";
                    htmlContent += "</tr>\n";
                    htmlContent += "<tr>\n";
                    htmlContent += "</tr>\n";
                    htmlContent += "<tr>\n";
                    htmlContent += "<td>Duration </td>\n";
                    htmlContent += "<td>" + duration + "</td>\n";
                    htmlContent += "</tr>\n";
                    htmlContent += "</table>\n\n";
                    htmlContent += "<p>Our expert bird trainers are looking forward to discussing your specific training needs and providing personalized solutions to help you achieve your desired goals. During the consultation, you can expect to receive valuable insights, training techniques, and answers to any questions you may have.</p>\n\n";
                    htmlContent += "<p>To ensure a successful consultation, please make sure you are prepared with any specific information or concerns you would like to discuss. It's also recommended to have a quiet and comfortable environment to minimize distractions during the session.</p>\n\n";
                    htmlContent += "<p>If, for any reason, you are unable to attend the scheduled consultation, please let us know at least [Cancellation Notice Period] in advance, so we can reschedule your session accordingly.</p>\n\n";
                    htmlContent += "<p>We are confident that this private consultation will greatly benefit you and your bird's training journey. Should you have any further queries or require assistance, please feel free to contact our customer support team.</p>\n\n";
                    htmlContent += "<p>Thank you for choosing our bird training system and giving us the opportunity to assist you in achieving remarkable training results. We look forward to meeting you during the consultation.</p>\n\n";
                    htmlContent += "<p>Best regards,</p>\n";
                    htmlContent += "<p>Bird Training System <br>Best Gard <br>Contact Information : 0343380437</p>\n";

                    message.setContent(htmlContent, "text/html");
                    Transport.send(message);

                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
            }

            String consultationId = request.getParameter("consultationId");
            String TrainerID = request.getParameter("selected-trainer");
            String RequestTrainerID = request.getParameter("selected-trainer");
            // Create an instance of your DAO
            FormApppointmentDAO dao = new FormApppointmentDAO();
            try {
                dao.updateAppointmentForm(consultationId, TrainerID, RequestTrainerID);
                response.sendRedirect("Staff_ConsultationForm_Pending.jsp");
            } catch (SQLException | IOException ex) {
                ex.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else if (action.equals("deny")) {
            String consultationId = request.getParameter("consultationId");
            FormApppointmentDAO dao = new FormApppointmentDAO();
            try {
                dao.updateAppointmentFormDeny(consultationId);
                response.sendRedirect("Staff_ConsultationForm_Pending.jsp");
            } catch (SQLException | IOException ex) {
                ex.printStackTrace();
                response.sendRedirect("error.jsp");
            }

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
