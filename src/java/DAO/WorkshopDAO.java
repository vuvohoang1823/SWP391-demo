/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.WorkshopDDD;
import entity.service.Workshop;
import java.io.Serializable;
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
public class WorkshopDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public boolean updateWorkshopInformation(String trainer_id, String content, String title, int price, Date start_date, Date end_enroll_date, String course_id) throws ClassNotFoundException {
        String sql = "UPDATE tbl_course\n"
                + "SET trainer_id = ?, staff_id = 18, content = ?, category = 'workshop', title = ?, price = ?, start_date = ?, end_enroll_date = ?\n"
                + "WHERE course_id = ?;";

        try {
            con = DBUtils.getConnection();

            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, trainer_id);
                ps.setString(2, content);
                ps.setString(3, title);
                ps.setInt(4, price);
                ps.setDate(5, start_date);
                ps.setDate(6, end_enroll_date);
                ps.setString(7, course_id);

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

    public List<WorkshopDDD> SEARCHOrderListCompltedbyTitle(String txtsearch) {
        List<WorkshopDDD> list = new ArrayList<>();

        String sql = " SELECT c.title, cus.fullname, a.dateCheck, a.amount, a.status, a.customer_id, c.course_id, a.attendance_id, a.certificate \n"
                + "                				FROM tbl_attendance a \n"
                + "                				JOIN tbl_workshopTraining t ON t.workshop_id = a.workshop_id\n"
                + "                				JOIN tbl_course c ON c.course_id = t.course_id\n"
                + "                				JOIN tbl_customer cus ON cus.customer_id = a.customer_id\n"
                + "                				AND c.title LIKE ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + txtsearch + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                WorkshopDDD order = new WorkshopDDD(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );
                list.add(order);

            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;

    }

    public List<WorkshopDDD> OrderListComplted() {
        List<WorkshopDDD> list = new ArrayList<>();

        String sql = " SELECT c.title, cus.fullname, a.dateCheck, a.amount, a.status, a.customer_id, c.course_id, a.attendance_id, a.certificate \n"
                + "                				FROM tbl_attendance a \n"
                + "                				JOIN tbl_workshopTraining t ON t.workshop_id = a.workshop_id\n"
                + "                				JOIN tbl_course c ON c.course_id = t.course_id\n"
                + "                				JOIN tbl_customer cus ON cus.customer_id = a.customer_id";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                WorkshopDDD order = new WorkshopDDD(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );
                list.add(order);

            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;

    }

    public List<WorkshopDDD> CustomerListInProgressWorkshop() {
        List<WorkshopDDD> list = new ArrayList<>();

        String sql = " SELECT cus.fullname, u.gmail, cus.contact, a.attendance, c.course_id, a.customer_id, a.status, a.workshop_id, c.title\n"
                + "FROM tbl_attendance a \n"
                + "JOIN tbl_workshopTraining t ON t.workshop_id = a.workshop_id\n"
                + "JOIN tbl_course c ON c.course_id = t.course_id\n"
                + "JOIN tbl_customer cus ON a.customer_id = cus.customer_id\n"
                + "JOIN tbl_user u ON u.user_id = cus.user_id\n"
                + "WHERE a.status = 'In progress'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                WorkshopDDD order = new WorkshopDDD(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );

                list.add(order);

            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;

    }

    public void CheckAttendanceWorkshop(String courseID, String attendance, String workshop_id) {
        String sql = "UPDATE tbl_attendance\n"
                + "SET attendance = ?\n"
                + "WHERE customer_id = ? \n"
                + "AND workshop_id = ? \n"
                + "AND status = 'In progress'";

        try {
            con = DBUtils.getConnection();

            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, attendance);
                ps.setString(2, courseID);
                ps.setString(3, workshop_id);

                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public List<WorkshopDDD> CustomerListCompleteWorkshop(Date complete_date) {
        List<WorkshopDDD> list = new ArrayList<>();

        String sql = " SELECT cus.fullname, u.gmail, cus.contact, a.attendance, c.course_id, a.customer_id, a.status, a.workshop_id, c.title\n"
                + "FROM tbl_attendance a \n"
                + "JOIN tbl_workshopTraining t ON t.workshop_id = a.workshop_id\n"
                + "JOIN tbl_course c ON c.course_id = t.course_id\n"
                + "JOIN tbl_customer cus ON a.customer_id = cus.customer_id\n"
                + "JOIN tbl_user u ON u.user_id = cus.user_id\n"
                + "WHERE a.complete_date = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setDate(1, complete_date);
            rs = ps.executeQuery();

            while (rs.next()) {
                WorkshopDDD order = new WorkshopDDD(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );

                list.add(order);

            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;

    }

    public List<WorkshopDDD> ListOfCustomerInProgressWorkshop(String course_id) {
        List<WorkshopDDD> list = new ArrayList<>();

        String sql = " SELECT cus.fullname, u.gmail, cus.contact, a.attendance, c.course_id, a.customer_id, a.status, a.workshop_id, c.title\n"
                + "                FROM tbl_attendance a \n"
                + "                JOIN tbl_workshopTraining t ON t.workshop_id = a.workshop_id\n"
                + "                JOIN tbl_course c ON c.course_id = t.course_id\n"
                + "                JOIN tbl_customer cus ON a.customer_id = cus.customer_id\n"
                + "                JOIN tbl_user u ON u.user_id = cus.user_id\n"
                + "                WHERE a.status = 'In progress'\n"
                + "				AND c.course_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, course_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                WorkshopDDD order = new WorkshopDDD(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );

                list.add(order);

            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;

    }

    public WorkshopDDD ViewOrderDetailOfCustomer(String attendance_id) {
        WorkshopDDD detail_order = null;

        String sql = "SELECT cus.customer_id, cus.fullname, u.gmail, cus.contact, a.attendance_id, a.attendance, c.title, a.complete_date, a.amount, a.dateCheck, a.status,  tr.fullname, a.certificate\n"
                + "                                				FROM tbl_attendance a \n"
                + "                                				JOIN tbl_workshopTraining t ON t.workshop_id = a.workshop_id\n"
                + "                               					JOIN tbl_course c ON c.course_id = t.course_id\n"
                + "                                				JOIN tbl_customer cus ON cus.customer_id = a.customer_id\n"
                + "												JOIN tbl_user u ON u.user_id = cus.user_id\n"
                + "												JOIN tbl_trainer tr ON tr.trainer_id = c.trainer_id\n"
                + "												WHERE a.attendance_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, attendance_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                detail_order = new WorkshopDDD(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13)
                );
            }

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return detail_order;
    }

    public void AwardedCertificate(String attendance_id) {
        String sql = "UPDATE tbl_attendance\n"
                + "SET certificate = 'Awarded'\n"
                + "WHERE attendance_id = ?";

        try {
            con = DBUtils.getConnection();

            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, attendance_id);

                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

}
