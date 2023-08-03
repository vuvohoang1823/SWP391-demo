/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.WorkshopDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Properties;
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
 * @author LAPTOP
 */
@WebServlet(name = "Staff_Workshop_Award_CertificateServlet", urlPatterns = {"/Staff_Workshop_Award_CertificateServlet"})
public class Staff_Workshop_Award_CertificateServlet extends HttpServlet {

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
        String email = request.getParameter("gmail");
        String logoUrl = "https://i.ibb.co/fkb8rYP/349252733-767865025124137-1990273265293346631-n.png";
        String customer_fullname = request.getParameter("customer_fullname");
        String title = request.getParameter("workshop_title");

        HttpSession mySession = request.getSession();
        // set current time
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedTime = currentTime.format(formatter);
        //
        if (email != null || !email.equals("")) {

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
                String subject = "Congratulations, Your Certificate is Ready!";
                String htmlContent = "<!DOCTYPE html>\n"
                        + "<html>\n"
                        + "  <head>\n"
                        + "    <meta charset=\"UTF-8\" />\n"
                        + "    <title>Congratulations Email</title>\n"
                        + "    <style>\n"
                        + "      body {\n"
                        + "        width: 100%;\n"
                        + "        height: 100%;\n"
                        + "      }\n"
                        + "      .contain {\n"
                        + "        position: absolute;\n"
                        + "        top: 0;\n"
                        + "        left: 0;\n"
                        + "        width: 100%;\n"
                        + "        height: 100%;\n"
                        + "        background: linear-gradient(90deg, #189086, #2f8198);\n"
                        + "        background-image: linear-gradient(to bottom right, #02b3e4, #02ccba);\n"
                        + "      }\n"
                        + "\n"
                        + "      .done {\n"
                        + "        width: 100px;\n"
                        + "        height: 100px;\n"
                        + "        position: relative;\n"
                        + "        left: 0;\n"
                        + "        right: 0;\n"
                        + "        top: -20px;\n"
                        + "        margin: auto;\n"
                        + "      }\n"
                        + "      .contain h1 {\n"
                        + "        font-family: \"Julius Sans One\", sans-serif;\n"
                        + "        font-size: 1.4em;\n"
                        + "        color: #02b3e4;\n"
                        + "      }\n"
                        + "\n"
                        + "      .congrats {\n"
                        + "        position: relative;\n"
                        + "        left: 50%;\n"
                        + "        top: 50%;\n"
                        + "        max-width: 800px;\n"
                        + "        transform: translate(-50%, -50%);\n"
                        + "        width: 80%;\n"
                        + "        min-height: 300px;\n"
                        + "        max-height: 900px;\n"
                        + "        border: 2px solid white;\n"
                        + "        border-radius: 5px;\n"
                        + "        box-shadow: 12px 15px 20px 0 rgba(46, 61, 73, 0.3);\n"
                        + "        background-image: linear-gradient(to bottom right, #02b3e4, #02ccba);\n"
                        + "        background: #fff;\n"
                        + "        text-align: center;\n"
                        + "        font-size: 2em;\n"
                        + "        color: #189086;\n"
                        + "      }\n"
                        + "\n"
                        + "      .text {\n"
                        + "        position: relative;\n"
                        + "        font-weight: normal;\n"
                        + "        left: 0;\n"
                        + "        right: 0;\n"
                        + "        margin: auto;\n"
                        + "        width: 80%;\n"
                        + "        max-width: 800px;\n"
                        + "\n"
                        + "        font-family: \"Lato\", sans-serif;\n"
                        + "        font-size: 0.6em;\n"
                        + "      }\n"
                        + "\n"
                        + "      .circ {\n"
                        + "        opacity: 0;\n"
                        + "        stroke-dasharray: 130;\n"
                        + "        stroke-dashoffset: 130;\n"
                        + "        -webkit-transition: all 1s;\n"
                        + "        -moz-transition: all 1s;\n"
                        + "        -ms-transition: all 1s;\n"
                        + "        -o-transition: all 1s;\n"
                        + "        transition: all 1s;\n"
                        + "      }\n"
                        + "      .tick {\n"
                        + "        stroke-dasharray: 50;\n"
                        + "        stroke-dashoffset: 50;\n"
                        + "        -webkit-transition: stroke-dashoffset 1s 0.5s ease-out;\n"
                        + "        -moz-transition: stroke-dashoffset 1s 0.5s ease-out;\n"
                        + "        -ms-transition: stroke-dashoffset 1s 0.5s ease-out;\n"
                        + "        -o-transition: stroke-dashoffset 1s 0.5s ease-out;\n"
                        + "        transition: stroke-dashoffset 1s 0.5s ease-out;\n"
                        + "      }\n"
                        + "      .drawn svg .path {\n"
                        + "        opacity: 1;\n"
                        + "        stroke-dashoffset: 0;\n"
                        + "      }\n"
                        + "\n"
                        + "      .regards {\n"
                        + "        font-size: 0.7em;\n"
                        + "      }\n"
                        + "\n"
                        + "      @media (max-width: 600px) {\n"
                        + "        .congrats h1 {\n"
                        + "          font-size: 1.2em;\n"
                        + "        }\n"
                        + "\n"
                        + "        .done {\n"
                        + "          top: -10px;\n"
                        + "          width: 80px;\n"
                        + "          height: 80px;\n"
                        + "        }\n"
                        + "        .text {\n"
                        + "          font-size: 0.5em;\n"
                        + "        }\n"
                        + "        .regards {\n"
                        + "          font-size: 0.6em;\n"
                        + "        }\n"
                        + "      }\n"
                        + "\n"
                        + "      @media (max-width: 500px) {\n"
                        + "        .congrats h1 {\n"
                        + "          font-size: 1em;\n"
                        + "        }\n"
                        + "\n"
                        + "        .done {\n"
                        + "          top: -10px;\n"
                        + "          width: 70px;\n"
                        + "          height: 70px;\n"
                        + "        }\n"
                        + "      }\n"
                        + "\n"
                        + "      @media (max-width: 410px) {\n"
                        + "        .congrats h1 {\n"
                        + "          font-size: 1em;\n"
                        + "        }\n"
                        + "\n"
                        + "        .congrats .hide {\n"
                        + "          display: none;\n"
                        + "        }\n"
                        + "\n"
                        + "        .congrats {\n"
                        + "          width: 100%;\n"
                        + "        }\n"
                        + "\n"
                        + "        .done {\n"
                        + "          top: -10px;\n"
                        + "          width: 50px;\n"
                        + "          height: 50px;\n"
                        + "        }\n"
                        + "        .regards {\n"
                        + "          font-size: 0.55em;\n"
                        + "        }\n"
                        + "      }\n"
                        + "    </style>\n"
                        + "  </head>\n"
                        + "  <body>\n"
                        + "    <div class=\"contain\">\n"
                        + "      <div class=\"congrats\">\n"
                        + "        <h1>\n"
                        + "          <div class=\"logo-container\">\n"
                        + "            <img src=\"" + logoUrl + "\" alt=\"Your Logo\">\n"
                        + "          </div>\n"
                        + "        </h1>\n"
                        + "        <!-- The \"Congratulations\" heading -->\n"
                        + "        <h1>Congrat<span class=\"hide\">ulation</span>s !</h1>\n"
                        + "        <h1>Your Certificate is Ready</h1>\n"
                        + "\n"
                        + "        <!-- Text content -->\n"
                        + "        <div class=\"text\" style=\"text-align: left\">\n"
                        + "          <p>\n"
                        + "            Dear, " + customer_fullname+ "\n"
                        + "            <br />\n"
                        + "            Congratulations! You have successfully completed "+ title + " . On behalf of\n"
                        + "            workshop we are pleased to issue your official "+ title + " Certificate.\n"
                        + "          </p>\n"
                        + "          <p>\n"
                        + "            Now that you have earned your Certificate, why not share it with your\n"
                        + "            network?\n"
                        + "          </p>\n"
                        + "          <p>Keep it Up,</p>\n"
                        + "          <p>The Bird Training Center</p>\n"
                        + "        </div>\n"
                        + "      </div>\n"
                        + "    </div>\n"
                        + "\n"
                        + "    <!-- JavaScript code for adding a class after a delay -->\n"
                        + "    <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n"
                        + "    <script>\n"
                        + "      // JavaScript code here\n"
                        + "      $(window).on(\"load\", function () {\n"
                        + "        setTimeout(function () {\n"
                        + "          $(\".done\").addClass(\"drawn\");\n"
                        + "        }, 500);\n"
                        + "      });\n"
                        + "    </script>\n"
                        + "  </body>\n"
                        + "</html>";

                message.setSubject(subject);
                message.setContent(htmlContent, "text/html");
                Transport.send(message);

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        }

        String attendance_id = request.getParameter("attendance_id");

        WorkshopDAO dao = new WorkshopDAO();
        dao.AwardedCertificate(attendance_id);

        response.sendRedirect("Staff_OrderList_Workshop_Completed.jsp");
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
