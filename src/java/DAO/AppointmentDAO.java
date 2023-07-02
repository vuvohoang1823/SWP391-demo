/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import entity.AppointmentDTO;
import DBUtils.DBUtils;

/**
 *
 * @author LAPTOP
 */
public class AppointmentDAO implements Serializable {

    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();
    Connection connection = null;

    public List<AppointmentDTO> getAppointList() {
        List<AppointmentDTO> list = new ArrayList<>();

        String sql = "select appointment.consultation_id, customer.fullname as customer_fullname, appointment.date, appointment.note, appointment.address, trainer.fullname as trainer_fullname,  appointment.type, appointment.status "
                + " from tbl_appointment appointment  "
                + " join tbl_customer customer on customer.customer_id = appointment.customer_id "
                + " join tbl_trainer trainer on trainer.trainer_id = appointment.trainer_id "
                + " where appointment.status IS NULL ";
        

        try {
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                AppointmentDTO appointment = new AppointmentDTO(rs.getString("consultation_id"), rs.getDate("date"), rs.getString("note"), rs.getString("address"), rs.getString("type"), rs.getString("trainer_fullname"), rs.getString("customer_fullname"));
                list.add(appointment);

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return list;

    }

    public AppointmentDTO getAppointDetail(String consultation_id) {

        String sql = "select appointment.consultation_id, customer.fullname as customer_fullname, appointment.date, appointment.note, appointment.address, trainer.fullname as trainer_fullname,  appointment.type "
                + " from tbl_appointment appointment  "
                + " join tbl_customer customer on customer.customer_id = appointment.customer_id "
                + " join tbl_trainer trainer on trainer.trainer_id = appointment.trainer_id "
                + " where appointment.consultation_id = ? ";

        try {
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, consultation_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                return new AppointmentDTO(rs.getString("consultation_id"), rs.getDate("date"), rs.getString("note"), rs.getString("address"), rs.getString("type"), rs.getString("trainer_fullname"), rs.getString("customer_fullname"));
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return null;

    }

    public boolean browseForm(String status, String consultation_id) {

        String sql = "update tbl_appointment "
                + "set status = ? "
                + "where consultation_id = ? ";
        boolean result = false;

        try {
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, consultation_id);
            int effectRows = ps.executeUpdate();

            if (effectRows >= 0) {
                result = true;
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return result;

    }
    
    
        public boolean paymentConsultation(String trainer_id, String amount) {

        String sql = "update tbl_appointment "
                + "set amount = ? "
                + "where trainer_id = ? ";
        boolean result = false;

        try {
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, trainer_id);
            ps.setString(2, amount);
            int effectRows = ps.executeUpdate();

            if (effectRows >= 0) {
                result = true;
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return result;

    }
}
