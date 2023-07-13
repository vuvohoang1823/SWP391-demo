/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.service.Workshop;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

/**
 *
 * @author LAPTOP
 */
public class WorkshopDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public boolean updateWorkshopInformation(Workshop workshop) throws ClassNotFoundException {
        String sql = "UPDATE tbl_course\n"
                + "SET trainer_id = ?, staff_id = ?, content = ?, category = ?, title = ?, price = ?, start_date = ?, end_enroll_date = ?\n"
                + "WHERE course_id = ?;";

        try {
            con = DBUtils.getConnection();

            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, workshop.getTrainerID());
                ps.setString(2, workshop.getStaffID());
                ps.setString(3, workshop.getContent());
                ps.setString(4, workshop.getCategory());
                ps.setString(5, workshop.getTitle());
                ps.setInt(6, workshop.getPrice());
                ps.setDate(7, workshop.getStart_date());
                ps.setDate(8, workshop.getEnd_enroll_date());
                ps.setString(9, workshop.getCourseID());

                int effectRows = ps.executeUpdate();

                if (effectRows >= 0) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;

    }

    public boolean updateWorkshopImage(String image, String courseID) throws ClassNotFoundException {

        String sql = "UPDATE tbl_courseImg\n"
                + "SET img = ? \n"
                + "WHERE course_id = ?;";

        try {
            con = DBUtils.getConnection();

            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setBytes(1, Base64.getDecoder().decode(image));
                ps.setString(2, courseID);

                int effectRows = ps.executeUpdate();

                if (effectRows >= 0) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return false;

    }

    public boolean updateWorkshopSubContent(Workshop workshop) throws ClassNotFoundException {

        String sql = "UPDATE tbl_workshop_detail\n"
                + "SET sub_content_1 = ?, sub_content_2 = ?, sub_content_3 = ?, sub_content_4 = ?\n"
                + "WHERE course_id = ?;";
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, workshop.getSub_content_1());
                ps.setString(2, workshop.getSub_content_2());
                ps.setString(3, workshop.getSub_content_3());
                ps.setString(4, workshop.getSub_content_4());
                ps.setString(5, workshop.getCourseID());

                int effectRows = ps.executeUpdate();

                if (effectRows >= 0) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public void CreateNewWorkshopInformation(String courseID, String trainerID, String content, String title, int price, Date end_enroll_date, Date start_date) {
        String sql = "INSERT INTO tbl_course (course_id, trainer_id, staff_id, content, category, title, price, end_enroll_date, start_date, status)\n"
                + "	VALUES (?, ?, 18, ?, 'workshop', ?, ?, ?, ?, 'available')";

        try {
            con = DBUtils.getConnection();

            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, courseID);
                ps.setString(2, trainerID);
                ps.setString(3, content);
                ps.setString(4, title);
                ps.setInt(5, price);
                ps.setDate(6, end_enroll_date);
                ps.setDate(7, start_date);
                
                ps.executeUpdate();

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

    }

    public void CreateNewWorkshopImage(String id, String course_id, String img) {
        String sql = "INSERT INTO tbl_courseImg (id, course_id, img)\n"
                + "	VALUES (?, ?, ?)";

        try {
            con = DBUtils.getConnection();

            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, id);
                ps.setString(2, course_id);
                ps.setBytes(3, Base64.getDecoder().decode(img));
                
                ps.executeUpdate();

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

    }

    public void CreateNewWorkshopSubContent(String courseID, String sub_content_1, String sub_content_2, String sub_content_3, String sub_content_4) {
        String sql = "INSERT INTO tbl_workshop_detail (course_id, sub_content_1, sub_content_2, sub_content_3, sub_content_4)\n"
                + "	VALUES (?, ?, ?, ?, ?)";

        try {
            con = DBUtils.getConnection();

            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, courseID);
                ps.setString(2, sub_content_1);
                ps.setString(3, sub_content_2);
                ps.setString(4, sub_content_3);
                ps.setString(5, sub_content_4);
                
                ps.executeUpdate();

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

    }

    public void DeleteWorkshop(String courseID) {
        String sql = "UPDATE tbl_course\n"
                + "	SET status = 'unavailable'\n"
                + "	WHERE course_id = ?";
        
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, courseID);
                
                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
    
    
}
