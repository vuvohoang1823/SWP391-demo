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
    private String staffID;
    private String content;
    private String category;
    private String title;
    private int price;
    private String image;
    private Date start_date;
    private Date end_enroll_date;
    private String status;
    private String customerID;
    private Date complete_date;
    private int history_id;
    private String trainer_fullname;
    private int duration;
    private String a;
    private String b;
    private String c;
    private String d;
    private String certificate_status;
    private String tracking_status;

    public Course(String courseID, String trainerID, String staffID, String content, String category, String title, int price, String image, Date start_date, Date end_enroll_date, String status, Date complete_date, String trainer_fullname, String customerID, String certificate_status) {
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
        this.complete_date = complete_date;
        this.trainer_fullname = trainer_fullname;
        this.customerID = customerID;
        this.certificate_status = certificate_status;
    }

    public Course(String courseID, String trainerID, String staffID, String content, String category, String title, int price, String image, Date start_date, Date end_enroll_date, String status, Date complete_date, int history_id) {
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
        this.complete_date = complete_date;
        this.history_id = history_id;
    }

    public Course(String courseID, String trainerID, String staffID, String content, String category, String title, int price, String image, Date start_date, Date end_enroll_date, String status, Date complete_date) {
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
        this.complete_date = complete_date;
    }

    public Course(String courseID, String trainerID, String staffID, String content, String category, String title, int price, String image, Date start_date, Date end_enroll_date, String status, String customerID, String tracking_status) {
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
        this.tracking_status = tracking_status;
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

    public Course(String courseID, String trainerID, String staffID, String content, String category, String title, int price, String image, Date start_date, Date end_enroll_date, String trainer_fullname, String tracking_status, String a, String b, String c, String d) {
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
        this.trainer_fullname = trainer_fullname;
        this.tracking_status = tracking_status;
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

    public Course(String courseID, String trainerID, String staffID, String content, String category, String title, int price, int duration, String image) {
        this.courseID = courseID;
        this.trainerID = trainerID;
        this.staffID = staffID;
        this.content = content;
        this.category = category;
        this.title = title;
        this.price = price;
        this.duration = duration;
        this.image = image;
    }

    public Course(String courseID, String content, String category, String title, int price, int duration) {
        this.courseID = courseID;
        this.content = content;
        this.category = category;
        this.title = title;
        this.price = price;
        this.duration = duration;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
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

    public Date getComplete_date() {
        return complete_date;
    }

    public void setComplete_date(Date complete_date) {
        this.complete_date = complete_date;
    }

    public int getHistory_id() {
        return history_id;
    }

    public void setHistory_id(int history_id) {
        this.history_id = history_id;
    }

    public String getTrainer_fullname() {
        return trainer_fullname;
    }

    public void setTrainer_fullname(String trainer_fullname) {
        this.trainer_fullname = trainer_fullname;
    }

    public String getA() {
        return a;
    }

    public void setA(String a) {
        this.a = a;
    }

    public String getB() {
        return b;
    }

    public void setB(String b) {
        this.b = b;
    }

    public String getC() {
        return c;
    }

    public void setC(String c) {
        this.c = c;
    }

    public String getD() {
        return d;
    }

    public void setD(String d) {
        this.d = d;
    }

    public String getCertificate_status() {
        return certificate_status;
    }

    public void setCertificate_status(String certificate_status) {
        this.certificate_status = certificate_status;
    }

    public String getTracking_status() {
        return tracking_status;
    }

    public void setTracking_status(String tracking_status) {
        this.tracking_status = tracking_status;
    }

    
}
