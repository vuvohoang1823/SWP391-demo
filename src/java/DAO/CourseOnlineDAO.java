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

    public List<CourseOnline> getDetailOnlineCourse(String courseID) throws ClassNotFoundException, SQLException, IOException {
        List<CourseOnline> list = new ArrayList<>();
        String sql = "SELECT c.course_id, c.content, c.category, c.title, c.price, o.module_id, o.module_name, o.module_description\n"
                + "		FROM tbl_course c\n"
                + "		JOIN tbl_online_course_detail o ON o.course_id = c.course_id\n"
                + "		WHERE c.course_id = ? and status = 'available'";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, courseID);
            rs = ps.executeQuery();
            while (rs.next()) {

                CourseOnline course = new CourseOnline(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );

                list.add(course);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return list;
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
                + "	set status ='unavailable'\n"
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
}
