/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BlogDAO;
import entity.BlogDTO;
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
 * @author hoang
 */
@MultipartConfig
@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

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
        String blogId = request.getParameter("blogId");
        String date = request.getParameter("date");
        //   String thumbnailBase64 = request.getParameter("thumbnail");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String introduction = request.getParameter("introduction");
        String content1 = request.getParameter("content1");
        String content2 = request.getParameter("content2");
        String inconclusion = request.getParameter("inconclusion");
        //   String contentIMGBase64 = request.getParameter("contentIMG");
        String briefinfo = request.getParameter("briefinfo");
        Logger logger = Logger.getLogger(getClass().getName());
        logger.info("*************************");
        logger.info("blogID: " + blogId);
        logger.info("Date : " + date);
        logger.info("title: " + title);
        logger.info("author" + author);
        logger.info("introduction: " + introduction);
        logger.info("content1 : " + content1);
        logger.info("content2 : " + content2);
        logger.info("inconslusion:  " + inconclusion);
        logger.info("breifinfo : " + briefinfo);
        logger.info("*************************");

        logger.info("*************************");
        logger.info("*************************");
        // change date(String )
        java.sql.Date dateSql = null;
        if (!date.isEmpty()) {
            dateSql = java.sql.Date.valueOf(date);
        } else {
            System.out.println("Error message with NumberFormatException");
        }
//         byte[] thumbnail = Base64.getDecoder().decode(thumbnailBase64);
//         byte[] contentIMG = Base64.getDecoder().decode(contentIMGBase64);
//        String thumbnailBase64String = convertToBase64(thumbnail);
//        String contentIMGBase64String = convertToBase64(contentIMG);
        // validate Part
//        Part thumbnailPart = request.getPart("thumbnail");
//        logger.info("thumbnail :" + thumbnailPart);
//        byte[] thumbnailBytes = convertPartToByteArray(thumbnailPart);
//        logger.info("thumbnail :" + thumbnailBytes);
//        String thumbnailBase64 = Base64.getEncoder().encodeToString(thumbnailBytes);
        // Retrieve the contentIMG file part

        Part thumbnailPart = request.getPart("thumbnail");
        byte[] thumbnailBytes = convertPartToByteArray(thumbnailPart);
        String thumbnailBase64 = Base64.getEncoder().encodeToString(thumbnailBytes);

        logger.info("thumbnail : " + thumbnailBase64);

        Part contentIMGPart = request.getPart("contentIMG");
        byte[] contentIMGBytes = convertPartToByteArray(contentIMGPart);
        String contentIMGBase64 = Base64.getEncoder().encodeToString(contentIMGBytes);

        logger.info("hello");
        logger.info("IMG CONTENT :" + contentIMGBase64);

        BlogDAO dao = new BlogDAO();

        BlogDTO updatedBlog = new BlogDTO();
        updatedBlog.setBlogid(blogId);
        updatedBlog.setDate(dateSql);
        updatedBlog.setThumbnail(thumbnailBase64);
        updatedBlog.setTitle(title);
        updatedBlog.setAuthor(author);
        updatedBlog.setIntroduction(introduction);
        updatedBlog.setContent1(content1);
        updatedBlog.setContent2(content2);
        updatedBlog.setInconclusion(inconclusion);
        updatedBlog.setContentIMG(contentIMGBase64);
        updatedBlog.setBriefinfo(briefinfo);
        //convert a blog

        try {

            boolean updated = dao.UpdateBlog(updatedBlog);
            if (updated) {
                response.sendRedirect("Staff_list_ofblog.jsp");
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
