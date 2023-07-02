/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author hoang
 */
public class AttendanceDTO {
    private String customerID ;
    private String workshopID;
    private String trainerID;
    private String category ;
    private String title;  
    private String image;
    private Date dateCheck ; 
    private int amount; 
    private int payment_id ; 

    public AttendanceDTO(String customerID, String workshopID, String trainerID, String category, String title, String image, Date dateCheck, int amount, int payment_id) {
        this.customerID = customerID;
        this.workshopID = workshopID;
        this.trainerID = trainerID;
        this.category = category;
        this.title = title;
        this.image = image;
        this.dateCheck = dateCheck;
        this.amount = amount;
        this.payment_id = payment_id;
    }

    public AttendanceDTO() {
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getWorkshopID() {
        return workshopID;
    }

    public void setWorkshopID(String workshopID) {
        this.workshopID = workshopID;
    }

    public String getTrainerID() {
        return trainerID;
    }

    public void setTrainerID(String trainerID) {
        this.trainerID = trainerID;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getDateCheck() {
        return dateCheck;
    }

    public void setDateCheck(Date dateCheck) {
        this.dateCheck = dateCheck;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }


    
}
