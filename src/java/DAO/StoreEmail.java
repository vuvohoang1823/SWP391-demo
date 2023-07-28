/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.BlogDTO;
import entity.StoreEmailDTO;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class StoreEmail {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public void CreateBlog(String id, String gmail) {
        String sql = "insert into tbl_StoreEmail (id , gmail , status ) \n"
                + "values (  ? ,? , 'S1')";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, gmail);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
     public int GenerateEmailID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_StoreEmail WHERE id = (SELECT MAX(TRY_CAST(id AS INT))FROM tbl_StoreEmail)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXId = rs.getInt("id");
                newID = MAXId + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;

    }
       public List<StoreEmailDTO> getListofEmail() throws IOException, SQLException, ClassNotFoundException {
        List<StoreEmailDTO> list = new ArrayList<>();
        String sql = "select * from tbl_StoreEmail";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
               StoreEmailDTO dto = new StoreEmailDTO(rs.getString(1),rs.getString(2),rs.getString(3));
               list.add(dto);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            // Close the resources (connection, statement, result set) in the appropriate order
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

     
     
     
     
}
