/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerDAO;
import DAO.TrainerDAO;
import DAO.UserDAO;
import entity.CustomerDTO;
import entity.Trainer;
import entity.TrainerSP;
import entity.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hoang
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private final String INDEX_PAGE = "Signin.jsp";
//    private final String SEARCH_PAGE = "search.html";
    private final String HOME_PAGE = "homepage.jsp";
    private final String ERROR = "error.jsp";

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
            throws ServletException, IOException, NamingException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String url = INDEX_PAGE;

        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");

        try {
            UserDAO dao = new UserDAO();
            UserDTO user = dao.checkLogin(username, password);
            // lay user_id de tim ra customer_id roi luu vao session
            if (user != null) {
                HttpSession session = request.getSession();

                //get role to render correct header
                session.setAttribute("role", user.getRole());
                ////////////////////////////////////

                //Phan quyen user dang nhap
                if (user.getRole().equals("customer")) {
                    CustomerDAO customerDAO = new CustomerDAO();
                    CustomerDTO customer = customerDAO.getCustomerInfo(user.getUser_id());
                    session.setAttribute("LOGIN_USER", customer);
                   url = HOME_PAGE;
                   
                } else if (user.getRole().equals("trainer")) {
                    // lay user_id de tim ra trainer_id roi luu vao session
                    TrainerDAO trainerdao = new TrainerDAO();
                    TrainerSP trainer = trainerdao.getTrainerInfo(user.getUser_id());
                    session.setAttribute("LOGIN_USER", trainer);
                    url = "Trainer_PrivateConsultation_List.jsp";
                     // url = "Trainer_Tracking";
                } else if (user.getRole().equals("staff")) {
                    session.setAttribute("LOGIN_USER", user);
                    //add thg staff de log out
                   url = "Staff_ConsultationForm_Pending.jsp";
               //   url="trainer_demo.jsp";
                  //  url = "staff_birdCourseForm.jsp";
                } else if (user.getRole().equals("admin")) {
                    url = "";
                }

                //store cookie dung de remember password
                Cookie cookie = new Cookie(username, password);
                cookie.setMaxAge(60 * 5);
                response.addCookie(cookie);
            } else {
                url = ERROR;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
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
        } catch (NamingException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (NamingException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
