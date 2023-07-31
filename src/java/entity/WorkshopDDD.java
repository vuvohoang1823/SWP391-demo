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
public class WorkshopDDD implements Serializable{
    private String title;
    private String fullname;
    private Date dateCheck;
    private int amount;
    private String customer_fullname;
    private String customer_gmail;
    private String customer_contact;
    private String attendance;
    private String course_id;
    private String customer_id;
    private String status;
    private String workshop_id;
    

    public WorkshopDDD() {
    }

    public WorkshopDDD(String customer_fullname, String customer_gmail, String customer_contact, String attendance, String course_id, String customer_id, String status, String workshop_id) {
        this.customer_fullname = customer_fullname;
        this.customer_gmail = customer_gmail;
        this.customer_contact = customer_contact;
        this.attendance = attendance;
        this.course_id = course_id;
        this.customer_id = customer_id;
        this.status = status;
        this.workshop_id = workshop_id;
    }


    
    public WorkshopDDD(String title, String fullname, Date dateCheck, int amount) {
        this.title = title;
        this.fullname = fullname;
        this.dateCheck = dateCheck;
        this.amount = amount;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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

    public String getCustomer_fullname() {
        return customer_fullname;
    }

    public void setCustomer_fullname(String customer_fullname) {
        this.customer_fullname = customer_fullname;
    }

    public String getCustomer_gmail() {
        return customer_gmail;
    }

    public void setCustomer_gmail(String customer_gmail) {
        this.customer_gmail = customer_gmail;
    }

    public String getCustomer_contact() {
        return customer_contact;
    }

    public void setCustomer_contact(String customer_contact) {
        this.customer_contact = customer_contact;
    }

    public String getAttendance() {
        return attendance;
    }

    public void setAttendance(String attendance) {
        this.attendance = attendance;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getWorkshop_id() {
        return workshop_id;
    }

    public void setWorkshop_id(String workshop_id) {
        this.workshop_id = workshop_id;
    }
    
    
    
}
