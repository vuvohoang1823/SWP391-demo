/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.StaffDTO;
import entity.TrainerSP;
import entity.UserDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author hoang
 */
public class UserDAO implements Serializable {

    public UserDTO checkLogin(String username, String password)
            throws SQLException, NamingException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO user = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select user_id, username, role "
                        + "From tbl_user "
                        + "Where username = ? and password = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int user_id = rs.getInt("user_id");
                    String role = rs.getString("role");
                    user = new UserDTO(user_id, username, null, role);
                    System.out.println(user);
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
        return user;
    }

    private List<UserDTO> accountList;

    public List<UserDTO> getAccountList() {
        return accountList;
    }
    
    
     public StaffDTO getStaffInfo(int user_id) throws SQLException, NamingException, ClassNotFoundException {

//        (String trainer_id, String user_id, String fullname, String achievement, String status, String contact)
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
       StaffDTO staff = null;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "select * from tbl_user where user_id =?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, user_id);
                rs = stm.executeQuery();
                if (rs.next()) {
//                    
                    staff = new StaffDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                   
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
        return staff;
    }
}
