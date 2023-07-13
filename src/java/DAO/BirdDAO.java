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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hoang
 */
public class BirdDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public void addNewBird(int bird_id, String bird_name, String bird_type)
            throws ClassNotFoundException, SQLException, IOException {
        String sql = "insert into tbl_bird(bird_id , name, type)\n"
                + "values(?,?,?) ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, bird_id);
            ps.setString(2, bird_name);
            ps.setString(3, bird_type);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public int generateBirdID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_bird WHERE bird_id = (SELECT MAX(TRY_CAST(bird_id AS INT))FROM tbl_bird)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXconsultationID = rs.getInt("bird_id");
                newID = MAXconsultationID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;
    }
}
