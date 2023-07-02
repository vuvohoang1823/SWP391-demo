/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BookingDAO;
import entity.BookingDTO;
import entity.CustomerDTO;
import entity.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.security.pkcs11.wrapper.Functions;

/**
 *
 * @author hoang
 */
@WebServlet(name = "MyCourse", urlPatterns = {"/MyCourse"})
public class MyCourse extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(MyCourse.class.getName());

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
        response.setContentType("text/html;charset=UTF-8");
          try (PrintWriter out = response.getWriter()) {
        HttpSession session = request.getSession();
        int userID = 0;  // Initialize userID as null
        // Retrieve userID from the session attribute "LOGIN_USER"
        Object loginAttribute = session.getAttribute("LOGIN_USER");
        if (loginAttribute instanceof CustomerDTO) {
            CustomerDTO customer = (CustomerDTO) loginAttribute;
            userID = customer.getCustomer_id();
        }


        BookingDAO dao = new BookingDAO() ; 
        List<BookingDTO> booking = dao.getAllCourseEnrolledbyID(userID);
        
        
        

//        List<BookingDTO> myCourses = new ArrayList<>();
//        int userID = 0;
//        try{
//            HttpSession session = request.getSession();
//            Object loginAttribute = session.getAttribute("LOGIN_USER");
//            
//            if(loginAttribute instanceof UserDTO){
//                UserDTO user = (UserDTO) loginAttribute;
//                userID  = user.getUser_id();
//            LOGGER.log(Level.INFO, "User ID: {0}", userID);
//            }
//       
//
//            }catch(Exception ex){
//       LOGGER.log(Level.SEVERE, "An error occurred in MyCourse servlet.", ex);        
//                  }
//            String userIDString = null ;
//              if(userID!=0){
//             userIDString = String.valueOf(userID);  // Using String.valueOf()
//            }else{
//                System.out.println("javalangNumberexception");
//            }
          
//       if(userIDString != null){
//          for(BookingDTO bookingDTO : booking){
//              if(userIDString.equals(bookingDTO.getCustomerID())){
//                  myCourses.add(bookingDTO);
//              }
//          }
//      }
        request.setAttribute("MYCOURSE", booking);
        request.getRequestDispatcher("mycourse.jsp").forward(request, response);
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
            Logger.getLogger(MyCourse.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MyCourse.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(MyCourse.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MyCourse.class.getName()).log(Level.SEVERE, null, ex);
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
