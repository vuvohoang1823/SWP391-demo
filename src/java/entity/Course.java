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
public class Course {
    private String courseID;
    private String trainerID;
    private String staffID ;
    private String content; 
    private String category;
    private String title;
    private int price;
    private String image;
    private Date start_date;
    private Date end_enroll_date;
    private String status;
    private String customerID;
    
    
    
    public Course(String courseID, String trainerID, String staffID, String content, String category, String title, int price, String image, Date start_date, Date end_enroll_date, String status, String customerID) {
        this.courseID = courseID;
        this.trainerID = trainerID;
        this.staffID = staffID;
        this.content = content;
        this.category = category;
        this.title = title;
        this.price = price;
        this.image = image;
        this.start_date = start_date;
        this.end_enroll_date = end_enroll_date;
        this.status = status;
        this.customerID = customerID;
    }

    public Course(String courseID, String trainerID, String staffID, String content, String category, String title, int price, String image, Date start_date, Date end_enroll_date, String status) {
        this.courseID = courseID;
        this.trainerID = trainerID;
        this.staffID = staffID;
        this.content = content;
        this.category = category;
        this.title = title;
        this.price = price;
        this.image = image;
        this.start_date = start_date;
        this.end_enroll_date = end_enroll_date;
        this.status = status;
    }

    public Course(String courseID, String trainerID, String staffID, String content, String category, String title, int price, String image, Date start_date, Date end_enroll_date) {
        this.courseID = courseID;
        this.trainerID = trainerID;
        this.staffID = staffID;
        this.content = content;
        this.category = category;
        this.title = title;
        this.price = price;
        this.image = image;
        this.start_date = start_date;
        this.end_enroll_date = end_enroll_date;
    }
    

    public Course(String courseID, String trainerID, String staffID, String content, String category, String title, int price, String image) {
        this.courseID = courseID;
        this.trainerID = trainerID;
        this.staffID = staffID;
        this.content = content;
        this.category = category;
        this.title = title;
        this.price = price;
        this.image = image;
    }

    public Course() {
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getTrainerID() {
        return trainerID;
    }

    public void setTrainerID(String trainerID) {
        this.trainerID = trainerID;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_enroll_date() {
        return end_enroll_date;
    }

    public void setEnd_enroll_date(Date end_enroll_date) {
        this.end_enroll_date = end_enroll_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }
    
}
