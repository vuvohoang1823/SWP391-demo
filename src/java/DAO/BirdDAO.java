/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.BirdDTO;
import entity.Course;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

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

    public List getBirdOfCustomerByType(int customer_id, String type) throws IOException {
        List<BirdDTO> listBird = new ArrayList<>();
        String sql = "SELECT \n"
                + "    b.bird_id,\n"
                + "    b.name AS bird_name,\n"
                + "    bt.type_name,\n"
                + "    b.bird_img AS img\n"
                + "FROM tbl_bird AS b\n"
                + "INNER JOIN tbl_bird_type AS bt ON b.type_id = bt.type_id\n"
                + "WHERE b.customer_id = ? AND bt.type_name = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, customer_id);
            ps.setString(2, type);
            rs = ps.executeQuery();
            while (rs.next()) {
                String base64Image = null;
                Blob blob = rs.getBlob("img");
                if (blob != null) {
                    InputStream inputStream = blob.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imageBytes = outputStream.toByteArray();
                    base64Image = Base64.getEncoder().encodeToString(imageBytes);
                    inputStream.close();
                    outputStream.close();
                } else {
                    base64Image = "default";
                }
                BirdDTO bird = new BirdDTO(rs.getString(1), rs.getString(2), rs.getString(3), base64Image);
                listBird.add(bird);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return listBird;
    }

    public List getAllBirds() throws IOException {
        List<BirdDTO> listBird = new ArrayList<>();
        String sql = "SELECT \n"
                + "    b.bird_id,\n"
                + "    b.name AS bird_name,\n"
                + "    bt.type_name,\n"
                + "    b.bird_img AS img,\n"
                + "    b.birthDate,\n"
                + "    c.fullname AS customer_fullname\n"
                + "FROM tbl_bird AS b\n"
                + "INNER JOIN tbl_bird_type AS bt ON b.type_id = bt.type_id\n"
                + "INNER JOIN tbl_customer AS c ON b.customer_id = c.customer_id";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String base64Image = null;
                Blob blob = rs.getBlob("img");
                if (blob != null) {
                    InputStream inputStream = blob.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imageBytes = outputStream.toByteArray();
                    base64Image = Base64.getEncoder().encodeToString(imageBytes);
                    inputStream.close();
                    outputStream.close();
                } else {
                    base64Image = "default";
                }
                BirdDTO bird = new BirdDTO(rs.getString(1), rs.getString(2), rs.getString(3), base64Image, rs.getString(5), rs.getString(6));
                listBird.add(bird);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return listBird;
    }

    public List getAllBirdTypes() throws IOException {
        List<BirdDTO> listBird = new ArrayList<>();
        String sql = "select type_id, type_name from tbl_bird_type";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BirdDTO bird = new BirdDTO(rs.getString(1), rs.getString(2));
                listBird.add(bird);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return listBird;
    }

}
