/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.AppointmentDDD;
import entity.Course;
import entity.service.BirdCourse;
import entity.service.CourseOnline;
import entity.service.PrivateConsultation;
import entity.service.Workshop;
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
 * @author hoang
 */
public class courseDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    /*GET ALL PRODUCT*/
    public List<Course> getAllCourse() throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img from tbl_course JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id";
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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image);
                list.add(course);
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

    /*GET PRODUCT DETAIL*/
    public Course getCourseByID(String id) throws ClassNotFoundException, SQLException, IOException {
        String sql = "select tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img from tbl_course\n"
                + "JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "where tbl_course.course_id =? ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
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
                return new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image);

            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return null;

    }

    /*SEARCHPRODDUCTBYNAME*/
    public List<Course> SearchCourseByName(String txtSearch) throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img from tbl_course\n"
                + "JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "where tbl_course.title like ? and tbl_course.status='available'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image);
                list.add(course);
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

    /*GET ALL WORKSHOP*/
    public List<Course> getAllCourseWorkshop() throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT c.course_id , c.trainer_id, c.staff_id , c.content , c.category , c.title, c.price, \n"
                + "                i.img, c.start_date, c.end_enroll_date, tr.fullname, c.tracking_status, COUNT(CASE WHEN a.attendance_id IS NOT NULL THEN 0 ELSE NULL END) AS participant_count\n"
                + "                FROM tbl_course c\n"
                + "                JOIN tbl_workshopTraining t ON c.course_id = t.course_id\n"
                + "                LEFT OUTER JOIN tbl_attendance a ON t.workshop_id = a.workshop_id\n"
                + "                JOIN tbl_trainer tr ON tr.trainer_id = c.trainer_id\n"
                + "                JOIN tbl_courseImg i ON i.course_id = c.course_id\n"
                + "                WHERE c.status = 'available'\n"
                + "                GROUP BY c.course_id , c.trainer_id, c.staff_id , c.content , c.category , c.title, c.price, \n"
                + "                i.img, c.start_date, c.end_enroll_date, tr.fullname, c.tracking_status\n"
                + "                ORDER BY participant_count DESC";
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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image,
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(6),
                        rs.getString(5),
                        rs.getString(5)
                );
                list.add(course);
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

    /*GET ALL ONLINE TRAINING*/
    public List<Course> getAllCourseOnlineTraining() throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img from tbl_course JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "where tbl_course.category = 'online' and tbl_course.status='available'";

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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image);
                list.add(course);
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

    /*GTE ONL>INE COURSE BY ID CUSTOMER*/
    public List<Course> getAllCourseOnlineTraining(int UserID) throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = " select tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id ,tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img from tbl_course JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "             JOIN tbl_courseBuy  ON tbl_course.course_id = tbl_courseBuy.course_id  \n"
                + "			 where tbl_courseBuy.customer_id = ? and tbl_course.status='available'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image);
                list.add(course);
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

    /*GET ALL BIRD COURSE*/
    public List<Course> getAllCourseBirdCourse() throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();

        String sql = "SELECT \n"
                + "    c.course_id,\n"
                + "    bt.type_name,\n"
                + "    c.content AS course_content,\n"
                + "    c.category AS course_category,\n"
                + "    c.title AS course_title,\n"
                + "    c.price AS course_price,\n"
                + "    c.duration AS course_duration,\n"
                + "    ci.img AS img\n"
                + "FROM tbl_course AS c\n"
                + "INNER JOIN tbl_bird_type AS bt ON c.type_id = bt.type_id\n"
                + "INNER JOIN tbl_courseImg AS ci ON c.course_id = ci.course_id\n"
                + "WHERE c.category = 'bird training' AND c.status = 'available'";

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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        base64Image);
                list.add(course);
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

    /*GET TOP 3  BIRD COURSE*/
    public List<Course> getTop3BirdCourse() throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select TOP 3 tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img from tbl_course JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "        where tbl_course.category = 'bird training' and tbl_course.status='available'";

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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image);
                list.add(course);
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

    /*GET TOP 3 ONLINE TRAINING*/
    public List<Course> getTop3OnlineTraining() throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select Top 3 tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img from tbl_course JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "where tbl_course.category = 'online' and tbl_course.status='available'";

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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image);
                list.add(course);
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

    public List<Course> getTop1CourseWorkshop() throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select Top 1 tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img from tbl_course JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "where tbl_course.category = 'workshop' and tbl_course.status='available'";

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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image);
                list.add(course);
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

    /*GET COURSE [ COURSE ONLINE] ID*/
    public List<CourseOnline> getAllCourseONLINECourseByCustomerID(int UserID) throws ClassNotFoundException, SQLException, IOException {
        List<CourseOnline> list = new ArrayList<>();
        String sql = "select   tbl_course.title, tbl_courseImg.img  , tbl_course.course_id, tbl_course.content\n"
                + "                		from tbl_course \n"
                + "                		JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "                        JOIN tbl_courseBuy  ON tbl_course.course_id = tbl_courseBuy.course_id \n"
                + "                        where tbl_courseBuy.customer_id = ? ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
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
                CourseOnline course = new CourseOnline(rs.getString(1), base64Image, rs.getString(3), rs.getString(4));

                list.add(course);
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

    /*GET COURSE [ BIRD COURSE ] ID*/
    public List<BirdCourse> getAllCourseBIRDCOURSEByCustomerID(int UserID) throws ClassNotFoundException, SQLException, IOException {
        List<BirdCourse> list = new ArrayList<>();
        String sql = " 					 select c.title, i.img from tbl_booking as b \n"
                + "                           join tbl_course AS c ON b.course_id = c.course_id  \n"
                + "						    join  tbl_courseImg as i ON c.course_id = i.course_id\n"
                + "							where b.customer_id = ? ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
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
                BirdCourse course = new BirdCourse(rs.getString(1), base64Image);
                list.add(course);
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

    /*GET COURSE [ WORKSHOP ] ID*/
    public List<Course> getAllCourseWORKSHOPByCustomerID(int UserID) throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select c.course_id, c.trainer_id, c.staff_id, c.content, c.category, c.title, c.price, i.img, c.start_date, c.end_enroll_date, a.status "
                + "from tbl_attendance as a\n"
                + "   join  tbl_workshopTraining AS t ON a.workshop_id = t.workshop_id\n"
                + "   join  tbl_course as c ON c.course_id = t.course_id\n"
                + "   join  tbl_courseImg as i ON c.course_id = i.course_id\n"
                + "   where a.customer_id = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image,
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getString(11)
                );
                list.add(course);
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

    /*GET COURSE [ WORKSHOP ] ID*/
    public List<AppointmentDDD> getAllCourseAppointmentByCustomeriD(int user_id) {
        List<AppointmentDDD> list = new ArrayList<>();
        String sql = "								 SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id\n"
                + "                      FROM tbl_appointment appointment\n"
                + "                       JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "                     WHERE appointment.customer_id = ? AND appointment.Request_trainer_id IS NOT NULL AND appointment.status IS NOT NULL AND appointment.trainer_id IS  NOT NULL";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                AppointmentDDD app = new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );
                list.add(app);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    String workshopID;

    public String getWorkshopID(String courseID) {

        String sql = "SELECT workshop_id "
                + " FROM tbl_workshopTraining "
                + " WHERE course_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, courseID);
            rs = ps.executeQuery();

            if (rs.next()) {

                workshopID = rs.getString("workshop_id");

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return workshopID;

    }

    public void paymentWorkshop(String workshop_id, Integer customer_id, Date dateCheck, Long amount) throws ClassNotFoundException {

        String sql = "INSERT INTO tbl_attendance (workshop_id, customer_id, dateCheck, amount, payment_id, status) "
                + "VALUES (?, ?, ?, ?, NULL, 'In progress')";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, workshop_id);
            ps.setInt(2, customer_id);
            ps.setDate(3, dateCheck);
            ps.setLong(4, amount);

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public void paymentOnlineCourse(String course_id, Integer customer_id, Date dateCheck, Long amount) throws ClassNotFoundException {

        String sql = "INSERT INTO tbl_courseBuy (course_id, customer_id, date, amount, payment_id) "
                + "VALUES (?, ?, ?, ?, NULL)";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, course_id);
            ps.setInt(2, customer_id);
            ps.setDate(3, dateCheck);
            ps.setLong(4, amount);

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public Workshop getWorkShopDetail(String courseID) {
        String sql = "SELECT  tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img, tbl_course.start_date, tbl_course.end_enroll_date,\n"
                + "                		tbl_workshop_detail.sub_content_1, tbl_workshop_detail.sub_content_2, tbl_workshop_detail.sub_content_3, tbl_workshop_detail.sub_content_4, tbl_trainer.fullname, tbl_course.tracking_status\n"
                + "                FROM tbl_course \n"
                + "                JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "                JOIN tbl_workshop_detail ON tbl_course.course_id = tbl_workshop_detail.course_id\n"
                + "				JOIN tbl_trainer ON tbl_trainer.trainer_id = tbl_course.trainer_id\n"
                + "                AND tbl_course.course_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, courseID);
            rs = ps.executeQuery();

            if (rs.next()) {
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

                return new Workshop(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image,
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(2)
                );
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return null;

    }

    String courseID = "";

    public String getCourseIDbyWorkshopID(int customerID) throws ClassNotFoundException {

        String sql = "SELECT training.course_id\n"
                + "FROM tbl_attendance attendance\n"
                + "JOIN tbl_workshopTraining training\n"
                + "ON attendance.workshop_id = training.workshop_id\n"
                + "WHERE customer_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, customerID);
            rs = ps.executeQuery();

            if (rs.next()) {
                courseID = rs.getString("course_id");
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return courseID;
    }

    public List<Course> getCourseByCourseID(String courseID) {
        List<Course> list = new ArrayList<>();

        String sql = "SELECT course.course_id, course.trainer_id, course.staff_id, course.content, course.category, course.title\n"
                + ", course.price, courseImg.img, course.start_date, course.end_enroll_date\n"
                + "FROM tbl_course course\n"
                + "JOIN tbl_courseImg courseImg ON course.course_id = courseImg.course_id\n"
                + "WHERE course.course_id = ?";

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
                Course course = new Course(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image,
                        rs.getDate(9),
                        rs.getDate(10)
                );
                list.add(course);
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

    public Course getAllCourseAreTraining(int UserID) throws ClassNotFoundException, SQLException, IOException {
//        List<Course> list = new ArrayList<>();
        String sql = "select c.course_id, c.trainer_id, c.staff_id, c.content, c.category, c.title, c.price, i.img, c.start_date, c.end_enroll_date, a.status, a.customer_id, c.tracking_status \n"
                + "   from tbl_attendance as a\n"
                + "   join  tbl_workshopTraining AS t ON a.workshop_id = t.workshop_id\n"
                + "   join  tbl_course as c ON c.course_id = t.course_id\n"
                + "   join  tbl_courseImg as i ON c.course_id = i.course_id\n"
                + "   where c.trainer_id = ? \n"
                + "   and a.status = 'In progress'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
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
                return new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image,
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13)
                );
//                list.add(course);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public List<Course> getAllCourseTrained(int UserID) throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT c.course_id, c.trainer_id, c.staff_id, c.content, c.category, c.title, c.price, i.img, c.start_date, c.end_enroll_date, h.status, h.complete_date, h.history_id\n"
                + "	FROM tbl_course c\n"
                + "	JOIN tbl_history_workshop_training h ON c.course_id = h.course_id\n"
                + "	join  tbl_courseImg as i ON c.course_id = i.course_id\n"
                + "	WHERE h.trainer_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image,
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getString(11),
                        rs.getDate(12),
                        rs.getInt(13)
                );
                list.add(course);
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

    public List<Course> getAllCourseWORKSHOPCompleteByCustomerID(int UserID) throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select c.course_id, c.trainer_id, c.staff_id, c.content, c.category, c.title, c.price, i.img, c.start_date, c.end_enroll_date, a.status, a.complete_date, tr.fullname, a.customer_id, a.certificate, a.attendance\n"
                + "                                from tbl_attendance as a\n"
                + "                                   join  tbl_workshopTraining AS t ON a.workshop_id = t.workshop_id\n"
                + "                                  join  tbl_course as c ON c.course_id = t.course_id\n"
                + "                                   join  tbl_courseImg as i ON c.course_id = i.course_id\n"
                + "                				   join  tbl_trainer as tr ON tr.trainer_id = c.trainer_id\n"
                + "                                   where a.customer_id = ?\n"
                + "                                 and a.status = 'End'\n"
                + "								 ORDER BY a.attendance_id DESC";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image,
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getString(11),
                        rs.getDate(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16)
                );
                list.add(course);
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

    public List<Course> getAllCourseWORKSHOPInprogressByCustomerID(int UserID) throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select c.course_id, c.trainer_id, c.staff_id, c.content, c.category, c.title, c.price, i.img, c.start_date, c.end_enroll_date, a.status, a.complete_date\n"
                + "                from tbl_attendance as a\n"
                + "                   join  tbl_workshopTraining AS t ON a.workshop_id = t.workshop_id\n"
                + "                   join  tbl_course as c ON c.course_id = t.course_id\n"
                + "                   join  tbl_courseImg as i ON c.course_id = i.course_id\n"
                + "                   where a.customer_id = ?\n"
                + "                 and a.status = 'In progress'\n"
                + "				 ORDER BY a.attendance_id DESC";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
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
                Course course = new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image,
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getString(11),
                        rs.getDate(12)
                );
                list.add(course);
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

    int participant;

    public int getNumberOfWorkshopParticipants(int UserID) throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT COUNT(*)\n"
                + "FROM tbl_attendance as a\n"
                + "JOIN  tbl_workshopTraining AS t ON a.workshop_id = t.workshop_id\n"
                + "JOIN  tbl_course as c ON c.course_id = t.course_id\n"
                + "JOIN  tbl_courseImg as i ON c.course_id = i.course_id\n"
                + "WHERE c.trainer_id = ? \n"
                + "AND a.status = 'In progress'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            rs = ps.executeQuery();

            if (rs.next()) {
                participant = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return participant;
    }

    public Course getInfoWorkshopCertificate(int UserID, String courseID, String complete_date) throws ClassNotFoundException, SQLException, IOException {
//        List<Course> list = new ArrayList<>();
        String sql = "select c.course_id, c.trainer_id, c.staff_id, c.content, c.category, c.title, c.price, i.img, c.start_date, c.end_enroll_date, a.status, a.customer_id, c.tracking_status \n"
                + "   from tbl_attendance as a\n"
                + "   join  tbl_workshopTraining AS t ON a.workshop_id = t.workshop_id\n"
                + "   join  tbl_course as c ON c.course_id = t.course_id\n"
                + "   join  tbl_courseImg as i ON c.course_id = i.course_id\n"
                + "   where a.customer_id = ? \n"
                + "   and c.course_id = ? \n"
                + "   and a.complete_date = ? ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setString(2, courseID);
            ps.setString(3, complete_date);
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
                return new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        base64Image,
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13)
                );
//                list.add(course);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException, IOException {
        int userID = 10;
        courseDAO courseDAO = new courseDAO();
        Course course = courseDAO.getAllCourseAreTraining(userID);
        if (course != null) {
            System.out.println("Course details:");
            System.out.println("Course ID: " + course.getTitle());
            // Print other course details as needed
        } else {
            System.out.println("No course found for the specified user ID.");
        }
    }

//edit by duc 10/7/20203 8:42
    public Course getCourseById(String id) throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT \n"
                + "    c.course_id,\n"
                + "    bt.type_name,\n"
                + "    c.content,\n"
                + "    c.category,\n"
                + "    c.title,\n"
                + "    c.price,\n"
                + "    c.duration,\n"
                + "    ci.img AS img\n"
                + "FROM tbl_course AS c\n"
                + "INNER JOIN tbl_bird_type AS bt ON c.type_id = bt.type_id\n"
                + "INNER JOIN tbl_courseImg AS ci ON c.course_id = ci.course_id\n"
                + "WHERE c.course_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
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
                return new Course(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        base64Image);

            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public void createBirdCourse(int course_id, String content, String category, String title, int price, int duration, String type) {
        String sql = "insert into tbl_course(course_id, trainer_id, staff_id, content, category, title, price, duration, end_enroll_date, start_date, status, type_id)"
                + " values(?,NULL,NULL,?,?,?,?,?,NULL,NULL,'available', ?)";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, course_id);
            ps.setString(2, content);
            ps.setString(3, category);
            ps.setString(4, title);
            ps.setInt(5, price);
            ps.setInt(6, duration);
            ps.setString(7, type);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public void UpdateBirdCourse(int course_id, String content, String title, int price, int duration) {
//        String sql = "Update tbl_course(course_id, trainer_id, staff_id, content, category, title, price, duration, end_enroll_date, start_date, status)"
        String sql = "Update tbl_course set content=?, title=?, price=?, duration=?"
                + " where course_id= ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, content);
            ps.setString(2, title);
            ps.setInt(3, price);
            ps.setInt(4, duration);
            ps.setInt(5, course_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public int generateCourseID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_course WHERE course_id = (SELECT MAX(TRY_CAST(course_id AS INT))FROM tbl_course)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXconsultationID = rs.getInt("course_id");
                newID = MAXconsultationID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;
    }

    public int generateCourseImgID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_courseImg WHERE id = (SELECT MAX(TRY_CAST(id AS INT))FROM tbl_courseImg)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXconsultationID = rs.getInt("id");
                newID = MAXconsultationID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;
    }

    public void createBirdCourseImg(int id, int course_id, String img) {
        String sql = "insert into tbl_courseImg(id, course_id, img) values(?,?,?)";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, course_id);
            ps.setBytes(3, Base64.getDecoder().decode(img));
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public void UpdateBirdCourseImg(int course_id, String img) {
        String sql = "update tbl_courseImg set img=? where course_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setBytes(1, Base64.getDecoder().decode(img));
            ps.setInt(2, course_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public void deleteCourse(int course_id) {
        String sql = "update tbl_course set status='unavailable' where course_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, course_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public List getCourses() {
        List<Course> list = new ArrayList<>();

        String sql = "select course_id, content, category, title, price, duration "
                + "from tbl_course "
                + "where status='available'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
                list.add(course);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return list;
    }

}
