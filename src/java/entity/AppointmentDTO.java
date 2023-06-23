/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author LAPTOP
 */
public class AppointmentDTO implements Serializable {
    private String customer_id;
    private String consultation_id;
    private Date date;
    private String note;
    private String address;
    private String type;
    private String trainer_fullname;
    private String customer_fullname;
    private String status;
    
    

    public AppointmentDTO() {
    }

    public AppointmentDTO(String consultation_id, Date date, String note, String address, String type, String trainer_fullname, String customer_fullname) {
        this.consultation_id = consultation_id;
        this.date = date;
        this.note = note;
        this.address = address;
        this.type = type;
        this.trainer_fullname = trainer_fullname;
        this.customer_fullname = customer_fullname;
    }

    public AppointmentDTO(String customer_id, String consultation_id, Date date, String note, String address, String type, String trainer_fullname, String customer_fullname, String status) {
        this.customer_id = customer_id;
        this.consultation_id = consultation_id;
        this.date = date;
        this.note = note;
        this.address = address;
        this.type = type;
        this.trainer_fullname = trainer_fullname;
        this.customer_fullname = customer_fullname;
        this.status = status;
    }
    

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getConsultation_id() {
        return consultation_id;
    }

    public void setConsultation_id(String consultation_id) {
        this.consultation_id = consultation_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTrainer_fullname() {
        return trainer_fullname;
    }

    public void setTrainer_fullname(String trainer_fullname) {
        this.trainer_fullname = trainer_fullname;
    }

    public String getCustomer_fullname() {
        return customer_fullname;
    }

    public void setCustomer_fullname(String customer_fullname) {
        this.customer_fullname = customer_fullname;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    

    
    
    
    
}
