/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CourseOnlineDAO;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Base64;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author LAPTOP
 */
@WebServlet(name = "Staff_OnlineCourse_CreateServlet", urlPatterns = {"/Staff_OnlineCourse_CreateServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class Staff_OnlineCourse_CreateServlet extends HttpServlet {

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

        String courseID = request.getParameter("courseID");
        String title = request.getParameter("title");
        Integer price = null;

        try {
            price = Integer.parseInt(request.getParameter("price"));
        } catch (NumberFormatException e) {
            System.out.println("Invalid price value: " + request.getParameter("price"));
            e.printStackTrace();
            return;
        }

        Part online_image = request.getPart("image");
        String content = request.getParameter("content");
        String module_name_1 = request.getParameter("module_name_1");
        String module_name_2 = request.getParameter("module_name_2");
        String module_name_3 = request.getParameter("module_name_3");
        String module_name_4 = request.getParameter("module_name_4");
        String module_name_5 = request.getParameter("module_name_5");
        String module_description_1 = request.getParameter("module_description_1");
        String module_description_2 = request.getParameter("module_description_2");
        String module_description_3 = request.getParameter("module_description_3");
        String module_description_4 = request.getParameter("module_description_4");
        String module_description_5 = request.getParameter("module_description_5");

        InputStream customer_imageInputStream = online_image.getInputStream();
        String online_imageBase64 = convertToBase64(customer_imageInputStream);

        try (PrintWriter out = response.getWriter()) {

            CourseOnlineDAO onlineDAO = new CourseOnlineDAO();
            onlineDAO.CreateOnlineCourseInfo(courseID, content, title, price);
            onlineDAO.CreateOnlineCourseImage(courseID, courseID, online_imageBase64);
            onlineDAO.CreateOnlineCourseModule(courseID, module_name_1, module_name_2, module_name_3, module_name_4, module_name_5, module_description_1, module_description_2, module_description_3, module_description_4, module_description_5);
            
            RequestDispatcher rd = request.getRequestDispatcher("Staff_Services_OnlineCourse.jsp");
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
