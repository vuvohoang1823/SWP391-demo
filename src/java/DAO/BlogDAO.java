/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.BlogDTO;
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
import javax.naming.NamingException;

/**
 *
 * @author hoang
 */
public class BlogDAO implements Serializable {
    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();
    
    public List<BlogDTO> getLisofBlog() throws IOException, SQLException, ClassNotFoundException {
        List<BlogDTO> list = new ArrayList<>();
        String sql = "select * from tbl_blog";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                // Validate DATE to String
                String dateString = rs.getString(3);
                java.sql.Date date = java.sql.Date.valueOf(dateString);
                // End validate DATE

                // Validate thumbnail + contentIMG
                // Thumbnail
                String base64Image_thumbnail = null;
                Blob blob = rs.getBlob("thumbnail");
                if (blob != null) {
                    InputStream inputStream = blob.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imageBytes = outputStream.toByteArray();
                    base64Image_thumbnail = Base64.getEncoder().encodeToString(imageBytes);
                    inputStream.close();
                    outputStream.close();
                } else {
                    base64Image_thumbnail = "default";
                }

                // Content img
                String base64Image_contentIMG = null;
                Blob blob1 = rs.getBlob("contentIMG");
                if (blob1 != null) {
                    InputStream inputStream = blob1.getBinaryStream();  // <-- Corrected typo in variable name
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imageBytes = outputStream.toByteArray();
                    base64Image_contentIMG = Base64.getEncoder().encodeToString(imageBytes);
                    inputStream.close();
                    outputStream.close();
                } else {
                    base64Image_contentIMG = "default";
                }
                // End img

                BlogDTO blog = new BlogDTO(rs.getString(1),
                        rs.getString(2),
                        date,
                        base64Image_thumbnail,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        base64Image_contentIMG,
                        rs.getString(12));
                list.add(blog);
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
    
    public BlogDTO GETdetailOfBLOG(String blog_id) throws IOException, SQLException {
              String sql = "select* from tbl_blog where id =?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, blog_id);
            rs = ps.executeQuery();
            if(rs.next()) {
                // Validate DATE to String
                String dateString = rs.getString(3);
                java.sql.Date date = java.sql.Date.valueOf(dateString);
                // End validate DATE

                // Validate thumbnail + contentIMG
                // Thumbnail
                String base64Image_thumbnail = null;
                Blob blob = rs.getBlob("thumbnail");
                if (blob != null) {
                    InputStream inputStream = blob.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imageBytes = outputStream.toByteArray();
                    base64Image_thumbnail = Base64.getEncoder().encodeToString(imageBytes);
                    inputStream.close();
                    outputStream.close();
                } else {
                    base64Image_thumbnail = "default";
                }

                // Content img
                String base64Image_contentIMG = null;
                Blob blob1 = rs.getBlob("contentIMG");
                if (blob1 != null) {
                    InputStream inputStream = blob1.getBinaryStream();  // <-- Corrected typo in variable name
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imageBytes = outputStream.toByteArray();
                    base64Image_contentIMG = Base64.getEncoder().encodeToString(imageBytes);
                    inputStream.close();
                    outputStream.close();
                } else {
                    base64Image_contentIMG = "default";
                }
                // End img

            return new BlogDTO(rs.getString(1),
                        rs.getString(2),
                        date,
                        base64Image_thumbnail,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        base64Image_contentIMG,
                        rs.getString(12));
               
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
}