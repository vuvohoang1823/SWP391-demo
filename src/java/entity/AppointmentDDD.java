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
 * @author hoang
 */

public class AppointmentDDD implements Serializable {
    private String customer_id;
    private String consultation_id;
    private String customer_fullname;
    private Date date;
    private String note;
    private String address;
    private String type;
    private String status;
    private String request_trainer_id;
    private String trackingcourse; 

    public AppointmentDDD(String customer_id, String consultation_id, String customer_fullname, Date date, String note, String address, String type, String status, String request_trainer_id, String trackingcourse) {
        this.customer_id = customer_id;
        this.consultation_id = consultation_id;
        this.customer_fullname = customer_fullname;
        this.date = date;
        this.note = note;
        this.address = address;
        this.type = type;
        this.status = status;
        this.request_trainer_id = request_trainer_id;
        this.trackingcourse = trackingcourse;
    }

 

    
    public AppointmentDDD() {
    }
    

    public AppointmentDDD(String customer_id, String consultation_id, String customer_fullname, Date date, String note, String address, String type, String status, String request_trainer_id) {
        this.customer_id = customer_id;
        this.consultation_id = consultation_id;
        this.customer_fullname = customer_fullname;
        this.date = date;
        this.note = note;
        this.address = address;
        this.type = type;
        this.status = status;
        this.request_trainer_id = request_trainer_id;
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

    public String getCustomer_fullname() {
        return customer_fullname;
    }

    public void setCustomer_fullname(String customer_fullname) {
        this.customer_fullname = customer_fullname;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRequest_trainer_id() {
        return request_trainer_id;
    }

    public void setRequest_trainer_id(String request_trainer_id) {
        this.request_trainer_id = request_trainer_id;
    }

    public String getTrackingcourse() {
        return trackingcourse;
    }

    public void setTrackingcourse(String trackingcourse) {
        this.trackingcourse = trackingcourse;
    }

   
    
   

    
    
    
    
}

    

