/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BlogDAO;
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
public class AddBlogServlet extends HttpServlet {

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
                String title = request.getParameter("title");
        String date = request.getParameter("date");
        String author = request.getParameter("author");
        String briefinfo = request.getParameter("briefinfo");
        String introduction = request.getParameter("introduction");
        String content1 = request.getParameter("content1");
        String content2 = request.getParameter("content2");
        Part thumbnailPart  = request.getPart("thumbnail");
        Part contentIMGPart = request.getPart("contentIMG");
        // validate thuymbnail
        String thumbnailFileName = thumbnailPart.getSubmittedFileName();
        InputStream thumbnailinputStream = thumbnailPart.getInputStream();
        String thumbnailBase64 = convertToBase64(thumbnailinputStream);
        
        // validate contentimg
        String contentIMGFileName = contentIMGPart.getSubmittedFileName();
        InputStream contentIMGinputStream = contentIMGPart.getInputStream();
        String contentIMGBase64 = convertToBase64(contentIMGinputStream);
        /*ValidateString(date) --> Time(date) */
        java.sql.Date dateSql = null;
        if (!date.isEmpty()) {
            dateSql = java.sql.Date.valueOf(date);
        } else {
            System.out.println("Error message with NumberFormatException");
        }

        BlogDAO dao = new BlogDAO();
        // generate id
       int blog_id = dao.GenerateBlogID();
       String blog_id_string = String.valueOf(blog_id);
        dao.CreateBlog(blog_id_string,dateSql , thumbnailBase64, title, author, introduction, content1, content2, contentIMGBase64, briefinfo);
        request.getRequestDispatcher("AddBlog.jsp").forward(request, response);
        
    
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
            Logger.getLogger(AddBlogServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddBlogServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddBlogServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddBlogServlet.class.getName()).log(Level.SEVERE, null, ex);
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
