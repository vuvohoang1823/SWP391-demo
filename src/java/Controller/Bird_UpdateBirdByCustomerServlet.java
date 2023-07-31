/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerBirdDAO;
import entity.BlogDTO;
import entity.CustomerBirdDTO;
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ASUS
 */
@MultipartConfig
@WebServlet(name = "Bird_UpdateBirdByCustomerServlet", urlPatterns = {"/Bird_UpdateBirdByCustomerServlet"})
public class Bird_UpdateBirdByCustomerServlet extends HttpServlet {

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

        String birdName = request.getParameter("birdName");
        String birdType = request.getParameter("birdType");
        String birdBirthday = request.getParameter("birdBirthday");
        String birdId = request.getParameter("birdId");
        Logger logger = Logger.getLogger(getClass().getName());
        logger.info("birdName : " + birdName);
        logger.info("birdType : " + birdType);
        logger.info("birdBirdDtae : " + birdBirthday);
        logger.info("birdId : " + birdId);
       
        // validate Date
        java.sql.Date dateSql = null;
        if (!birdBirthday.isEmpty()) {
            dateSql = java.sql.Date.valueOf(birdBirthday);
        } else {
            System.out.println("Error message with NumberFormatException");
        }
        // validate Bird IMG
        //   
        String BirdIMGPartData = request.getParameter("birdIMGDATA");
        Part BirdPart = request.getPart("birdImage");
        String BirdImgBase64 = null;
        if (BirdPart != null && BirdPart.getSize() > 0) {
            byte[] BirdBytes = convertPartToByteArray(BirdPart);
            BirdImgBase64 = Base64.getEncoder().encodeToString(BirdBytes);
        } else {
            BirdImgBase64 = BirdIMGPartData;
        }
        // 

        CustomerBirdDAO dao = new CustomerBirdDAO();
        CustomerBirdDTO updatedBird = new CustomerBirdDTO();
        updatedBird.setName(birdName);
        updatedBird.setBird_img(BirdImgBase64);
        updatedBird.setBirdDate(dateSql);
        updatedBird.setType_id(birdType);
        updatedBird.setBird_id(birdId);

        try {

            boolean updated = dao.UpdateBird(updatedBird);
            if (updated) {
                request.getRequestDispatcher("BirdProfileCustomer.jsp").forward(request, response);
//                response.sendRedirect("Staff_list_ofblog.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected String convertToBase64(byte[] data) {
        String base64String = Base64.getEncoder().encodeToString(data);
        return base64String;

    }

    protected byte[] convertPartToByteArray(Part part) throws IOException {
        if (part != null && part.getSize() > 0) {
            InputStream inputStream = part.getInputStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.close();
            inputStream.close();
            return outputStream.toByteArray();
        }
        return null;
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
