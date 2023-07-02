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
public class FormAppointmentDTO implements Serializable{
    private int consultationID;
    private int trainer_ID;
    private int  customerID ; 
    private Date stardate ; 
    private int amount ; 
    private int paymentID; 
    private String note; 
    private String address ; 
    private String type ; 
    private int present_price; 
    private String status ; 
    private String tracking ;  
    private String  RequesttrainerID;  

    public FormAppointmentDTO() {
    }

    public FormAppointmentDTO(int consultationID, int trainer_ID, int customerID, Date stardate, int amount, int paymentID, String note, String address, String type, int present_price, String status, String tracking, String RequesttrainerID) {
        this.consultationID = consultationID;
        this.trainer_ID = trainer_ID;
        this.customerID = customerID;
        this.stardate = stardate;
        this.amount = amount;
        this.paymentID = paymentID;
        this.note = note;
        this.address = address;
        this.type = type;
        this.present_price = present_price;
        this.status = status;
        this.tracking = tracking;
        this.RequesttrainerID = RequesttrainerID;
        
        
        
        
    }

    public int getConsultationID() {
        return consultationID;
    }

    public void setConsultationID(int consultationID) {
        this.consultationID = consultationID;
    }

    public int getTrainer_ID() {
        return trainer_ID;
    }

    public void setTrainer_ID(int trainer_ID) {
        this.trainer_ID = trainer_ID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public Date getStardate() {
        return stardate;
    }

    public void setStardate(Date stardate) {
        this.stardate = stardate;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
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

    public int getPresent_price() {
        return present_price;
    }

    public void setPresent_price(int present_price) {
        this.present_price = present_price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTracking() {
        return tracking;
    }

    public void setTracking(String tracking) {
        this.tracking = tracking;
    }

    public String getRequesttrainerID() {
        return RequesttrainerID;
    }

    public void setRequesttrainerID(String RequesttrainerID) {
        this.RequesttrainerID = RequesttrainerID;
    }

    
}
