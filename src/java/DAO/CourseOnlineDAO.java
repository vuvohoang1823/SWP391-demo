/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.Course;
import entity.service.CourseOnline;
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
 * @author LAPTOP
 */
public class CourseOnlineDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public CourseOnline getDetailOnlineCourse(String courseID) throws ClassNotFoundException, SQLException, IOException {
//        List<CourseOnline> list = new ArrayList<>();
        String sql = "SELECT c.course_id, c.staff_id, c.content, c.category, c.title, c.price, i.img, o.module_description_1, o.module_description_2, o.module_description_3, o.module_description_4, o.module_description_5, o.module_name_1, o.module_name_2, o.module_name_3, o.module_name_4, o.module_name_5\n"
                + "FROM tbl_course c\n"
                + "JOIN tbl_onlinecourse_detail o ON o.course_id = c.course_id\n"
                + "JOIN tbl_courseImg i ON i.course_id = c.course_id\n"
                + "WHERE c.course_id = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, courseID);
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

                return new CourseOnline(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        base64Image,
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(17),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12)
                );

//                list.add(course);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public void CreateOnlineCOurse(String course_id, String content, String title, int price, String module_id, String module_name, String module_description, String img_id, String image) {
        String sql_course = "insert into tbl_course(course_id ,staff_id, content,category,title,price)\n"
                + "	values  (?,18,?,'online',?,?)";
        String sql_course_detail = "insert into tbl_online_course_detail(module_id ,module_name,module_description , course_id)\n"
                + "	values (?,?,?,?)";
        String sql_img = "insert into tbl_courseImg(id,course_id,img)\n"
                + "	values(?,?,?)";
        try {
            con = db.getConnection();

            //1 sql_course
            ps = con.prepareStatement(sql_course);
            ps.setString(1, course_id);
            ps.setString(2, content);
            ps.setString(3, title);
            ps.setInt(4, price);
            ps.executeUpdate();
            //2.sql_course_detail
            ps = con.prepareStatement(sql_course_detail);
            ps.setString(1, module_id);
            ps.setString(2, module_name);
            ps.setString(3, module_description);
            ps.setString(4, course_id);
            ps.executeUpdate();
            //3. sql_img
            ps = con.prepareStatement(sql_img);
            ps.setString(1, img_id);
            ps.setString(2, course_id);
            ps.setBytes(3, Base64.getDecoder().decode(image));
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public int GeneratecourseID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_course WHERE course_id = (SELECT MAX(TRY_CAST(course_id AS INT))FROM tbl_course)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXcourseID = rs.getInt("course_id");
                newID = MAXcourseID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;

    }

    public int GenerateIMGcourseID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_courseImg WHERE id = (SELECT MAX(TRY_CAST(id AS INT))FROM tbl_courseImg)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXcourseID = rs.getInt("id");
                newID = MAXcourseID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;

    }

    // DELETE FUNCTION 
    public void DeleteCourseOnline(String id) {
        String sql = "update tbl_course \n"
                + "	set status ='unavailable' \n"
                + "	where course_id = ?";

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

    // UPDATE Course Online _ Information
    public void UpdateOnlineCourseInfo(String courseID, String content, String title, int price) {
        String sql = "UPDATE tbl_course\n"
                + "SET content = ?, title = ?, price = ? \n"
                + "WHERE course_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, content);
            ps.setString(2, title);
            ps.setInt(3, price);
            ps.setString(4, courseID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    // UPDATE Course Online _ Image
    public void UpdateOnlineCourseImage(String courseID, String image) {
        String sql = "UPDATE tbl_courseImg\n"
                + "SET img = ?\n"
                + "WHERE course_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setBytes(1, Base64.getDecoder().decode(image));
            ps.setString(2, courseID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    // UPDATE Course Online _ Module
    public void UpdateOnlineCourseModule(String courseID, String md_n_1, String md_n_2, String md_n_3, String md_n_4, String md_n_5, String md_d_1, String md_d_2, String md_d_3, String md_d_4, String md_d_5) {
        String sql = "UPDATE tbl_onlinecourse_detail\n"
                + "SET module_name_1 = ?, module_name_2 = ?, module_name_3 = ?, module_name_4 = ?, module_name_5 = ?, module_description_1 = ?, module_description_2 = ?, module_description_3 = ?, module_description_4 = ?, module_description_5 = ?\n"
                + "WHERE course_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, md_n_1);
            ps.setString(2, md_n_2);
            ps.setString(3, md_n_3);
            ps.setString(4, md_n_4);
            ps.setString(5, md_n_5);
            ps.setString(6, md_d_1);
            ps.setString(7, md_d_2);
            ps.setString(8, md_d_3);
            ps.setString(9, md_d_4);
            ps.setString(10, md_d_5);
            ps.setString(11, courseID);

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    // CREATE Course Online _ Infomation
    public void CreateOnlineCourseInfo(String courseID, String content, String title, int price) {
        String sql = "INSERT INTO tbl_course (course_id, staff_id, content, category, title, price, status)\n"
                + "VALUES (?, 18, ?, 'online', ?, ? ,'available')";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, courseID);
            ps.setString(2, content);
            ps.setString(3, title);
            ps.setInt(4, price);

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    // CREATE Course Online _ Image
    public void CreateOnlineCourseImage(String id, String courseID, String image) {
        String sql = "INSERT INTO tbl_courseImg (id, course_id, img)\n"
                + "	VALUES (?, ?, ?)";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, id);
            ps.setString(2, courseID);
            ps.setBytes(3, Base64.getDecoder().decode(image));

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    // CREATE Course Online _ Image
    public void CreateOnlineCourseModule(String courseID, String module_name_1, String module_name_2, String module_name_3, String module_name_4, String module_name_5, String module_description_1, String module_description_2, String module_description_3, String module_description_4, String module_description_5) {
        String sql = "INSERT INTO tbl_onlinecourse_detail (course_id, module_name_1, module_name_2, module_name_3, module_name_4, module_name_5, module_description_1, module_description_2, module_description_3, module_description_4, module_description_5)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, courseID);
            ps.setString(2, module_name_1);
            ps.setString(3, module_name_2);
            ps.setString(4, module_name_3);
            ps.setString(5, module_name_4);
            ps.setString(6, module_name_5);
            ps.setString(7, module_description_1);
            ps.setString(8, module_description_2);
            ps.setString(9, module_description_3);
            ps.setString(10, module_description_4);
            ps.setString(11, module_description_5);

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
}
