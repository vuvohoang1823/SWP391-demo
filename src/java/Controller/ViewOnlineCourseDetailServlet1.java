/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CourseOnlineDAO;
import DAO.courseDAO;
import entity.Course;
import entity.service.CourseOnline;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import static java.util.Collections.list;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LAPTOP
 */
@WebServlet(name = "ViewOnlineCourseDetailServlet", urlPatterns = {"/ViewOnlineCourseDetailServlet"})
public class ViewOnlineCourseDetailServlet1 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String courseID = request.getParameter("courseID");

        try (PrintWriter out = response.getWriter()) {
            courseDAO course = new courseDAO();
            CourseOnlineDAO courseOnline = new CourseOnlineDAO();

            Course online_course_detail = null;

            online_course_detail = course.getCourseByID(courseID);
            List<CourseOnline> list = courseOnline.getDetailOnlineCourse(courseID);

            request.setAttribute("online_module", list);

            HttpSession session = request.getSession(true);
            session.setAttribute("online_course_detail", online_course_detail);

            RequestDispatcher rd = request.getRequestDispatcher("onlinecoursedetail.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            System.out.println(ex);
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
            Logger.getLogger(ViewOnlineCourseDetailServlet1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ViewOnlineCourseDetailServlet1.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ViewOnlineCourseDetailServlet1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ViewOnlineCourseDetailServlet1.class.getName()).log(Level.SEVERE, null, ex);
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
