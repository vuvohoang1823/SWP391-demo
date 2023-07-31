/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.BlogDTO;
import entity.CustomerBirdDTO;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
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
public class CustomerBirdDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    /* List of all of BIRD in DATABASE*/
    public List<CustomerBirdDTO> getLisofBird() throws IOException, SQLException, ClassNotFoundException {
        List<CustomerBirdDTO> list = new ArrayList<>();
        String sql = "select b.bird_id , b.name, b.customer_id , b.bird_img , b.birthDate , b.type_id ,t.type_name from tbl_bird as b  JOIN tbl_bird_type  as t ON b.type_id = t.type_id ";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String dateString = rs.getString(5);
                java.sql.Date date = java.sql.Date.valueOf(dateString);
                String base64Image = null;
                Blob blob = rs.getBlob("bird_img");
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

                CustomerBirdDTO dto = new CustomerBirdDTO(rs.getString(1), rs.getString(2), rs.getString(3), base64Image, date, rs.getString(6), rs.getString(7));
                list.add(dto);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
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

    /* List of all of BIRD in DATABASE by CUSTOMERID*/
    public List<CustomerBirdDTO> getLisofBirdByCustomerDTO(int customer_id) throws IOException, SQLException, ClassNotFoundException {
        List<CustomerBirdDTO> list = new ArrayList<>();
        String sql = "select b.bird_id , b.name, b.customer_id , b.bird_img , b.birthDate , b.type_id ,t.type_name from tbl_bird as b  JOIN tbl_bird_type  as t ON b.type_id = t.type_id where b.customer_id = ? ";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, customer_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String dateString = rs.getString(5);
                java.sql.Date date = java.sql.Date.valueOf(dateString);
                String base64Image = null;
                Blob blob = rs.getBlob("bird_img");
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

                CustomerBirdDTO dto = new CustomerBirdDTO(rs.getString(1), rs.getString(2), rs.getString(3), base64Image, date, rs.getString(6), rs.getString(7));
                list.add(dto);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
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

    /* List on Type of Bird for customer to choose*/
    public List<CustomerBirdDTO> getLisofType_of_Bird() throws IOException, SQLException, ClassNotFoundException {
        List<CustomerBirdDTO> list = new ArrayList<>();
        String sql = "select * from tbl_bird_type";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                CustomerBirdDTO dto = new CustomerBirdDTO(rs.getString(1), rs.getString(2));
                list.add(dto);
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

    /* Insert a new type of Bird */
    public void InsertNewTypeofBird(String type_id, String type_name) throws SQLException {
        String sql = "insert into tbl_bird_type(type_id , type_name)\n"
                + "values (?,?)";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, type_id);
            ps.setString(2, type_name);
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

        }
    }

    public int GenerateBirdTypeId() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_bird_type WHERE type_id = (SELECT MAX(TRY_CAST(type_id AS INT))FROM tbl_bird_type)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXTypeID = rs.getInt("type_id");
                newID = MAXTypeID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;

    }

    /* Insert a new  Bird */
    public void InsertNewBird(String bird_id, String name, String customer_id, String bird_img, Date birdDate, String type_id) throws SQLException {
        String sql = "insert into tbl_bird (bird_id , name, customer_id , bird_img,birthDate , type_id)\n"
                + "values(?,?,?,?,?,?)";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, bird_id);
            ps.setString(2, name);
            ps.setString(3, customer_id);
            ps.setBytes(4, Base64.getDecoder().decode(bird_img));
            ps.setDate(5, birdDate);
            ps.setString(6, type_id);
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

        }
    }

    public int GenerateBirdId() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_bird WHERE bird_id = (SELECT MAX(TRY_CAST(bird_id AS INT))FROM tbl_bird)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXBirdID = rs.getInt("bird_id");
                newID = MAXBirdID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;

    }

    // DELETE FUNCTION
    public void DeleteBird(String id) {
        String sql = "delete from tbl_bird\n"
                + "where bird_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    /* List of all of BIRD in DATABASE by CUSTOMERID*/
    public CustomerBirdDTO getBirdByCustomerIDint(String bird_Id, String customer_Id) throws IOException, SQLException, ClassNotFoundException {
        String sql = "select b.bird_id , b.name, b.customer_id , b.bird_img , b.birthDate , b.type_id ,t.type_name from tbl_bird as b  JOIN tbl_bird_type  as t ON b.type_id = t.type_id \n"
                + "where b.bird_id =  ? and  b.customer_id = ? ";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, bird_Id);
            ps.setString(2, customer_Id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String dateString = rs.getString(5);
                java.sql.Date date = java.sql.Date.valueOf(dateString);
                String base64Image = null;
                Blob blob = rs.getBlob("bird_img");
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

                return new CustomerBirdDTO(rs.getString(1), rs.getString(2), rs.getString(3), base64Image, date, rs.getString(6), rs.getString(7));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
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
        return null;
    }

    public boolean UpdateBird(CustomerBirdDTO bird) throws SQLException {
        boolean updated = false;
        String sql = "update tbl_bird \n"
                + "set name= ? , bird_img = ? , birthDate = ? ,type_id = ? \n"
                + "where bird_id = ? ";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, bird.getName());
            ps.setBytes(2, Base64.getDecoder().decode(bird.getBird_img()));
            ps.setDate(3, bird.getBirdDate());
            ps.setString(4, bird.getType_id());
            ps.setString(5,bird.getBird_id());
            int rowsAffected = ps.executeUpdate();
            updated = rowsAffected > 0;

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
        return updated;
    }

}
