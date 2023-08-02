/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.service;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author hoang
 */
public class Workshop implements Serializable {

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
    private String sub_content_1;
    private String sub_content_2;
    private String sub_content_3;
    private String sub_content_4;
    private String trainer_fullname;
    private String tracking_status;

    public Workshop(String courseID, String trainerID, String staffID, String content, String category, String title, int price, String image, Date start_date, Date end_enroll_date, String sub_content_1, String sub_content_2, String sub_content_3, String sub_content_4, String trainer_fullname, String tracking_status, String a) {
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
        this.sub_content_1 = sub_content_1;
        this.sub_content_2 = sub_content_2;
        this.sub_content_3 = sub_content_3;
        this.sub_content_4 = sub_content_4;
        this.trainer_fullname = trainer_fullname;
        this.tracking_status = tracking_status;
    }

    public Workshop(String courseID, String trainerID, String staffID, String content, String category, String title, int price, String image, Date start_date, Date end_enroll_date, String status, String customerID, String sub_content_1, String sub_content_2, String sub_content_3, String sub_content_4) {
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
        this.sub_content_1 = sub_content_1;
        this.sub_content_2 = sub_content_2;
        this.sub_content_3 = sub_content_3;
        this.sub_content_4 = sub_content_4;
    }

    
    public Workshop(String title, String image) {
        this.title = title;
        this.image = image;
    }
    

    public Workshop() {
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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

    public String getSub_content_1() {
        return sub_content_1;
    }

    public void setSub_content_1(String sub_content_1) {
        this.sub_content_1 = sub_content_1;
    }

    public String getSub_content_2() {
        return sub_content_2;
    }

    public void setSub_content_2(String sub_content_2) {
        this.sub_content_2 = sub_content_2;
    }

    public String getSub_content_3() {
        return sub_content_3;
    }

    public void setSub_content_3(String sub_content_3) {
        this.sub_content_3 = sub_content_3;
    }

    public String getSub_content_4() {
        return sub_content_4;
    }

    public void setSub_content_4(String sub_content_4) {
        this.sub_content_4 = sub_content_4;
    }

    public String getTrainer_fullname() {
        return trainer_fullname;
    }

    public void setTrainer_fullname(String trainer_fullname) {
        this.trainer_fullname = trainer_fullname;
    }

    public String getTracking_status() {
        return tracking_status;
    }

    public void setTracking_status(String tracking_status) {
        this.tracking_status = tracking_status;
    }

}
