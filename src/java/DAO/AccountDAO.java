/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.Account;
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
        };
        return 0;
    }

    //Function to  generate User-ID
    public int GenerateUser_ID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "		 SELECT * FROM tbl_user WHERE user_id = (SELECT MAX(TRY_CAST(user_id AS INT))FROM tbl_user)";
        int new_user_Id = 0;
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
        int new_customer_Id = 0;
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

    public Account checkAcc(String gmail, String username) throws ClassNotFoundException, SQLException {
        String sql = "	select * from tbl_user where username = ? or  gmail =? ";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, gmail);
            ps.setString(2, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return null;

    }

    public boolean isUsernameTaken(String username) throws ClassNotFoundException, SQLException {

        String sql = "SELECT COUNT(*) FROM tbl_user WHERE username = ? ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean isEmailTaken(String email) throws ClassNotFoundException, SQLException {

        String sql = "SELECT COUNT(*) FROM tbl_user WHERE gmail = ? ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
