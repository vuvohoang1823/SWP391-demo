/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

/**
 *
 * @author hoang
 */
public class AccountDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public int Registration(int user_id, String username, String password, String gmail, int customer_id, String fullName, String contact)
            throws ClassNotFoundException, SQLException, IOException {

        //Update in tbl_user
        String sql_user = "INSERT INTO tbl_user (user_id, username, password, role , gmail) \n"
                + "                   VALUES (?, ?,?,'customer',?); ";
        //Update in tbl_customer
        String sql_customer = "INSERT INTO tbl_customer (customer_id, user_id, fullName, contact,img) \n"
                + "                 VALUES (?, ?, ?,?,NULL );";

        try {
            con = db.getConnection();

            //Update in tbl_user
            ps = con.prepareStatement(sql_user);
            ps.setInt(1, user_id);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, gmail);
            ps.executeUpdate();

            //Update in tbl_customer
            ps = con.prepareStatement(sql_customer);
            ps.setInt(1, customer_id);
            ps.setInt(2, user_id);
            ps.setString(3, fullName);
            ps.setString(4, contact);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } ;
        return 0;
    }
    
    //Function to  generate User-ID
    public int GenerateUser_ID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "		 SELECT * FROM tbl_user WHERE user_id = (SELECT MAX(TRY_CAST(user_id AS INT))FROM tbl_user)";
       int new_user_Id = 0 ;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXuserID = rs.getInt("user_id");
                 new_user_Id = MAXuserID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return new_user_Id;

    }
    
      //Function to  generate User-ID
    public int GenerateCustomer_ID() throws ClassNotFoundException, SQLException, IOException {
        String sql = " SELECT * FROM tbl_customer WHERE customer_id = (SELECT MAX(TRY_CAST(customer_id AS INT))FROM tbl_customer)";
       int new_customer_Id = 0 ;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXcustomerID = rs.getInt("customer_id");
                 new_customer_Id = MAXcustomerID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return new_customer_Id;

    }
    
}
