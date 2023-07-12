/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.courseDAO;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Base64;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author hoang
 */
@WebServlet(name = "UpdateCourse", urlPatterns = {"/UpdateCourse"})
public class UpdateCourse extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        courseDAO courseDAO = new courseDAO();
        try {
            if (action.equals("update")) {
                String title = request.getParameter("title");
                String oldCategory = request.getParameter("category");
                String content = request.getParameter("content");
                int price = Integer.parseInt(request.getParameter("price"));
                int duration = Integer.parseInt(request.getParameter("duration"));

                Part image = request.getPart("thumbnail");
                String thumbnailFileName = image.getSubmittedFileName();
                InputStream thumbnailinputStream = image.getInputStream();
                String thumbnailBase64 = convertToBase64(thumbnailinputStream);

                courseDAO.UpdateBirdCourse(course_id, content, title, price, duration);
                courseDAO.UpdateBirdCourseImg(course_id, thumbnailBase64);

            } else if (action.equals("delete")) {
                courseDAO.deleteCourse(course_id);
            } else if (action.equals("cancel")) {

            }

        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("Staff_Services_BirdCourse.jsp");
            rd.forward(request, response);
        }
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