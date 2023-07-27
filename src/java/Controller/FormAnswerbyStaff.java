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
            String name = request.getParameter("name");
            String title = request.getParameter("title");
            String email = request.getParameter("email_email");
            String question = request.getParameter("message");
            String messages = request.getParameter("message_answer");
            String id = request.getParameter("formid");
            String logoUrl = "https://i.ibb.co/x2zY7tp/349202569-756064332968259-1701146171430647693-n.png";
            String companyName = "Bird Training Center";

            Logger logger = Logger.getLogger(getClass().getName());
            logger.info("******************************");
            logger.info("Email: " + email);
            logger.info("Message" + question);
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
                    message.setSubject("Response to question \"" + title + "\" from Bird Training Center");
//                message.setText(messages);
                    String htmlContent = "";
                    htmlContent += "<!DOCTYPE html>\n";
                    htmlContent += "<html>\n";
                    htmlContent += "<head>\n";
                    htmlContent += "  <meta charset=\"UTF-8\">\n";
                    htmlContent += "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n";
                    htmlContent += "  <title>Email Card</title>\n";
                    htmlContent += "  <style>\n";
                    htmlContent += "    /* Reset some default styles to ensure consistency */\n";
                    htmlContent += "    body {\n";
                    htmlContent += "      margin: 0;\n";
                    htmlContent += "      padding: 0;\n";
                    htmlContent += "      font-family: Arial, sans-serif;\n";
                    htmlContent += "      line-height: 1.6;\n";
                    htmlContent += "    }\n";
                    htmlContent += "    img {\n";
                    htmlContent += "      max-width: 100%;\n";
                    htmlContent += "      height: auto;\n";
                    htmlContent += "    }\n";
                    htmlContent += "    /* Card styles */\n";
                    htmlContent += "    .card {\n";
                    htmlContent += "      max-width: 600px;\n";
                    htmlContent += "      margin: 20px auto;\n";
                    htmlContent += "      border: 1px solid #ccc;\n";
                    htmlContent += "      border-radius: 8px;\n";
                    htmlContent += "      overflow: hidden;\n";
                    htmlContent += "      font-size: 20px;\n";
                    htmlContent += "    }\n";
                    htmlContent += "    .header {\n";
                    htmlContent += "      background-color: grey;\n";
                    htmlContent += "      padding: 20px;\n";
                    htmlContent += "      text-align: center;\n";
                    htmlContent += "    }\n";
                    htmlContent += "    .header h1 {\n";
                    htmlContent += "      margin: 0;\n";
                    htmlContent += "    }\n";
                    htmlContent += "    .content {\n";
                    htmlContent += "      padding: 20px;\n";
                    htmlContent += "    }\n";
                    htmlContent += "    .content p {\n";
                    htmlContent += "      margin: 0;\n";
                    htmlContent += "    }\n";
                    htmlContent += "  </style>\n";
                    htmlContent += "</head>\n";

                    htmlContent += "<body>\n";

                    htmlContent += "  <div class=\"card\">\n";
                    htmlContent += "    <!-- Header section -->\n";
                    htmlContent += "    <div class=\"header\">\n";
                    htmlContent += "      <img src=\"" + logoUrl + "\" alt=\"Your Logo\">\n";
                    htmlContent += "      <h1 style=\"color: white\">" + companyName + "</h1>\n";
                    htmlContent += "    </div>\n";
                    htmlContent += "    <!-- Content section -->\n";
                    htmlContent += "    <div class=\"content\">\n";
                    htmlContent += "      <h2>\n";
                    htmlContent += "        Dear " + name + ",\n";
                    htmlContent += "      </h2>\n";
                    htmlContent += "      <p>\n";
                    htmlContent += "        Date: " + formattedTime + "\n";
                    htmlContent += "      </p>\n";
                    htmlContent += "      <p>\n";
                    htmlContent += "        Your question: " + question + "\n";
                    htmlContent += "      </p>\n";
                    htmlContent += "      <p>\n";
                    htmlContent += "        Your answer from our staff: " + messages + "\n";
                    htmlContent += "      </p>\n";
                    htmlContent += "    </div>\n";
                    htmlContent += "  </div>\n";

                    htmlContent += "</body>\n";

                    htmlContent += "</html>\n";

                    message.setContent(htmlContent, "text/html");
                    Transport.send(message);

                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }

                GuestDAO dao = new GuestDAO();
                dao.updateAnswerForm(messages, id);
                dispatcher = request.getRequestDispatcher("Staff_QuestionAndAnswer_List.jsp");
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
