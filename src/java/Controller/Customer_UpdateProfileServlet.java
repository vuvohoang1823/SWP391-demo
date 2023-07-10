/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerDAO;
import entity.CustomerDTO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.io.ByteArrayOutputStream;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
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
 * @author LAPTOP
 */
@WebServlet(name = "Customer_UpdateProfileServlet", urlPatterns = {"/Customer_UpdateProfileServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class Customer_UpdateProfileServlet extends HttpServlet {

    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NamingException, ClassNotFoundException {
        
        Part customer_image = request.getPart("customer_image");
        String fullname = request.getParameter("fullName");
        String contact = request.getParameter("contact");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        String customer_imageFileName = customer_image.getSubmittedFileName();
        InputStream customer_imageInputStream = customer_image.getInputStream();
        String customer_imageBase64 = convertToBase64(customer_imageInputStream);
        
        Integer userID = null;
            try {
            userID = Integer.parseInt(request.getParameter("userID"));
        } catch (NumberFormatException e) {
            System.out.println("Invalid userID value: " + request.getParameter("userID"));
        e.printStackTrace();
        return;
        }
        
        
        try (PrintWriter out = response.getWriter()) {
            CustomerDAO customerDAO = new CustomerDAO();
            int customerID = customerDAO.getCustomerID(userID);
            
            customerDAO.updateCustomerProfile(customer_imageBase64, fullname, contact, customerID);
            customerDAO.updateUserProfile(username, password, customerID);
            
            CustomerDTO customer = new CustomerDTO();
            customer.setImage(customer_imageBase64);
            customer.setFullName(fullname);
            customer.setContact(contact);
            customer.setUsername(username);
            customer.setPassword(password);
            
            request.setAttribute("customerInformation", customer);
            request.getRequestDispatcher("Customer_ViewProfileServlet").forward(request, response);
            
            
            
        }catch(Exception ex) {
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Customer_UpdateProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(Customer_UpdateProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Customer_UpdateProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(Customer_UpdateProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(Customer_UpdateProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Customer_UpdateProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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
