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
public class CourseOnline implements
        Serializable {
    private String courseID;
    private String trainerID;
    private String staffID ;
    private String content; 
    private String category;
    private String title;
    private int price;
    private String image;
    private Date date ; 
    private float amount ; 
    private String payment_id ; 
    private String module_name_1;
    private String module_name_2;
    private String module_name_3;
    private String module_name_4;
    private String module_name_5;
    private String module_description_1;
    private String module_description_2;
    private String module_description_3;
    private String module_description_4;
    private String module_description_5;    
    
//    Do not use anymore
    private String module_id;
    private String module_name;
    private String module_description;

    public CourseOnline(String courseID, String staffID, String content, String category, String title, int price, String image, String module_name_1, String module_name_2, String module_name_3, String module_name_4, String module_name_5, String module_description_1, String module_description_2, String module_description_3, String module_description_4, String module_description_5) {
        this.courseID = courseID;
        this.staffID = staffID;
        this.content = content;
        this.category = category;
        this.title = title;
        this.price = price;
        this.image = image;
        this.module_name_1 = module_name_1;
        this.module_name_2 = module_name_2;
        this.module_name_3 = module_name_3;
        this.module_name_4 = module_name_4;
        this.module_name_5 = module_name_5;
        this.module_description_1 = module_description_1;
        this.module_description_2 = module_description_2;
        this.module_description_3 = module_description_3;
        this.module_description_4 = module_description_4;
        this.module_description_5 = module_description_5;
    }

    
    
    public CourseOnline(String courseID, String content, String category, String title, int price, String module_id, String module_name, String module_description) {
        this.courseID = courseID;
        this.content = content;
        this.category = category;
        this.title = title;
        this.price = price;
        this.module_id = module_id;
        this.module_name = module_name;
        this.module_description = module_description;
    }
        public CourseOnline(String title, String image) {
        this.title = title;
        this.image = image;
    }
    

    public CourseOnline(String courseID, String trainerID, String staffID, String content, String category, String title, int price, String image, Date date, float amount, String payment_id) {
        this.courseID = courseID;
        this.trainerID = trainerID;
        this.staffID = staffID;
        this.content = content;
        this.category = category;
        this.title = title;
        this.price = price;
        this.image = image;
        this.date = date;
        this.amount = amount;
        this.payment_id = payment_id;
    }

    public CourseOnline(String title, String image, String courseID, String content) {
        this.title = title;
        this.image = image;
        this.courseID = courseID;
        this.content = content;
    }
    

    public CourseOnline() {
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public String getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(String payment_id) {
        this.payment_id = payment_id;
    }

    public String getModule_id() {
        return module_id;
    }

    public void setModule_id(String module_id) {
        this.module_id = module_id;
    }

    public String getModule_name() {
        return module_name;
    }

    public void setModule_name(String module_name) {
        this.module_name = module_name;
    }

    public String getModule_description() {
        return module_description;
    }

    public void setModule_description(String module_description) {
        this.module_description = module_description;
    }

    public String getModule_name_1() {
        return module_name_1;
    }

    public void setModule_name_1(String module_name_1) {
        this.module_name_1 = module_name_1;
    }

    public String getModule_name_2() {
        return module_name_2;
    }

    public void setModule_name_2(String module_name_2) {
        this.module_name_2 = module_name_2;
    }

    public String getModule_name_3() {
        return module_name_3;
    }

    public void setModule_name_3(String module_name_3) {
        this.module_name_3 = module_name_3;
    }

    public String getModule_name_4() {
        return module_name_4;
    }

    public void setModule_name_4(String module_name_4) {
        this.module_name_4 = module_name_4;
    }

    public String getModule_name_5() {
        return module_name_5;
    }

    public void setModule_name_5(String module_name_5) {
        this.module_name_5 = module_name_5;
    }

    public String getModule_description_1() {
        return module_description_1;
    }

    public void setModule_description_1(String module_description_1) {
        this.module_description_1 = module_description_1;
    }

    public String getModule_description_2() {
        return module_description_2;
    }

    public void setModule_description_2(String module_description_2) {
        this.module_description_2 = module_description_2;
    }

    public String getModule_description_3() {
        return module_description_3;
    }

    public void setModule_description_3(String module_description_3) {
        this.module_description_3 = module_description_3;
    }

    public String getModule_description_4() {
        return module_description_4;
    }

    public void setModule_description_4(String module_description_4) {
        this.module_description_4 = module_description_4;
    }

    public String getModule_description_5() {
        return module_description_5;
    }

    public void setModule_description_5(String module_description_5) {
        this.module_description_5 = module_description_5;
    }
    
    
    
    
    
    
    
    
}
