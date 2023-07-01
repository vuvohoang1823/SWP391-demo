/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.AttendanceDTO;
import entity.BookingDTO;
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
public class AttendanceDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

//    /*GET ALL PRODUCT*/
//    public List<AttendanceDTO> getAllWorkshopEnrolled() throws ClassNotFoundException, SQLException, IOException {
//        List<AttendanceDTO> list = new ArrayList<>();
//        String sql = "select c.trainer_id , a.workshop_id, a.customer_id,a.dateCheck , a.amount , a.payment_id  from tbl_attendance as a  \n"
//                + "JOIN tbl_course as c ON a.workshop_id = c.course_id`";
//        try {
//            con = db.getConnection();
//            ps = con.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//
//                AttendanceDTO attendance = new AttendanceDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5), rs.getInt(6));
//                list.add(attendance);
//            }
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        } catch (ClassNotFoundException ex) {
//            ex.printStackTrace();
//        }
//
//        return list;
//    }

    public List<AttendanceDTO> getAllCourseEnrolledbyID(int userID) throws ClassNotFoundException, SQLException, IOException {
        List<AttendanceDTO> list = new ArrayList<>();
        String sql = "select b.customer_id ,b.workshop_id, c.trainer_id,  c.category , c.title, i.img ,b.dateCheck ,b.amount,b.payment_id from tbl_course as c\n"
                + "             JOIN tbl_courseImg  as i ON c.course_id = i.course_id\n"
                + "			 JOIN tbl_attendance as b  ON   c.course_id = b.workshop_id\n"
                + "    		 where b.customer_id = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
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
                AttendanceDTO attendance = new AttendanceDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        base64Image,
                        rs.getDate(7),
                        rs.getInt(8),
                        rs.getInt(9));
                list.add(attendance);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return list;
    }
}
