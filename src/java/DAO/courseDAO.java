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
                + "where tbl_course.title like ?";

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
        String sql = "select tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img, tbl_course.start_date, tbl_course.end_enroll_date\n" +
                    "from tbl_course JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n" +
"                where tbl_course.category = 'workshop'";
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

    /*GET ALL ONLINE TRAINING*/
    public List<Course> getAllCourseOnlineTraining() throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img from tbl_course JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "where tbl_course.category = 'online'";

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
                + "			 where tbl_courseBuy.customer_id = ?";

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
        String sql = "select tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img from tbl_course JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "where tbl_course.category = 'bird training'";

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

    /*GET TOP 3  BIRD COURSE*/
    public List<Course> getTop3BirdCourse() throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select TOP 3 tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img from tbl_course JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "        where tbl_course.category = 'bird training'";

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
                + "where tbl_course.category = 'online'";

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
                + "where tbl_course.category = 'workshop'";

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
        String sql = " 					 select   tbl_course.title, tbl_courseImg.img   from tbl_course JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "                                      JOIN tbl_courseBuy  ON tbl_course.course_id = tbl_courseBuy.course_id \n"
                + "                               	 where tbl_courseBuy.customer_id = ? ";

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
                CourseOnline course = new CourseOnline(rs.getString(1), base64Image);

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
                + "from tbl_attendance as a\n" +
"   join  tbl_workshopTraining AS t ON a.workshop_id = t.workshop_id\n" +
"   join  tbl_course as c ON c.course_id = t.course_id\n" +
"   join  tbl_courseImg as i ON c.course_id = i.course_id\n" +
"   where a.customer_id = ?";
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

    public Course getWorkShopDetail(String courseID) {
        String sql = "select  tbl_course.course_id , tbl_course.trainer_id, tbl_course.staff_id , tbl_course.content ,  tbl_course.category , tbl_course.title,tbl_course.price, tbl_courseImg.img, tbl_course.start_date, tbl_course.end_enroll_date  from tbl_course \n"
                + "			JOIN tbl_courseImg ON tbl_course.course_id = tbl_courseImg.course_id\n"
                + "            where tbl_course.category = 'workshop'\n"
                + "			and tbl_course.course_id = ?";

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

                return new Course(rs.getString(1),
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
           }

        } catch (Exception e) {
            System.out.println(e);
        }

        return null;

    }
    
    
    String courseID = "";
    public String getCourseIDbyWorkshopID (int customerID) throws ClassNotFoundException {
        
        
        String sql = "SELECT training.course_id\n" +
                    "FROM tbl_attendance attendance\n" +
                    "JOIN tbl_workshopTraining training\n" +
                    "ON attendance.workshop_id = training.workshop_id\n" +
                    "WHERE customer_id = ?";
        
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
    
    
    
    public List<Course> getCourseByCourseID (String courseID) {
        List<Course> list = new ArrayList<>();
        
        String sql = "SELECT course.course_id, course.trainer_id, course.staff_id, course.content, course.category, course.title\n" +
                    ", course.price, courseImg.img, course.start_date, course.end_enroll_date\n" +
                    "FROM tbl_course course\n" +
                    "JOIN tbl_courseImg courseImg ON course.course_id = courseImg.course_id\n" +
                    "WHERE course.course_id = ?";
        
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
    
    
       public List<Course> getAllCourseAreTraining(int UserID) throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select c.course_id, c.trainer_id, c.staff_id, c.content, c.category, c.title, c.price, i.img, c.start_date, c.end_enroll_date, a.status, a.customer_id \n" +
                    "   from tbl_attendance as a\n" +
                    "   join  tbl_workshopTraining AS t ON a.workshop_id = t.workshop_id\n" +
                    "   join  tbl_course as c ON c.course_id = t.course_id\n" +
                    "   join  tbl_courseImg as i ON c.course_id = i.course_id\n" +
                    "   where c.trainer_id = ? \n" +
                    "   and status = 'In progress'";

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
                        rs.getString(12)
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
       
       
       public List<Course> getAllCourseTrained(int UserID) throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select c.course_id, c.trainer_id, c.staff_id, c.content, c.category, c.title, c.price, i.img, c.start_date, c.end_enroll_date, a.status \n" +
                    "   from tbl_attendance as a\n" +
                    "   join  tbl_workshopTraining AS t ON a.workshop_id = t.workshop_id\n" +
                    "   join  tbl_course as c ON c.course_id = t.course_id\n" +
                    "   join  tbl_courseImg as i ON c.course_id = i.course_id\n" +
                    "   where c.trainer_id = ? \n" +
                    "   and status = 'Complete'";

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
       public List<Course> getAllCourseWORKSHOPCompleteByCustomerID(int UserID) throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select c.course_id, c.trainer_id, c.staff_id, c.content, c.category, c.title, c.price, i.img, c.start_date, c.end_enroll_date, a.status "
                + "from tbl_attendance as a\n" +
"   join  tbl_workshopTraining AS t ON a.workshop_id = t.workshop_id\n" +
"   join  tbl_course as c ON c.course_id = t.course_id\n" +
"   join  tbl_courseImg as i ON c.course_id = i.course_id\n" +
"   where a.customer_id = ?"
                + " and a.status = 'Complete'";

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
    
        public List<Course> getAllCourseWORKSHOPInprogressByCustomerID(int UserID) throws ClassNotFoundException, SQLException, IOException {
        List<Course> list = new ArrayList<>();
        String sql = "select c.course_id, c.trainer_id, c.staff_id, c.content, c.category, c.title, c.price, i.img, c.start_date, c.end_enroll_date, a.status "
                + "from tbl_attendance as a\n" +
"   join  tbl_workshopTraining AS t ON a.workshop_id = t.workshop_id\n" +
"   join  tbl_course as c ON c.course_id = t.course_id\n" +
"   join  tbl_courseImg as i ON c.course_id = i.course_id\n" +
"   where a.customer_id = ?"
                + " and a.status = 'In progress'";

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
}
