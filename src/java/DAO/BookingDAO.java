/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.BookingDTO;
import entity.Course;
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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import org.apache.catalina.Server;

/**
 *
 * @author hoang
 */
public class BookingDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public List<BookingDTO> getAllCourseEnrolledbyID(int userID) throws ClassNotFoundException, SQLException, IOException {
        List<BookingDTO> list = new ArrayList<>();
        String sql = "select b.customer_id,c.course_id , c.trainer_id,bd.name , bd.type  ,  c.category , c.title,c.price, i.img ,b.start_date , b.end_date,b.status,b.amount,b.payment_id from tbl_course as c\n"
                + "                 JOIN tbl_courseImg  as i ON c.course_id = i.course_id\n"
                + "				 JOIN tbl_booking as b  ON   c.course_id = b.course_id\n"
                + "				 JOIN tbl_bird   as  bd  ON  bd.bird_id =  b.bird_id\n"
                + "				 where b.customer_id = ?";
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
                BookingDTO booking = new BookingDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        base64Image,
                        rs.getDate(10),
                        rs.getDate(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getInt(14));
                list.add(booking);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public void addNewBooking(int customer_id, int bird_id, int course_id, int amount, Date preffered_date, int booking_id) throws SQLException {
        LocalDate create_date = LocalDate.now();
        String sql = "Insert into tbl_Booking(trainer_id, course_id, customer_id, start_date, end_date, status, amount, payment_id, create_date, preferred_date, checkout_date, Booking_id, bird_id)\n"
                + "values(NULL, ?, ?, NULL, NULL, 'pending', ?, NULL, ?, ?, NULL, ?, ?) ";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, course_id);
            ps.setInt(2, customer_id);
            ps.setInt(3, amount);
            ps.setDate(4, Date.valueOf(create_date));
            ps.setDate(5, preffered_date);
            ps.setInt(6, booking_id);
            ps.setInt(7, bird_id);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public List getCompletedBooking() throws SQLException {
        List<BookingDTO> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    c.fullname AS customer_fullname,\n"
                + "    co.title AS course_title,\n"
                + "    co.price AS course_price,\n"
                + "    tr.fullname AS trainer_fullname,\n"
                + "    bd.name AS bird_name,\n"
                + "    bt.type_name AS bird_type,\n"
                + "    b.start_date AS booking_start_date,\n"
                + "    b.end_date AS booking_end_date,\n"
                + "    b.checkout_date AS booking_checkout_date,\n"
                + "    b.Booking_id\n"
                + "FROM tbl_Booking AS b\n"
                + "INNER JOIN tbl_customer AS c ON b.customer_id = c.customer_id\n"
                + "INNER JOIN tbl_course AS co ON b.course_id = co.course_id\n"
                + "INNER JOIN tbl_trainer AS tr ON b.trainer_id = tr.trainer_id\n"
                + "INNER JOIN tbl_bird AS bd ON b.bird_id = bd.bird_id\n"
                + "INNER JOIN tbl_bird_type AS bt ON bd.type_id = bt.type_id\n"
                + "WHERE b.status = 'checkout'\n"
                + "ORDER BY b.end_date DESC";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BookingDTO booking = new BookingDTO(rs.getString(4), rs.getString(2), rs.getInt(3), rs.getString(1), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getDate(8), rs.getDate(9), rs.getString(10));
                list.add(booking);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List getProcessingBooking() throws SQLException {
        List<BookingDTO> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    c.fullname AS customer_fullname,\n"
                + "    co.title AS course_title,\n"
                + "    co.price AS course_price,\n"
                + "    tr.fullname AS trainer_fullname,\n"
                + "    b.Booking_id,\n"
                + "	bd.name,\n"
                + "    bt.type_name AS bird_type,\n"
                + "    b.status AS booking_status,\n"
                + "    b.start_date AS booking_start_date,\n"
                + "    b.end_date AS booking_end_date,\n"
                + "    b.create_date AS booking_create_date\n"
                + "FROM tbl_Booking AS b\n"
                + "INNER JOIN tbl_customer AS c ON b.customer_id = c.customer_id\n"
                + "INNER JOIN tbl_course AS co ON b.course_id = co.course_id\n"
                + "INNER JOIN tbl_trainer AS tr ON b.trainer_id = tr.trainer_id\n"
                + "INNER JOIN tbl_bird AS bd ON b.bird_id = bd.bird_id\n"
                + "INNER JOIN tbl_bird_type AS bt ON bd.type_id = bt.type_id\n"
                + "WHERE b.status IN ('checkin', 'approved', 'in-training')\n"
                + "ORDER BY b.create_date DESC";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BookingDTO booking = new BookingDTO(rs.getString(4), rs.getString(2), rs.getInt(3), rs.getString(1), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDate(9), rs.getDate(10), rs.getString(8), rs.getDate(11));
                list.add(booking);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List getHistory() throws SQLException {
        List<BookingDTO> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    c.fullname AS customer_fullname,\n"
                + "    co.title AS course_title,\n"
                + "    co.price AS course_price,\n"
                + "    tr.fullname AS trainer_fullname,\n"
                + "    b.Booking_id,\n"
                + "    bd.name,\n"
                + "    bt.type_name AS bird_type,\n"
                + "    b.status AS booking_status,\n"
                + "    b.start_date AS booking_start_date,\n"
                + "    b.end_date AS booking_end_date,\n"
                + "    b.create_date AS booking_create_date\n"
                + "FROM tbl_Booking AS b\n"
                + "INNER JOIN tbl_customer AS c ON b.customer_id = c.customer_id\n"
                + "INNER JOIN tbl_course AS co ON b.course_id = co.course_id\n"
                + "INNER JOIN tbl_trainer AS tr ON b.trainer_id = tr.trainer_id\n"
                + "INNER JOIN tbl_bird AS bd ON b.bird_id = bd.bird_id\n"
                + "INNER JOIN tbl_bird_type AS bt ON bd.type_id = bt.type_id\n"
                + "WHERE b.status = 'completed'\n"
                + "ORDER BY b.create_date DESC";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BookingDTO booking = new BookingDTO(rs.getString(4), rs.getString(2), rs.getInt(3), rs.getString(1), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDate(9), rs.getDate(10), rs.getString(8), rs.getDate(11));
                list.add(booking);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public int getDurationOfBookingByBirdID(int booking_id) throws SQLException {
        int duration = 0;
        String sql = "SELECT\n"
                + "    co.duration\n"
                + "FROM\n"
                + "    tbl_Booking bk\n"
                + "    INNER JOIN tbl_course co ON bk.course_id = co.course_id\n"
                + "WHERE\n"
                + "    bk.Booking_id = ?;";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, booking_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                duration = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return duration;
    }

    public void startBoooking(int booking_id) throws SQLException {
        LocalDate startDate = LocalDate.now();
        int duration = getDurationOfBookingByBirdID(booking_id);
        LocalDate endDate = startDate.plusDays(duration);

        String sql = "Update tbl_Booking Set start_date = ?, end_date = ?, status = 'checkin'\n"
                + "Where Booking_id = ? ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(3, booking_id);
            ps.setDate(1, (Date.valueOf(startDate)));
            ps.setDate(2, (Date.valueOf(endDate)));
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void setTrainerToBooking(int trainer_id, int booking_id) throws SQLException {
        LocalDate startDate = LocalDate.now();
        int duration = getDurationOfBookingByBirdID(booking_id);
        LocalDate endDate = startDate.plusDays(duration);

        String sql = "Update tbl_Booking Set trainer_id = ?, status = 'approved'\n"
                + "Where Booking_id = ? ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, trainer_id);
            ps.setInt(2, booking_id);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void denyBooking(int booking_id) throws SQLException {
        String sql = "Update tbl_Booking Set status = 'denied'\n"
                + "Where Booking_id = ? ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, booking_id);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void updateStatus(int booking_id, String status) throws SQLException {
        String sql = "Update tbl_Booking Set status = ?\n"
                + "Where Booking_id = ? ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, booking_id);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void checkOutBooking(int booking_id) throws SQLException {
        LocalDate checkout_date = LocalDate.now();

        String sql = "Update tbl_Booking Set status = 'completed', checkout_date = ?\n"
                + "Where Booking_id = ? ";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setDate(1, Date.valueOf(checkout_date));
            ps.setInt(2, booking_id);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public BookingDTO getCourseByTrainerID(int trainer_id) throws SQLException, IOException, ClassNotFoundException {
        BookingDTO booking = null;

        String sql = "SELECT \n"
                + "    c.customer_id,\n"
                + "    co.title AS course_title,\n"
                + "    bd.bird_img AS img,\n"
                + "    b.Booking_id,\n"
                + "    bd.name AS bird_name,\n"
                + "    bt.type_name AS bird_type,\n"
                + "    b.start_date AS booking_start_date,\n"
                + "    b.end_date AS booking_end_date,\n"
                + "    b.status AS booking_status\n"
                + "FROM tbl_Booking AS b\n"
                + "INNER JOIN tbl_customer AS c ON b.customer_id = c.customer_id\n"
                + "INNER JOIN tbl_bird AS bd ON b.bird_id = bd.bird_id\n"
                + "INNER JOIN tbl_bird_type AS bt ON bd.type_id = bt.type_id\n"
                + "INNER JOIN tbl_course AS co ON b.course_id = co.course_id\n"
                + "WHERE b.trainer_id = ? AND b.status IN ('approved','in-training','checkin')";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, trainer_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                String img = null;
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
                    img = Base64.getEncoder().encodeToString(imageBytes);
                    inputStream.close();
                    outputStream.close();
                } else {
                    img = "default";
                }
                booking = new BookingDTO(rs.getString(1), rs.getString(2), img, rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getDate(8), rs.getString(9));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return booking;
    }

    public BookingDTO getBookingByBirdID(int booking_id) throws SQLException, ClassNotFoundException {
        BookingDTO booking = null;

        String sql = "SELECT \n"
                + "    b.Booking_id,\n"
                + "    c.fullname AS customer_fullname,\n"
                + "    co.title AS course_title,\n"
                + "    co.price AS course_price,\n"
                + "    tr.fullname AS trainer_fullname,\n"
                + "    bd.bird_id,\n"
                + "    bd.name AS bird_name,\n"
                + "    bt.type_name AS bird_type,\n"
                + "    b.status AS booking_status,\n"
                + "    b.start_date AS booking_start_date,\n"
                + "    b.end_date AS booking_end_date,\n"
                + "    b.create_date AS booking_create_date,\n"
                + "    b.preferred_date AS booking_preferred_date,\n"
                + "    b.checkout_date AS booking_checkout_date\n,"
                + "    c.customer_id\n"
                + "FROM tbl_Booking AS b\n"
                + "INNER JOIN tbl_customer AS c ON b.customer_id = c.customer_id\n"
                + "INNER JOIN tbl_course AS co ON b.course_id = co.course_id\n"
                + "INNER JOIN tbl_trainer AS tr ON b.trainer_id = tr.trainer_id\n"
                + "INNER JOIN tbl_bird AS bd ON b.bird_id = bd.bird_id\n"
                + "INNER JOIN tbl_bird_type AS bt ON bd.type_id = bt.type_id\n"
                + "WHERE b.Booking_id = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, booking_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                booking = new BookingDTO(rs.getString(1), rs.getString(5), rs.getString(3), rs.getInt(4), rs.getString(2), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(10), rs.getDate(11), rs.getString(9), rs.getDate(12), rs.getDate(13), rs.getDate(14), rs.getString(15));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return booking;
    }

    public List<BookingDTO> getCourseByCustomerID(int customer_id) throws SQLException, IOException, ClassNotFoundException {

        List<BookingDTO> listBooking = new ArrayList<>();
        BookingDTO booking = null;

        String sql = "SELECT \n"
                + "    co.course_id,\n"
                + "    co.title AS course_title,\n"
                + "    bd.bird_img AS img,\n"
                + "    tr.trainer_id,\n"
                + "    tr.fullname AS trainer_fullname,\n"
                + "    tr.img AS trainer_img,\n"
                + "    b.Booking_id,\n"
                + "    bd.name AS bird_name,\n"
                + "    bt.type_name AS bird_type,\n"
                + "    b.start_date AS booking_start_date,\n"
                + "    b.end_date AS booking_end_date,\n"
                + "    b.status AS booking_status\n"
                + "FROM tbl_Booking AS b\n"
                + "INNER JOIN tbl_bird AS bd ON b.bird_id = bd.bird_id\n"
                + "INNER JOIN tbl_bird_type AS bt ON bd.type_id = bt.type_id\n"
                + "INNER JOIN tbl_course AS co ON b.course_id = co.course_id\n"
                + "INNER JOIN tbl_trainer AS tr ON b.trainer_id = tr.trainer_id\n"
                + "WHERE b.status IN ('approved', 'checkin', 'in-training', 'checkout') \n"
                + "AND b.customer_id = ?";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, customer_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                String courseImg = null;
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
                    courseImg = Base64.getEncoder().encodeToString(imageBytes);
                    inputStream.close();
                    outputStream.close();
                } else {
                    courseImg = "default";
                }

                String trainerImg = null;
                Blob blob1 = rs.getBlob("trainer_img");
                if (blob1 != null) {
                    InputStream inputStream = blob1.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imageBytes = outputStream.toByteArray();
                    trainerImg = Base64.getEncoder().encodeToString(imageBytes);
                    inputStream.close();
                    outputStream.close();
                } else {
                    trainerImg = "default";
                }

                booking = new BookingDTO(rs.getString(1), rs.getString(2), courseImg, rs.getString(4), rs.getString(5), trainerImg, rs.getString(7), rs.getString(8), rs.getString(9), rs.getDate(10), rs.getDate(11), rs.getString(12));
                listBooking.add(booking);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listBooking;
    }

    public List getCompletedOrder() throws SQLException {
        List<BookingDTO> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "    b.bird_id,\n"
                + "    c.fullname AS customer_name,\n"
                + "    co.title,\n"
                + "    bk.start_date,\n"
                + "    co.price\n"
                + "FROM\n"
                + "    tbl_Booking bk\n"
                + "    INNER JOIN tbl_customer c ON bk.customer_id = c.customer_id\n"
                + "    INNER JOIN tbl_course co ON bk.course_id = co.course_id\n"
                + "    INNER JOIN tbl_bird b ON bk.bird_id = b.bird_id\n"
                + "WHERE\n"
                + "    bk.status = 'completed';";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BookingDTO booking = new BookingDTO(rs.getString(1), rs.getString(3), rs.getInt(5), rs.getString(2), rs.getDate(4));
                list.add(booking);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List getHistoryByTrainerID(int trainer_id) throws SQLException {
        List<BookingDTO> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    c.fullname AS customer_fullname,\n"
                + "    co.title AS course_title,\n"
                + "    co.price AS course_price,\n"
                + "    tr.fullname AS trainer_fullname,\n"
                + "    b.Booking_id,\n"
                + "    bd.name AS bird_name,\n"
                + "    bt.type_name AS bird_type,\n"
                + "    b.status AS booking_status,\n"
                + "    b.start_date AS booking_start_date,\n"
                + "    b.end_date AS booking_end_date,\n"
                + "    b.checkout_date AS booking_checkout_date\n"
                + "FROM tbl_Booking AS b\n"
                + "INNER JOIN tbl_customer AS c ON b.customer_id = c.customer_id\n"
                + "INNER JOIN tbl_bird AS bd ON b.bird_id = bd.bird_id\n"
                + "INNER JOIN tbl_bird_type AS bt ON bd.type_id = bt.type_id\n"
                + "INNER JOIN tbl_course AS co ON b.course_id = co.course_id\n"
                + "INNER JOIN tbl_trainer AS tr ON b.trainer_id = tr.trainer_id\n"
                + "WHERE b.trainer_id = ? AND b.status = 'checkout'\n"
                + "ORDER BY b.checkout_date DESC";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, trainer_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                BookingDTO booking = new BookingDTO(rs.getString(4), rs.getString(2), rs.getInt(3), rs.getString(1), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDate(9), rs.getDate(10), rs.getString(8), rs.getDate(11));
                list.add(booking);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List<BookingDTO> getCourseHistoryByCustomerID(int customer_id) throws SQLException, IOException, ClassNotFoundException {

        List<BookingDTO> listBooking = new ArrayList<>();
        BookingDTO booking = null;

        String sql = "SELECT \n"
                + "    co.course_id,\n"
                + "    co.title AS course_title,\n"
                + "    bd.bird_img AS img,\n"
                + "    tr.trainer_id,\n"
                + "    tr.fullname AS trainer_fullname,\n"
                + "    tr.img AS trainer_img,\n"
                + "    b.Booking_id,\n"
                + "    bd.name AS bird_name,\n"
                + "    bt.type_name AS bird_type,\n"
                + "    b.start_date AS booking_start_date,\n"
                + "    b.end_date AS booking_end_date,\n"
                + "    b.status\n"
                + "FROM tbl_Booking AS b\n"
                + "INNER JOIN tbl_customer AS c ON b.customer_id = c.customer_id\n"
                + "INNER JOIN tbl_bird AS bd ON b.bird_id = bd.bird_id\n"
                + "INNER JOIN tbl_bird_type AS bt ON bd.type_id = bt.type_id\n"
                + "INNER JOIN tbl_course AS co ON b.course_id = co.course_id\n"
                + "INNER JOIN tbl_trainer AS tr ON b.trainer_id = tr.trainer_id\n"
                + "WHERE b.customer_id = ? AND b.status = 'completed'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, customer_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                String courseImg = null;
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
                    courseImg = Base64.getEncoder().encodeToString(imageBytes);
                    inputStream.close();
                    outputStream.close();
                } else {
                    courseImg = "default";
                }

                String trainerImg = null;
                Blob blob1 = rs.getBlob("trainer_img");
                if (blob1 != null) {
                    InputStream inputStream = blob1.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imageBytes = outputStream.toByteArray();
                    trainerImg = Base64.getEncoder().encodeToString(imageBytes);
                    inputStream.close();
                    outputStream.close();
                } else {
                    trainerImg = "default";
                }

                booking = new BookingDTO(rs.getString(1), rs.getString(2), courseImg, rs.getString(4), rs.getString(5), trainerImg, rs.getString(7), rs.getString(8), rs.getString(9), rs.getDate(10), rs.getDate(11), rs.getString(12));
                listBooking.add(booking);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listBooking;
    }

//////////////////////////////////////////    31/07/2023 /////////////////////////////////////////////////
    public int generateBookingID() {
        String sql = "SELECT * FROM tbl_Booking WHERE Booking_id = (SELECT MAX(TRY_CAST(Booking_id AS INT))FROM tbl_Booking)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXconsultationID = rs.getInt("Booking_id");
                newID = MAXconsultationID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;
    }

    public BookingDTO getCourseByBookingID(int booking_id) throws SQLException, ClassNotFoundException {
        BookingDTO booking = null;

        String sql = "SELECT \n"
                + "    b.Booking_id,\n"
                + "    c.fullname AS customer_fullname,\n"
                + "    bd.name AS bird_name,\n"
                + "    bt.type_name AS bird_type,\n"
                + "    co.price AS course_price,\n"
                + "    co.title AS course_title,\n"
                + "    b.create_date AS booking_create_date,\n"
                + "    b.preferred_date AS booking_preferred_date\n"
                + "FROM tbl_Booking AS b\n"
                + "INNER JOIN tbl_customer AS c ON b.customer_id = c.customer_id\n"
                + "INNER JOIN tbl_bird AS bd ON b.bird_id = bd.bird_id\n"
                + "INNER JOIN tbl_bird_type AS bt ON bd.type_id = bt.type_id\n"
                + "INNER JOIN tbl_course AS co ON b.course_id = co.course_id\n"
                + "WHERE b.Booking_id = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, booking_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                booking = new BookingDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getDate(7), rs.getDate(8));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return booking;
    }

    public List getPendingOrder() throws SQLException {
        List<BookingDTO> list = new ArrayList<>();
        String sql = "SELECT b.Booking_id, c.fullname, bt.type_name, co.title, b.create_date\n"
                + "FROM tbl_Booking AS b\n"
                + "INNER JOIN tbl_customer AS c ON b.customer_id = c.customer_id\n"
                + "INNER JOIN tbl_bird AS bd ON b.bird_id = bd.bird_id\n"
                + "INNER JOIN tbl_bird_type AS bt ON bd.type_id = bt.type_id\n"
                + "INNER JOIN tbl_course AS co ON b.course_id = co.course_id\n"
                + "WHERE b.status = 'pending'\n"
                + "ORDER BY b.create_date DESC;";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BookingDTO booking = new BookingDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5));
                list.add(booking);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List getHistoryBookingByFilter(String title) throws SQLException {
        List<BookingDTO> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    c.fullname AS customer_fullname,\n"
                + "    co.title AS course_title,\n"
                + "    co.price AS course_price,\n"
                + "    tr.fullname AS trainer_fullname,\n"
                + "    b.Booking_id,\n"
                + "    bd.name,\n"
                + "    bt.type_name AS bird_type,\n"
                + "    b.status AS booking_status,\n"
                + "    b.start_date AS booking_start_date,\n"
                + "    b.end_date AS booking_end_date,\n"
                + "    b.create_date AS booking_create_date\n"
                + "FROM tbl_Booking AS b\n"
                + "INNER JOIN tbl_customer AS c ON b.customer_id = c.customer_id\n"
                + "INNER JOIN tbl_course AS co ON b.course_id = co.course_id\n"
                + "INNER JOIN tbl_trainer AS tr ON co.trainer_id = tr.trainer_id\n"
                + "INNER JOIN tbl_bird AS bd ON b.bird_id = bd.bird_id\n"
                + "INNER JOIN tbl_bird_type AS bt ON bd.type_id = bt.type_id\n"
                + "WHERE b.status = 'checkout' AND co.title = ?\n"
                + "ORDER BY b.create_date DESC";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, title);
            rs = ps.executeQuery();
            while (rs.next()) {
                BookingDTO booking = new BookingDTO(rs.getString(4), rs.getString(2), rs.getInt(3), rs.getString(1), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDate(9), rs.getDate(10), rs.getString(8), rs.getDate(11));
                list.add(booking);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public BookingDTO getCertiByBookingID(int booking_id) throws SQLException, ClassNotFoundException {
        BookingDTO booking = null;

        String sql = "SELECT \n"
                + "    cu.fullname AS customer_fullname,\n"
                + "    b.name AS bird_name,\n"
                + "    bt.type_name AS bird_type_name,\n"
                + "    co.title AS course_title,\n"
                + "    tr.fullname AS trainer_fullname,\n"
                + "    bk.end_date AS booking_end_date\n"
                + "FROM tbl_Booking AS bk\n"
                + "INNER JOIN tbl_customer AS cu ON bk.customer_id = cu.customer_id\n"
                + "INNER JOIN tbl_bird AS b ON bk.bird_id = b.bird_id\n"
                + "INNER JOIN tbl_bird_type AS bt ON b.type_id = bt.type_id\n"
                + "INNER JOIN tbl_course AS co ON bk.course_id = co.course_id\n"
                + "INNER JOIN tbl_trainer AS tr ON bk.trainer_id = tr.trainer_id\n"
                + "WHERE bk.Booking_id = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, booking_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                booking = new BookingDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return booking;
    }

}
