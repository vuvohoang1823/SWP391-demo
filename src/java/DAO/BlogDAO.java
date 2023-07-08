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
import java.sql.Date;
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

    public List<BlogDTO> getLisofBlog(String status) throws IOException, SQLException, ClassNotFoundException {
        List<BlogDTO> list = new ArrayList<>();
        String sql = "select * from tbl_blog where status = ? ";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
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
            if (rs.next()) {
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

    // DELETE FUNCTION
    public void DeleteBlog(String blog_id) {
        String sql = "update tbl_blog \n"
                + "set status = 'unavailable'\n"
                + "where id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, blog_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    // RESTORE FUNCTION
    public void RestoreBlog(String blog_id) {
        String sql = "update tbl_blog \n"
                + "set status = 'available'\n"
                + "where id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, blog_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public boolean UpdateBlog(BlogDTO blog) throws SQLException {
        boolean updated = false;
        String sql = "UPDATE tbl_blog SET date = ?, thumbnail = ?, title = ?, author = ?, introduction = ?, content1 = ?, content2 = ?, inconclusion = ?, contentIMG = ?, briefinfo = ? WHERE id = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setDate(1, blog.getDate());
            ps.setBytes(2, Base64.getDecoder().decode(blog.getThumbnail()));
            ps.setString(3, blog.getTitle());
            ps.setString(4, blog.getAuthor());
            ps.setString(5, blog.getIntroduction());
            ps.setString(6, blog.getContent1());
            ps.setString(7, blog.getContent2());
            ps.setString(8, blog.getInconclusion());
            ps.setBytes(9, Base64.getDecoder().decode(blog.getContentIMG()));
            ps.setString(10, blog.getBriefinfo());
            ps.setString(11, blog.getBlogid());
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

    public void CreateBlog(String blog_id, Date date, String thumbnail, String title, String author, String introduction, String content1, String content2, String contentIMG, String briefinfo) {
        String sql = "insert into tbl_blog(id,staff_id ,date,thumbnail , title,author , introduction,content1, content2,contentIMG , briefinfo,status)\n"
                + "values(?,18,?,?,?,?,?,?,?,?,?,'available')";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, blog_id);
            ps.setDate(2, date);
            ps.setBytes(3, Base64.getDecoder().decode(thumbnail));
            ps.setString(4, title);
            ps.setString(5, author);
            ps.setString(6, introduction);
            ps.setString(7, content1);
            ps.setString(8, content2);
            ps.setBytes(9, Base64.getDecoder().decode(contentIMG));
            ps.setString(10, briefinfo);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public int GenerateBlogID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_blog WHERE id = (SELECT MAX(TRY_CAST(id AS INT))FROM tbl_blog)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXblogID = rs.getInt("id");
                newID = MAXblogID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;

    }

    public void UpdateBlog(String blog_id, Date date, String thumbnail, String title, String author, String introduction, String content1, String content2, String contentIMG, String briefinfo) {
        String sql = "UPDATE tbl_blog SET date = ?, thumbnail = ?, title = ?, author = ?, introduction = ?, content1 = ?, content2 = ?, contentIMG = ?, briefinfo = ? WHERE id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setDate(1, date);
            ps.setBytes(2, Base64.getDecoder().decode(thumbnail));
            ps.setString(3, title);
            ps.setString(4, author);
            ps.setString(5, introduction);
            ps.setString(6, content1);
            ps.setString(7, content2);
            ps.setBytes(8, Base64.getDecoder().decode(contentIMG));
            ps.setString(9, briefinfo);
            ps.setString(10, blog_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

}
