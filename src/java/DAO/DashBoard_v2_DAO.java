/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.DashBoard_v2_DTO;
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
public class DashBoard_v2_DAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public List<DashBoard_v2_DTO> getDetailTop3Workshop() {
        List<DashBoard_v2_DTO> list = new ArrayList<>();

        String sql = "SELECT t.course_id, COUNT(*) AS participant_count, c.title, i.img\n"
                + "				FROM tbl_attendance a\n"
                + "				JOIN tbl_workshopTraining t ON a.workshop_id = t.workshop_id\n"
                + "				JOIN tbl_course c ON c.course_id = t.course_id\n"
                + "				JOIN tbl_courseImg i ON i.course_id = c.course_id\n"
                + "				GROUP BY t.course_id, c.title, i.img\n"
                + "				ORDER BY participant_count DESC";

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

                DashBoard_v2_DTO dashboard = new DashBoard_v2_DTO(
                        rs.getString(2),
                        rs.getString(3),
                        base64Image);

                list.add(dashboard);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return list;

    }

    public List<DashBoard_v2_DTO> getDetailTop3BirdCourse() {
        List<DashBoard_v2_DTO> list = new ArrayList<>();

        String sql = "SELECT TOP(3) b.course_id, COUNT(*) AS participant_count, c.title, i.img\n"
                + "				FROM tbl_Booking b\n"
                + "				JOIN tbl_course c ON c.course_id = b.course_id\n"
                + "				JOIN tbl_courseImg i ON i.course_id = c.course_id\n"
                + "				GROUP BY b.course_id, c.title, i.img\n"
                + "				ORDER BY participant_count DESC";

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

                DashBoard_v2_DTO dashboard = new DashBoard_v2_DTO(
                        rs.getString(2),
                        rs.getString(3),
                        base64Image);

                list.add(dashboard);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return list;

    }

    public List<DashBoard_v2_DTO> getDetailTop3Online() {
        List<DashBoard_v2_DTO> list = new ArrayList<>();

        String sql = "SELECT TOP(3) b.course_id, COUNT(*) AS participant_count, c.title, i.img\n"
                + "				FROM tbl_courseBuy b\n"
                + "				JOIN tbl_course c ON c.course_id = b.course_id\n"
                + "				JOIN tbl_courseImg i ON i.course_id = c.course_id\n"
                + "				GROUP BY b.course_id, c.title, i.img\n"
                + "				ORDER BY participant_count DESC";

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

                DashBoard_v2_DTO dashboard = new DashBoard_v2_DTO(
                        rs.getString(2),
                        rs.getString(3),
                        base64Image);

                list.add(dashboard);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return list;

    }

    public List<DashBoard_v2_DTO> getTop3Trainer() {
        List<DashBoard_v2_DTO> list = new ArrayList<>();

        String sql = "SELECT TOP(3) a.trainer_id, SUM(amount) AS total_earnings, t.fullname, t.img\n"
                + "				FROM (\n"
                + "					SELECT c.trainer_id, amount FROM tbl_attendance a\n"
                + "					JOIN tbl_workshopTraining t ON a.workshop_id = t.workshop_id\n"
                + "					JOIN tbl_course c ON c.course_id = t.course_id\n"
                + "					UNION ALL\n"
                + "					SELECT trainer_id, amount FROM tbl_appointment WHERE Status = 'approve'\n"
                + "					UNION ALL\n"
                + "					SELECT trainer_id, amount FROM tbl_Booking WHERE status = 'checkout'\n"
                + "					) AS a\n"
                + "					JOIN tbl_trainer t ON a.trainer_id = t.trainer_id\n"
                + "					GROUP BY a.trainer_id, t.fullname, t.img\n"
                + "					ORDER BY total_earnings DESC";

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

                DashBoard_v2_DTO dashboard = new DashBoard_v2_DTO(
                        rs.getString(1),
                        rs.getLong(2),
                        rs.getString(3),
                        base64Image);

                list.add(dashboard);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return list;

    }

    String amount;

    public String getNumberOfWorkshop() {
        String sql = "SELECT COUNT(*)\n"
                + "				FROM tbl_course\n"
                + "				WHERE category = 'workshop'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                amount = rs.getString(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return amount;
    }

    public String getNumberOfOnline() {
        String sql = "SELECT COUNT(*)\n"
                + "				FROM tbl_course\n"
                + "				WHERE category = 'online'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                amount = rs.getString(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return amount;
    }

    public String getNumberOfBirdCourse() {
        String sql = "SELECT COUNT(*)\n"
                + "				FROM tbl_course\n"
                + "				WHERE category = 'bird training'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                amount = rs.getString(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return amount;
    }

    public String getCustomerOfWorkshop() {
        String sql = "SELECT COUNT(*)\n"
                + "				FROM tbl_attendance";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                amount = rs.getString(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return amount;
    }

    public String getCustomerOfOnline() {
        String sql = "SELECT COUNT(*)\n"
                + "				FROM tbl_courseBuy";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                amount = rs.getString(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return amount;
    }

    public String getCustomerOfBirdCourse() {
        String sql = "SELECT COUNT(*)\n"
                + "				FROM tbl_Booking";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                amount = rs.getString(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return amount;
    }

    public String getCustomerOfAppointment() {
        String sql = "SELECT COUNT(*)\n"
                + "				FROM tbl_appointment";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                amount = rs.getString(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return amount;
    }

}
