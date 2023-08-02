/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BookingDAO;
import DAO.CustomerDAO;
import DAO.TrainerDAO;
import DAO.UserDAO;
import entity.BookingDTO;
import entity.CustomerDTO;
import entity.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoang
 */
@WebServlet(name = "SetTrainerToBooking", urlPatterns = {"/SetTrainerToBooking"})
public class SetTrainerToBooking extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException, NamingException {
        response.setContentType("text/html;charset=UTF-8");

//        int bird_id = Integer.parseInt(request.getParameter("bird_id"));
        int booking_id = Integer.parseInt(request.getParameter("booking_id"));
        String action = request.getParameter("action");

        try {
            BookingDAO bookingDAO = new BookingDAO();
            CustomerDAO customerDAO = new CustomerDAO();
            if (action.equals("approve")) {
                int trainer_id = Integer.parseInt(request.getParameter("selected-trainer"));
                bookingDAO.setTrainerToBooking(trainer_id, booking_id);

                TrainerDAO trainerDAO = new TrainerDAO();
                trainerDAO.setTrainerUnavailable(trainer_id);

                BookingDTO booking = bookingDAO.getBookingByBirdID(booking_id);
                int customer_id = Integer.parseInt(booking.getCustomerID());

                UserDAO userDAO = new UserDAO();
                UserDTO user = userDAO.getUserInfo(customer_id);
                
                CustomerDTO customer = customerDAO.getCustomerInfo(user.getUser_id());
                
                String fullname = customer.getFullName();
                String email = user.getGmail();

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
                    message.setSubject("Update about your Booking request");
//                message.setText(messages);
                    String htmlContent = "";
                    htmlContent += "<h1>Your Booking has been approved - Bird Training Center</h1>\n";
                    htmlContent += "<p>Dear," + fullname + "</p>\n\n";
                    htmlContent += "<p>We are pleased to inform you that your request for a bird training has been approved. We value your interest and commitment to enhancing your bird's training skills, and we are dedicated to providing you with the best guidance and support.</p>\n\n";
                    htmlContent += "<h2>Booking Details:</h2>\n";
                    htmlContent += "<h3>Bird name: " + booking.getNameBird() + "</h3>\n";
                    htmlContent += "<h3>Bird type: " + booking.getTypeBird()+ "</h3>\n";
                    htmlContent += "<h3>Trainer assigned: " + booking.getTrainerName()+ "</h3>\n";
                    htmlContent += "<h3>Booking created date: " + booking.getCreate_date()+ "</h3>\n";
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

            } else if (action.equals("deny")) {
                bookingDAO.denyBooking(booking_id);
            }
        } finally {
            response.sendRedirect("staff_birdCourseForm_pending.jsp");
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
            Logger.getLogger(SetTrainerToBooking.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SetTrainerToBooking.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(SetTrainerToBooking.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SetTrainerToBooking.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SetTrainerToBooking.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(SetTrainerToBooking.class.getName()).log(Level.SEVERE, null, ex);
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