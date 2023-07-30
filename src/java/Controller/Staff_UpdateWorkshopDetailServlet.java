/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.WorkshopDAO;
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
@WebServlet(name = "Staff_UpdateWorkshopDetailServlet", urlPatterns = {"/Staff_UpdateWorkshopDetailServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class Staff_UpdateWorkshopDetailServlet extends HttpServlet {

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
        String trainerID = request.getParameter("selected-trainer");
        String title = request.getParameter("title");
        Integer price = null;

        try {
            price = Integer.parseInt(request.getParameter("price"));
        } catch (NumberFormatException e) {
            System.out.println("Invalid price value: " + request.getParameter("price"));
            e.printStackTrace();
            return;
        }

        Part workshop_image = request.getPart("workshop_image");
        String end_enroll_date = request.getParameter("end_enroll_date");
        String start_date = request.getParameter("start_date");
        String content = request.getParameter("content");
        String sub_content_1 = request.getParameter("sub_content_1");
        String sub_content_2 = request.getParameter("sub_content_2");
        String sub_content_3 = request.getParameter("sub_content_3");
        String sub_content_4 = request.getParameter("sub_content_4");

        java.sql.Date dateSql1 = null;
        if (!end_enroll_date.isEmpty()) {
            dateSql1 = java.sql.Date.valueOf(end_enroll_date);
        } else {
            System.out.println("Error message with NumberFormatException");
        }

        java.sql.Date dateSql2 = null;
        if (!start_date.isEmpty()) {
            dateSql2 = java.sql.Date.valueOf(start_date);
        } else {
            System.out.println("Error message with NumberFormatException");
        }

        InputStream customer_imageInputStream = workshop_image.getInputStream();
        String workshop_imageBase64 = convertToBase64(customer_imageInputStream);

        try (PrintWriter out = response.getWriter()) {
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet1</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet1 at " + title + "</h1>");
            out.println("<h1>Servlet NewServlet1 at " + courseID + "</h1>");
            out.println("<h1>Servlet NewServlet1 at " + trainerID + "</h1>");
            out.println("<h1>Servlet NewServlet1 at " + price + "</h1>");
            out.println("<h1>Servlet NewServlet1 at " + dateSql1 + "</h1>");
            out.println("<h1>Servlet NewServlet1 at " + dateSql2 + "</h1>");
            out.println("<h1>Servlet NewServlet1 at " + content + "</h1>");
            out.println("<h1>Servlet NewServlet1 at " + sub_content_1 + "</h1>");
            out.println("<h1>Servlet NewServlet1 at " + sub_content_2 + "</h1>");
            out.println("<h1>Servlet NewServlet1 at " + sub_content_3 + "</h1>");
            out.println("<h1>Servlet NewServlet1 at " + sub_content_4 + "</h1>");
            
            
            
            WorkshopDAO workshopDAO = new WorkshopDAO();

            entity.service.Workshop workshop = new entity.service.Workshop();

            workshop.setCourseID(courseID);
            workshop.setTrainerID(trainerID);
            workshop.setTitle(title);
            workshop.setPrice(price);
            workshop.setImage(workshop_imageBase64);
            workshop.setEnd_enroll_date(dateSql1);
            workshop.setStart_date(dateSql2);
            workshop.setContent(content);
            workshop.setSub_content_1(sub_content_1);
            workshop.setSub_content_2(sub_content_2);
            workshop.setSub_content_3(sub_content_3);
            workshop.setSub_content_4(sub_content_4);
            workshop.setStaffID(request.getParameter("staffID"));
            workshop.setCategory(request.getParameter("category"));
            
            
            boolean a = workshopDAO.updateWorkshopImage(workshop_imageBase64, courseID);
            boolean b = workshopDAO.updateWorkshopInformation(trainerID, content, title, price, dateSql1, dateSql2, courseID);
            boolean c = workshopDAO.updateWorkshopSubContent(workshop);

            
            
            
            out.println("<h1>Servlet NewServlet1 at " + c + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            request.setAttribute("workshop_information", workshop);

            RequestDispatcher rd = request.getRequestDispatcher("Staff_ViewWorkshopDetailServlet");
            rd.forward(request, response);

        } catch (Exception ex) {
            System.out.println(ex);
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
