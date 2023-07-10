/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;

/**
 *
 * @author LAPTOP
 */
public class CourseTeachingDTO implements Serializable{
    private String trainer_id;
    private String fullname_customer;
    private String contact_customer;
    private String content;
    private String category;
    private String title;
    private String note;
    private String address;
    private String type;

    public CourseTeachingDTO() {
    }


    public CourseTeachingDTO(String trainer_id, String fullname_customer,  String content, String category, String title) {
        this.trainer_id = trainer_id;
        this.fullname_customer = fullname_customer;
        this.content = content;
        this.category = category;
        this.title = title;
    }
    
    public CourseTeachingDTO(String trainer_id, String fullname_customer, String contact_customer, String note, String address, String type ) {
        this.trainer_id = trainer_id;
        this.fullname_customer = fullname_customer;
        this.contact_customer = contact_customer;
        this.note = note;
        this.address = address;
        this.type = type;
    }
    
    

    public String getTrainer_id() {
        return trainer_id;
    }

    public void setTrainer_id(String trainer_id) {
        this.trainer_id = trainer_id;
    }

    public String getFullname_customer() {
        return fullname_customer;
    }

    public void setFullname_customer(String fullname_customer) {
        this.fullname_customer = fullname_customer;
    }

    public String getContact_customer() {
        return contact_customer;
    }

    public void setContact_customer(String contact_customer) {
        this.contact_customer = contact_customer;
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


    
    
    
    
    
    
}
