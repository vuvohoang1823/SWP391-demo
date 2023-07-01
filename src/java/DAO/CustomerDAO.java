/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.CustomerDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import DBUtils.DBUtils;

/**
 *
 * @author hoang
 */
public class CustomerDAO implements Serializable{
    
    public CustomerDTO getCustomerInfo(int user_id) throws SQLException, NamingException, ClassNotFoundException {
        
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CustomerDTO customer = null;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "Select customer_id, user_id, fullname, contact "
                        + "From tbl_customer "
                        + "Where user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, user_id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int customer_id = rs.getInt("user_id");
                    String fullName = rs.getString("fullname");
                    String contact = rs.getString("contact");
                    customer = new CustomerDTO(customer_id, user_id, fullName, contact);
                    System.out.println(customer);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return customer;
    }
    public int getCustomerID(int user_id) throws SQLException, NamingException, ClassNotFoundException {
        
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CustomerDTO customer = null;
        int customerID = 0;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "Select customer_id, user_id, fullname, contact "
                        + "From tbl_customer "
                        + "Where user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, user_id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    customerID = rs.getInt("customer_id");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return customerID ;
    }
    
}
