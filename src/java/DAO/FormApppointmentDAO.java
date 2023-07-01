/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import entity.AppointmentDDD;
import entity.AppointmentDTO;
import entity.BookingDTO;
import entity.Course;
import entity.FormAppointmentDTO;
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
import java.sql.Time;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 *
 * @author hoang
 */
public class FormApppointmentDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public void InputFormAppointment(int ConsultationID, int CustomerID, Date Stardate, String amount, String Note, String Address, String Type, String requestTrainerID, Time Duration, Date DateSubmit, String fullname, String gmail, String contact)
            throws ClassNotFoundException, SQLException, IOException {
        String sql = "insert into tbl_appointment(consultation_id , trainer_id,customer_id , date ,amount, payment_id , note, address , type ,present_price , status,tracking,Request_trainer_id,duration,DateSubmit,history,fullname,gmail,contact)\n"
                + "                values(?,NULL,?,?,?,4,? ,?,?,200,NULL,NULL,?,?,?,NULL,?,?,?)";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, ConsultationID);
            ps.setInt(2, CustomerID);
            ps.setDate(3, Stardate);
            ps.setString(4, amount);
            ps.setString(5, Note);
            ps.setString(6, Address);
            ps.setString(7, Type);
            ps.setString(8, requestTrainerID);
            ps.setTime(9, Duration);
            ps.setDate(10, DateSubmit);
            ps.setString(11, fullname);
            ps.setString(12, gmail);
            ps.setString(13, contact);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

    }

    //ham genertrate consultation ID
    public int GenerateConsultationID() throws ClassNotFoundException, SQLException, IOException {
        String sql = "SELECT * FROM tbl_appointment WHERE consultation_id = (SELECT MAX(TRY_CAST(consultation_id AS INT))FROM tbl_appointment)";
        int newID = 0;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int MAXconsultationID = rs.getInt("consultation_id");
                newID = MAXconsultationID + 1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return newID;

    }

    // * get form consultaiton 
    public List<FormAppointmentDTO> getAllPraivateConslutationbyID(int userID) throws ClassNotFoundException, SQLException, IOException {
        List<FormAppointmentDTO> list = new ArrayList<>();
        String sql = " select consultation_id , trainer_id,customer_id , date ,amount, payment_id , note, address , type ,present_price , status,tracking,Request_trainer_id from tbl_appointment\n"
                + "                where customer_id = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                FormAppointmentDTO appointment = new FormAppointmentDTO(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13));
                list.add(appointment);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public List<AppointmentDDD> getAppointmentFormPending() {
        List<AppointmentDDD> list = new ArrayList<>();

        String sql = "select customer.customer_id , appointment.consultation_id, customer.fullname as customer_fullname, appointment.date, appointment.note, appointment.address,  appointment.type, appointment.status ,appointment.Request_trainer_id,appointment.duration , appointment.DateSubmit,appointment.amount,appointment.fullname,appointment.gmail,appointment.contact\n"
                + "                                              from tbl_appointment appointment  \n"
                + "                                                         join tbl_customer customer on customer.customer_id = appointment.customer_id\n"
                + "                                               WHERE appointment.status IS NULL ORDER BY appointment.consultation_id DESC";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String dateString = rs.getString(4);
                java.sql.Date date = java.sql.Date.valueOf(dateString);
                String dateStringsubmit = rs.getString(11);
                java.sql.Date datesubmit = java.sql.Date.valueOf(dateStringsubmit);
                AppointmentDDD appointment = new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTime(10),
                        datesubmit,
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                );
                list.add(appointment);

            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;

    }

    public List<AppointmentDDD> getAppointmentFormProcessing() {
        List<AppointmentDDD> list = new ArrayList<>();

        String sql = " SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id, appointment.duration , appointment.DateSubmit,appointment.amount,appointment.fullname,appointment.gmail,appointment.contact\n"
                + "              FROM tbl_appointment appointment\n"
                + "              JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "              WHERE  appointment.Request_trainer_id IS NOT NULL AND appointment.status IS NOT  NULL AND trainer_id IS NOT NULL and appointment.tracking IS NULL ORDER BY CONVERT(INT, appointment.consultation_id) DESC;";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                String dateStringsubmit = rs.getString(11);
                java.sql.Date datesubmit = java.sql.Date.valueOf(dateStringsubmit);
                AppointmentDDD appointment = new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTime(10),
                        datesubmit,
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                );
                list.add(appointment);

            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;

    }

    /*GET COMPLETED FORM*/
    public List<AppointmentDDD> getAppointmentFormCompleted() {
        List<AppointmentDDD> list = new ArrayList<>();

        String sql = "             SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id, appointment.duration , appointment.DateSubmit,appointment.amount,appointment.fullname,appointment.gmail,appointment.contact\n"
                + "              FROM tbl_appointment appointment\n"
                + "              JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "              WHERE  appointment.tracking = 'complete' and appointment.history IS NULL ORDER BY CONVERT(INT, appointment.consultation_id) DESC;";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                String dateStringsubmit = rs.getString(11);
                java.sql.Date datesubmit = java.sql.Date.valueOf(dateStringsubmit);
                AppointmentDDD appointment = new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTime(10),
                        datesubmit,
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                );
                list.add(appointment);

            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;

    }

    /*HISTORY*/
    public List<AppointmentDDD> getAppointmentFormHistory() {
        List<AppointmentDDD> list = new ArrayList<>();

        String sql = "  SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id, appointment.duration , appointment.DateSubmit,appointment.amount,appointment.fullname,appointment.gmail,appointment.contact\n"
                + "              FROM tbl_appointment appointment\n"
                + "              JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "              WHERE /*appointment.consultation_id = 1 AND*/ appointment.history = 'yes' ORDER BY CONVERT(INT, appointment.consultation_id) DESC;";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                String dateStringsubmit = rs.getString(11);
                java.sql.Date datesubmit = java.sql.Date.valueOf(dateStringsubmit);
                AppointmentDDD appointment = new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTime(10),
                        datesubmit,
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                );
                list.add(appointment);

            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;

    }

    public List<AppointmentDDD> getAppointmentFormCUSchooseTRAINER() throws ClassNotFoundException, SQLException, IOException {
        List<AppointmentDDD> list = new ArrayList<>();

        String sql = "	select customer.customer_id,appointment.consultation_id, customer.fullname as customer_fullname, appointment.date, appointment.note, appointment.address,  appointment.type, appointment.status,appointment.Request_trainer_id\n"
                + "                        from tbl_appointment appointment  \n"
                + "                                join tbl_customer customer on customer.customer_id = appointment.customer_id\n"
                + "                            WHERE appointment.status IS NULL AND appointment.Request_trainer_id IS NOT NULL AND   appointment.trainer_id IS NULL";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string 
                String dateStringsubmit = rs.getString(11);
                java.sql.Date datesubmit = java.sql.Date.valueOf(dateStringsubmit);

                AppointmentDDD appointment = new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );

                list.add(appointment);

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return list;

    }

    // GET DETAIL OF FORM THAT CUSTOMER NOT CHOOSE TRAINER
    public AppointmentDDD getAppointmentDetailPendingTHAT_Cus_NOTChoose_Trainer(String consultation_id) {

        String sql = " SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname,appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id, appointment.duration , appointment.DateSubmit, appointment.amount,appointment.fullname,appointment.gmail,appointment.contact\n"
                + "              FROM tbl_appointment appointment\n"
                + "              JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "              WHERE appointment.consultation_id = ? AND appointment.Request_trainer_id IS NULL AND appointment.status IS NULL AND trainer_id IS NULL";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, consultation_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                String dateStringsubmit = rs.getString(11);
                java.sql.Date datesubmit = java.sql.Date.valueOf(dateStringsubmit);

                return new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTime(10),
                        datesubmit,
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                );
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    // GET DETAIL OF FORM THAT CUSTOMER  CHOOSE TRAINER
    public AppointmentDDD getAppointmentDetailPendingTHAT_Cus_Choose_Trainer(String consultation_id) {

        String sql = "SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id, appointment.duration , appointment.DateSubmit,appointment.amount,appointment.fullname,appointment.gmail,appointment.contact\n"
                + "                            FROM tbl_appointment appointment\n"
                + "                              JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "                              WHERE  appointment.consultation_id = ? and appointment.Request_trainer_id IS NOT NULL AND appointment.status IS NULL AND appointment.trainer_id IS NULL";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, consultation_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                String dateStringsubmit = rs.getString(11);
                java.sql.Date datesubmit = java.sql.Date.valueOf(dateStringsubmit);

                return new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTime(10),
                        datesubmit,
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                );
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    // GET DETAIL OF FORM PROCESSING
    public AppointmentDDD getAppointmentDetailProcessing(String consultation_id) {

        String sql = "			   SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id,appointment.duration , appointment.DateSubmit,appointment.amount,appointment.fullname,appointment.gmail,appointment.contact\n"
                + "                FROM tbl_appointment appointment\n"
                + "                JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "                WHERE appointment.consultation_id = ?  AND appointment.Request_trainer_id IS NOT NULL AND appointment.status IS NOT  NULL AND trainer_id IS NOT NULL and appointment.tracking IS NULL";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, consultation_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                String dateStringsubmit = rs.getString(11);
                java.sql.Date datesubmit = java.sql.Date.valueOf(dateStringsubmit);
                return new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTime(10),
                        datesubmit,
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                );
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    // GET DETAIL OF FORM COmpleteddd
    public AppointmentDDD getAppointmentDetailCompleted(String consultation_id) {

        String sql = "        SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id,appointment.duration , appointment.DateSubmit,appointment.amount,appointment.fullname,appointment.gmail,appointment.contact\n"
                + "                              FROM tbl_appointment appointment\n"
                + "                             JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "                              WHERE appointment.consultation_id = ?  AND  appointment.tracking = 'complete' and appointment.history IS NULL";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, consultation_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                String dateStringsubmit = rs.getString(11);
                java.sql.Date datesubmit = java.sql.Date.valueOf(dateStringsubmit);
                return new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTime(10),
                        datesubmit,
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                );
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    // GET DETAIL OF FORM COmpleteddd
    public AppointmentDDD getAppointmentDetailHistory(String consultation_id) {

        String sql = "SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id,appointment.duration , appointment.DateSubmit,appointment.amount,appointment.fullname,appointment.gmail,appointment.contact\n"
                + "FROM tbl_appointment appointment\n"
                + "JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "WHERE appointment.consultation_id = ? AND  appointment.tracking = 'complete' and appointment.history = 'yes'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, consultation_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                String dateStringsubmit = rs.getString(11);
                java.sql.Date datesubmit = java.sql.Date.valueOf(dateStringsubmit);
                return new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTime(10),
                        datesubmit,
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                );
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public List<AppointmentDDD> getAppointmentListBYTrainerID(String TrainerId) {
        List<AppointmentDDD> list = new ArrayList<>();
        String sql = " SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id, appointment.duration , appointment.DateSubmit,appointment.amount,appointment.fullname,appointment.gmail,appointment.contact\n"
                + "              FROM tbl_appointment appointment\n"
                + "              JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "              WHERE appointment.trainer_id = ? AND appointment.Request_trainer_id IS NOT NULL AND appointment.status IS NOT  NULL AND trainer_id IS NOT NULL and appointment.tracking IS NULL";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, TrainerId);
            rs = ps.executeQuery();
            while (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                String dateStringsubmit = rs.getString(11);
                java.sql.Date datesubmit = java.sql.Date.valueOf(dateStringsubmit);
                AppointmentDDD ddd = new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTime(10),
                        datesubmit,
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                );
                list.add(ddd);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return list;
    }
    // GET DETAIL OF FORM COmpleteddd

    public AppointmentDDD getAppointmentDetailbyTrainer(String consultation_id) {

        String sql = " SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id, appointment.duration , appointment.DateSubmit,appointment.amount,appointment.fullname,appointment.gmail,appointment.contact\n"
                + "              FROM tbl_appointment appointment\n"
                + "              JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "              WHERE appointment.consultation_id = ? AND appointment.Request_trainer_id IS NOT NULL AND appointment.status IS NOT  NULL AND trainer_id IS NOT NULL and appointment.tracking IS NULL";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, consultation_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                String dateStringsubmit = rs.getString(11);
                java.sql.Date datesubmit = java.sql.Date.valueOf(dateStringsubmit);
                return new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getTime(10),
                        datesubmit,
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                );
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    // GET DETAIL OF FORM Completedd
    public List<AppointmentDDD> getListAppointmentProcessing() {
        List<AppointmentDDD> list = new ArrayList<>();

        String sql = "SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id\n"
                + "            FROM tbl_appointment appointment\n"
                + "            JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "            WHERE   appointment.status  LIKE '%approve%'";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
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

// GET DETAIL OF FORM THAT CUSTOMER  CHOOSE TRAINER
    public AppointmentDDD getAppointDetailCUSchooseTRAINER(String consultation_id) {

        String sql = "SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id\n"
                + "           FROM tbl_appointment appointment\n"
                + "            JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "            WHERE appointment.consultation_id = ? AND appointment.Request_trainer_id IS NOT NULL AND appointment.status IS NULL AND appointment.trainer_id IS NULL";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, consultation_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                return new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public String getRequestTrainerID(String consultation_id) {

        String sql = "select Request_trainer_id from tbl_appointment where consultation_id = ?	";
        String requesttrainerid = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, consultation_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                requesttrainerid = rs.getString("Request_trainer_id");

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return requesttrainerid;

    }

    public String getConsultationTHATCUSnotchooseTrainer() {

        String sql = "select TOP 1 consultation_id from tbl_appointment  where status IS NUll AND Request_trainer_id IS NULL";
        String id = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getString("consultation_id");

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return id;

    }

    public String getConsultationTHATCUSchooseTrainer() {

        String sql = "select TOP 1 consultation_id from tbl_appointment  where status IS NUll AND Request_trainer_id IS NOT NULL";
        String id = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getString("consultation_id");

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return id;

    }

    /*UPDATE IF USER NOT CHOOSE TRAINER + SET TRAINER*/
    public void updateAppointmentForm(String consultationId, String trainerId, String requestTrainerId)
            throws SQLException, ClassCastException {

        String updateAppointmentSql = "UPDATE tbl_appointment SET status = 'approve', trainer_id = ?, Request_trainer_id = ? WHERE consultation_id = ?";
        String updateTrainerSql = "UPDATE tbl_trainer SET status = 'available' WHERE trainer_id = ?";

        boolean result = false;

        try {
            con = db.getConnection();
            // Update tbl_appointment
            ps = con.prepareStatement(updateAppointmentSql);
            ps.setString(1, trainerId);
            ps.setString(2, requestTrainerId);
            ps.setString(3, consultationId);
            ps.executeUpdate();
            // Update tbl_trainer
            ps = con.prepareStatement(updateTrainerSql);
            ps.setString(1, trainerId);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
    }

    /*UPDATE IF USER  CHOOSE TRAINER */
    public void updateAppointmentAndTrainerChooseTrainer(String consultationId)
            throws SQLException, ClassCastException {

        String appointmentUpdateQuery = "UPDATE tbl_appointment SET status = 'approve', trainer_id = Request_trainer_id WHERE consultation_id = ?";
        String trainerUpdateQuery = "UPDATE tbl_trainer SET status = 'unavailable' WHERE trainer_id = (SELECT Request_trainer_id FROM tbl_appointment WHERE consultation_id = ?)";

        boolean result = false;

        try {
            con = db.getConnection();
            // Update tbl_appointment
            ps = con.prepareStatement(appointmentUpdateQuery);
            ps.setString(1, consultationId);
            ps.executeUpdate();
            // Update tbl_trainer
            ps = con.prepareStatement(trainerUpdateQuery);
            ps.setString(1, consultationId);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
    }
    // GET DETAIL OF FORM THAT CUSTOMER  CHOOSE TRAINER

    public AppointmentDDD getTrainerFormAppointment(int trainer_id) {

        String sql = "					SELECT appointment.customer_id, appointment.consultation_id, customer.fullname AS customer_fullname, appointment.date, appointment.note, appointment.address, appointment.type, appointment.status,appointment.Request_trainer_id,appointment.Tracking\n"
                + "                  FROM tbl_appointment appointment\n"
                + "                      JOIN tbl_customer customer ON customer.customer_id = appointment.customer_id\n"
                + "                   WHERE appointment.trainer_id = ?  AND appointment.Request_trainer_id IS NOT NULL AND appointment.status IS NOT NULL AND appointment.trainer_id IS NOT NULL";

        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, trainer_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String dateString = rs.getString(4); // Get the date as a string
                java.sql.Date date = java.sql.Date.valueOf(dateString); // Convert the string to a java.sql.Date object
                return new AppointmentDDD(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        date,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    /*UPDATE IF USER  CHOOSE TRAINER */
    public void updateTrainerWhenPayment(String trainerID , String consultionID)
            throws SQLException, ClassCastException {

        String appointmentUpdateQuery = "update tbl_appointment \n"
                + "				  set Tracking = 'complete'\n"
                + "				  where consultation_id = ?";
        String trainerUpdateQuery = "update tbl_trainer \n"
                + "				  set status = 'available'\n"
                + "				  where trainer_id  =?";

        try {
            con = db.getConnection();
            // Update tbl_appointment
            ps = con.prepareStatement(appointmentUpdateQuery);
            ps.setString(1,consultionID);
            ps.executeUpdate();
            // Update tbl_trainer
            ps = con.prepareStatement(trainerUpdateQuery);
            ps.setString(1, trainerID);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
    }

    /*UPDATE IF USER  CHOOSE TRAINER */
    public void updateTrainerAmount(String consultationID, int amount)
            throws SQLException, ClassCastException {

        String appointmentUpdateQuery = "update tbl_appointment set amount = ? "
                + "where consultation_id = ?";

        try {
            con = db.getConnection();
            // Update tbl_appointment
            ps = con.prepareStatement(appointmentUpdateQuery);
            ps.setInt(1, amount);
            ps.setString(2, consultationID);

            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
    }

    public void updateAppointmentHistory(String consultationId) throws SQLException {
        String sql = "update tbl_appointment \n"
                + " set history = 'yes'\n"
                + " where consultation_id = ?";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, consultationId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }

        }
    }

}
