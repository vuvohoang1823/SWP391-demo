/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerBirdDAO;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "Bird_AddANewBirdByCustomerServlet", urlPatterns = {"/Bird_AddANewBirdByCustomerServlet"})
public class Bird_AddANewBirdByCustomerServlet extends HttpServlet {

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

        /*Bird Name*/
        String birdName = request.getParameter("birdName");
        /*BirdImage  */
        /*BirdType*/
        String birdType = request.getParameter("birdType");
        /*birdBirthday*/
        String birdBirthday = request.getParameter("birdBirthday");
        /* customerID*/
        String customerID = request.getParameter("customerID");
        // validate birdImage
        // tets
       Logger logger = Logger.getLogger(getClass().getName());
       logger.info("birdName :"+birdName);
       logger.info("birdType :"+birdType);
       logger.info("birdBirthDate :"+birdBirthday);
       logger.info("customerID :"+customerID);
       

        // tets
        
        
        Part birdImagePart = request.getPart("birdImage");
        String birdImageFileName = birdImagePart.getSubmittedFileName();
        InputStream birdImageinputStream = birdImagePart.getInputStream();
        String birdImageBase64 = convertToBase64(birdImageinputStream);
        // validate Date
        java.sql.Date dateSql = null;
        if (!birdBirthday.isEmpty()) {
            dateSql = java.sql.Date.valueOf(birdBirthday);
        } else {
            System.out.println("Error message with NumberFormatException");
        }

        CustomerBirdDAO dao = new CustomerBirdDAO();
        // validate bird id
        String bird_id = String.valueOf(dao.GenerateBirdId());

        // insert bird
        dao.InsertNewBird(bird_id, birdName, customerID, birdImageBase64, dateSql, birdType);
        request.getRequestDispatcher("Customer_BirdList.jsp").forward(request, response);
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
            Logger.getLogger(Bird_AddANewBirdByCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Bird_AddANewBirdByCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Bird_AddANewBirdByCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Bird_AddANewBirdByCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
