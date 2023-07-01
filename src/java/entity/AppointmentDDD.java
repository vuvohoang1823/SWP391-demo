/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author hoang
 */

public class AppointmentDDD implements Serializable {
    private String customer_id;
    private String consultation_id;
    private String trainer_id ;
    private String customer_fullname;
    private int amount ;
    private Date date;
    private String note;
    private String address;
    private String type;
    private String status;
    private String request_trainer_id;
    private String trackingcourse; 
    private Time duration;
    private Date dateSubmit;
    private String history;
    private String fullname ;
    private String gmail;
    private String contact;
    

    public AppointmentDDD(String customer_id, String consultation_id, String customer_fullname, Date date, String note, String address, String type, String status, String request_trainer_id, Time duration, Date dateSubmit,int amount,String fullname, String gmail,String contact) {
        this.customer_id = customer_id;
        this.consultation_id = consultation_id;
        this.customer_fullname = customer_fullname;
        this.date = date;
        this.note = note;
        this.address = address;
        this.type = type;
        this.status = status;
        this.request_trainer_id = request_trainer_id;
        this.duration = duration;
        this.dateSubmit = dateSubmit;
        this.amount = amount;
        this.fullname = fullname;
        this.gmail = gmail; 
        this.contact = contact;
    }

    public AppointmentDDD(String customer_id, String consultation_id, String trainer_id, String customer_fullname, int amount, Date date, String note, String address, String type, String status, String request_trainer_id, String trackingcourse, Time duration, Date dateSubmit) {
        this.customer_id = customer_id;
        this.consultation_id = consultation_id;
        this.trainer_id = trainer_id;
        this.customer_fullname = customer_fullname;
        this.amount = amount;
        this.date = date;
        this.note = note;
        this.address = address;
        this.type = type;
        this.status = status;
        this.request_trainer_id = request_trainer_id;
        this.trackingcourse = trackingcourse;
        this.duration = duration;
        this.dateSubmit = dateSubmit;
    }
    
     
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

    public String getTrainer_id() {
        return trainer_id;
    }

    public void setTrainer_id(String trainer_id) {
        this.trainer_id = trainer_id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Time getDuration() {
        return duration;
    }

    public void setDuration(Time duration) {
        this.duration = duration;
    }

    public Date getDateSubmit() {
        return dateSubmit;
    }

    public void setDateSubmit(Date dateSubmit) {
        this.dateSubmit = dateSubmit;
    }

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

   
    
   

    
    
    
    
}

    

