/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.courseDAO;
import entity.Course;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoang
 */
public class MainController extends HttpServlet {
    private final String TRIGGER_APP_CONTROLLER = "TriggerAppServlet";
    private final String LOGIN_CONTROLLER = "LoginServlet";
    private final String LOGIN_PAGE = "signin.jsp";
    private final String FORMAPPOINTMENT_PAGE = "formAppointment.jsp";
    private final String FORMAPPOINTMENTSERVLET = "formappointment";
    private final String FORMSUCCESS = "formsuccess.jsp"  ;
    private final String FORMBIRDCOURSE = "";

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
           //1 get data form dao 
//       courseDAO dao = new courseDAO();
//       List<Course> list = dao.getAllCourse();
//       List<Course> listTop3BirdCourse = dao.getTop3BirdCourse();
//       //2set data to jsp
//      request.setAttribute("AllCOurse", list);
//      request.setAttribute("GetTop3BirdCourse",listTop3BirdCourse );   
//      request.getRequestDispatcher("homepage.jsp").forward(request, response);
      String button = request.getParameter("action");
      String url= "homepage.jsp";
      
      
       try {
            if (button == null) {
                url = "homepage.jsp";
            } else if (button.equals("Login")) {
                url = LOGIN_CONTROLLER;
            } else if (button.equals("Fill form to book")) {
                url = FORMAPPOINTMENT_PAGE;
            } else if (button.equals("Submit Form")) {
                url = FORMAPPOINTMENTSERVLET;
            } else if (button.equals("calculate")) {
                url = "PaymentForConsultationServlet";
            }else if (button.equals("view_form_detail")) {
                url = "viewFormDetailServlet";
            } else if (button.equals("browse_form")) {
                url = "browseFormServlet";
            } else if (button.equals("payment_consultation")) {
                System.out.println("MainContriller right here");
                url = "paymentConsultationServlet";
            } else if (button.equals("view_workshop_detail")) {
                url = "ViewWorkshopDetailServlet";
            } else if (button.equals("payment_workshop")) {
                url = "PaymentOfWorkshopServlet";
            } else if (button.equals("view_online_course_detail")) {
                url = "ViewOnlineCourseDetailServlet";
            } else if (button.equals("payment_online_course")) {
                url = "PaymentForOnlineCourseServlet";
            } 
            }finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
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
