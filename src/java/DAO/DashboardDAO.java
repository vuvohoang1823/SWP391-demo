/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.Course;
import entity.DashboardDTO;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Calendar;

/**
 *
 * @author hoang
 */
public class DashboardDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public int getCurrentMonth() {
        int month = 0;
        month = Calendar.getInstance().get(Calendar.MONTH) + 1;
        return month;
    }

    public int getRevenueOfBirdCourse(int month) {
        int revenue = 0;
        String sql = "SELECT SUM(amount) AS total_amount\n"
                + "FROM tbl_Booking\n"
                + "WHERE MONTH(checkout_date) = ? AND status='checkout'";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, month);
            rs = ps.executeQuery();
            if (rs.next()) {
                revenue = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return revenue;
    }

    public int getRevenueOfWorkshop(int month) {
        int revenue = 0;
        String sql = "SELECT SUM(amount) AS total_amount\n"
                + "FROM tbl_attendance\n"
                + "WHERE MONTH(dateCheck) = ?;";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, month);
            rs = ps.executeQuery();
            if (rs.next()) {
                revenue = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return revenue;
    }

    public int getRevenueOfOnlineCourse(int month) {
        int revenue = 0;
        String sql = "SELECT SUM(amount) AS total_amount\n"
                + "FROM tbl_courseBuy\n"
                + "WHERE MONTH(date) = ?;";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, month);
            rs = ps.executeQuery();
            if (rs.next()) {
                revenue = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return revenue;
    }

    public int getRevenueOfConsultation(int month) {
        int revenue = 0;
        String sql = "SELECT SUM(amount) AS total_amount\n"
                + "FROM tbl_appointment\n"
                + "WHERE MONTH(date) = ?;";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, month);
            rs = ps.executeQuery();
            if (rs.next()) {
                revenue = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return revenue;
    }

    public DashboardDTO getTotalRevenue(int month) {
        int birdCourse = getRevenueOfBirdCourse(month);
        int workshop = getRevenueOfWorkshop(month);
        int onlineCourse = getRevenueOfOnlineCourse(month);
        int consultation = getRevenueOfConsultation(month);

        int total = birdCourse + workshop + onlineCourse + consultation;

        DashboardDTO dashboard = new DashboardDTO(workshop, onlineCourse, consultation, birdCourse, total);
        return dashboard;
    }

}


