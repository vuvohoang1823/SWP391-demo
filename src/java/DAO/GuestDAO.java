/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.FormAppointmentDTO;
import entity.GuestDTO;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hoang
 */
public class GuestDAO implements Serializable {
    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();
    
    public void InputGuestForm(int id, String fullname, String email, String titleQ, String titleMess, Date submitDate)
            throws ClassNotFoundException, SQLException, IOException {
        String sql = "insert into tbl_Form_Guest(id,fullname,email,titleQ,titleMess,status,submitDate)\n"
                + "values(?,?,?,?,?,NULL,?)";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, fullname);
            ps.setString(3, email);
            ps.setString(4, titleQ);
            ps.setString(5, titleMess);
            ps.setDate(6, submitDate);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        
    }
    
    public int GenerateFormID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_Form_Guest WHERE id = (SELECT MAX(TRY_CAST(id AS INT))FROM tbl_Form_Guest)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXID = rs.getInt("id");
                newID = MAXID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return newID;
        
    }
    
    public List<GuestDTO> getAllFormList() throws ClassNotFoundException, SQLException, IOException {
        List<GuestDTO> list = new ArrayList<>();
        String sql = "select * from tbl_Form_Guest where status IS NULL";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                GuestDTO dto = new GuestDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7));
                list.add(dto);
                
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                ps.close();
            }
        }
        
        return list;
    }
    
    public GuestDTO getOneFormListbyID(String id) throws ClassNotFoundException, SQLException, IOException {
        
        String sql = "select * from tbl_Form_Guest where id = ? ";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String dateString = rs.getString(7); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                return new GuestDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        date);
                
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        
        return null;
    }
    
    public void updateAnswerForm(String answera, String id)
            throws SQLException, ClassCastException {
        
        String sql = "UPDATE tbl_Form_Guest\n"
                + "SET status = 'complete',\n"
                + "    answermessage = ?\n"
                + "WHERE id = ?";
        
        try {
            con = db.getConnection();
            // Update tbl_appointment
            ps = con.prepareStatement(sql);
            ps.setString(1, answera);
            ps.setString(2, id);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
    }

    public List<GuestDTO> getAllFormListCOMPLETED() throws ClassNotFoundException, SQLException, IOException {
        List<GuestDTO> list = new ArrayList<>();
        String sql = "select * from tbl_Form_Guest where status = 'complete'";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                GuestDTO dto = new GuestDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8));
                list.add(dto);
                
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                ps.close();
            }
        }
        
        return list;
    }

    public GuestDTO getOneFormListCompletebyID(String id) throws ClassNotFoundException, SQLException, IOException {
        
        String sql = "select * from tbl_Form_Guest where id = ?  and status = 'complete'";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String dateString = rs.getString(7); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                return new GuestDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        date,
                        rs.getString(8));
                
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        
        return null;
    }
    
}
