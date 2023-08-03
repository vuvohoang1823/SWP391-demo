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
import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author hoang
 */
public class UserDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

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

    public void addNewUser(int user_id, String username, String role, String gmail)
            throws ClassNotFoundException, SQLException, IOException {
        String sql = "insert into tbl_user(user_id , username, password, role, gmail)\n"
                + "values(?,?,'1',?,?) ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setString(2, username);
            ps.setString(3, role);
            ps.setString(4, gmail);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public int generateUserID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_user WHERE user_id = (SELECT MAX(TRY_CAST(user_id AS INT))FROM tbl_user)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXconsultationID = rs.getInt("user_id");
                newID = MAXconsultationID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;
    }

    public void deleteUser(int user_id) throws SQLException {
        String sql = "DELETE FROM tbl_user WHERE user_id = ?;";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void delete(String table, int user_id) throws SQLException {
        String sql = "DELETE FROM " + table + " WHERE user_id = ?;";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void update(String table, String fullname, String contact, int user_id) throws SQLException {
        String sql = "update " + table + " set fullname=?, contact=? "
                + "where user_id=?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, contact);
            ps.setInt(3, user_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void updateUser(int user_id, String password, String role, String gmail) throws SQLException {
        String sql = "update tbl_user set password=?, role=?, gmail=? "
                + "where user_id=?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, role);
            ps.setString(3, gmail);
            ps.setInt(4, user_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public List getAllAccount() throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        String sql = "SELECT u.user_id, u.username, COALESCE(c.fullname, t.fullname, a.fullname, s.fullname) AS fullname, u.role\n"
                + "FROM tbl_user u\n"
                + "LEFT JOIN tbl_customer c ON u.user_id = c.user_id\n"
                + "LEFT JOIN tbl_trainer t ON u.user_id = t.user_id\n"
                + "LEFT JOIN tbl_admin a ON u.user_id = a.user_id\n"
                + "LEFT JOIN tbl_staff s ON u.user_id = s.user_id;";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO user = new UserDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public UserDTO getAccountByID(int user_id) throws SQLException {
        UserDTO user = null;
        String sql = "SELECT u.user_id, u.username, u.password, u.role, u.gmail,\n"
                + "       COALESCE(c.fullname, t.fullname, s.fullname, a.fullname) AS fullname,\n"
                + "       COALESCE(c.contact, t.contact, s.contact, a.contact) AS contact\n"
                + "FROM tbl_user u\n"
                + "LEFT JOIN tbl_customer c ON c.user_id = u.user_id\n"
                + "LEFT JOIN tbl_trainer t ON t.user_id = u.user_id\n"
                + "LEFT JOIN tbl_staff s ON s.user_id = u.user_id\n"
                + "LEFT JOIN tbl_admin a ON a.user_id = u.user_id\n"
                + "WHERE u.user_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new UserDTO(rs.getInt(1), rs.getString(2), rs.getString(6), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(7));
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return user;
    }

    public void addNewStaff(int user_id, int staff_id, String fullname, String contact) {
        String sql = "insert into tbl_staff(staff_id, user_id, fullname, contact) values(?,?,?,?)";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, staff_id);
            ps.setInt(2, user_id);
            ps.setString(3, fullname);
            ps.setString(4, contact);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public int generateStaffID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_staff WHERE staff_id = (SELECT MAX(TRY_CAST(staff_id AS INT))FROM tbl_staff)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXconsultationID = rs.getInt("staff_id");
                newID = MAXconsultationID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;
    }

    public void addNewAdmin(int user_id, int admin_id, String fullname, String contact) {
        String sql = "insert into tbl_admin(admin_id, user_id, fullname, contact) values(?,?,?,?)";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, admin_id);
            ps.setInt(2, user_id);
            ps.setString(3, fullname);
            ps.setString(4, contact);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public int generateAdminID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_admin WHERE admin_id = (SELECT MAX(TRY_CAST(admin_id AS INT))FROM tbl_admin)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXconsultationID = rs.getInt("admin_id");
                newID = MAXconsultationID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;
    }

    public UserDTO getUserInfo(int customer_id) {
        UserDTO user = null;
        String sql = "SELECT u.user_id, u.gmail\n"
                + "FROM tbl_user AS u\n"
                + "INNER JOIN tbl_customer AS c ON u.user_id = c.user_id\n"
                + "WHERE c.customer_id = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, customer_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                user = new UserDTO(rs.getInt(1), rs.getString(2));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return user;
    }

    public String getUserEmail(int user_id) {
        String sql = "SELECT gmail FROM tbl_user WHERE user_id = ?";
        String email = "";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                email = rs.getString(1);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return email;
    }
}
