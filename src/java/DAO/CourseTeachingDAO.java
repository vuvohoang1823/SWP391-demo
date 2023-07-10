/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.CourseTeachingDTO;
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
 * @author LAPTOP
 */
public class CourseTeachingDAO implements Serializable{
    
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();
    Connection connection = null;

    public List<CourseTeachingDTO> getCourseListAreTeaching(int trainer_id) throws SQLException, IOException, ClassNotFoundException {
        List<CourseTeachingDTO> list = new ArrayList<>();

        String sql = "SELECT appointment.trainer_id, customer.fullname AS fullname_customer, customer.contact AS contact_customer, NULL AS content, NULL AS category, NULL AS title, appointment.note, appointment.address, appointment.type " +
                     "FROM tbl_appointment appointment " +
                     "JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n" +
                     "WHERE appointment.trainer_id = ? " +
                     "UNION ALL " +
                     "SELECT  booking.trainer_id, customer.fullname AS fullname_customer, customer.contact AS contact_customer, course.content, course.category, course.title, NULL AS note, NULL AS address, NULL AS type " +
                     "FROM tbl_Booking booking " +
                     "JOIN tbl_course course ON booking.trainer_id = course.trainer_id " +
                     "JOIN tbl_customer customer ON booking.customer_id = customer.customer_id " +
                     "WHERE booking.trainer_id = ?";
        
        
        
        try {
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, trainer_id);
            ps.setInt(2, trainer_id);
            
            rs = ps.executeQuery();

            while (rs.next()) {
                
                 CourseTeachingDTO trainer_teaching_course = new CourseTeachingDTO(rs.getString("trainer_id"), rs.getString("fullname_customer"), rs.getString("content"), rs.getString("category"), rs.getString("title"));
                 list.add(trainer_teaching_course);


            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return list;

    }
    
        public List<CourseTeachingDTO> getConsultationListAreTeaching(String trainer_id) throws SQLException, IOException, ClassNotFoundException {
        List<CourseTeachingDTO> list = new ArrayList<>();

        String sql = "SELECT appointment.trainer_id, customer.fullname AS fullname_customer, customer.contact AS contact_customer, NULL AS content, NULL AS category, NULL AS title, appointment.note, appointment.address, appointment.type " +
                     "FROM tbl_appointment appointment " +
                     "JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n" +
                     "WHERE appointment.trainer_id = ? " +
                     "UNION ALL " +
                     "SELECT  booking.trainer_id, customer.fullname AS fullname_customer, customer.contact AS contact_customer, course.content, course.category, course.title, NULL AS note, NULL AS address, NULL AS type " +
                     "FROM tbl_Booking booking " +
                     "JOIN tbl_course course ON booking.trainer_id = course.trainer_id " +
                     "JOIN tbl_customer customer ON booking.customer_id = customer.customer_id " +
                     "WHERE booking.trainer_id = ?";
        
        
        
        try {
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, trainer_id);
            ps.setString(2, trainer_id);
            
            rs = ps.executeQuery();

            while (rs.next()) {
                
                 CourseTeachingDTO trainer_teaching_consultation = new CourseTeachingDTO(rs.getString("trainer_id"), rs.getString("fullname_customer"), rs.getString("contact_customer"), rs.getString("note"), rs.getString("address"), rs.getString("type"));
                 list.add(trainer_teaching_consultation);


            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;

    }
    
}
