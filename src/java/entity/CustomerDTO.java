/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;

/**
 *
 * @author hoang
 */
public class CustomerDTO implements Serializable{
    private int customer_id;
    private int user_id;
    private String fullName;
    private String contact;
    private String image;
    private String username;
    private String password;

    public CustomerDTO(int customer_id, int user_id, String fullName, String contact, String image, String password, String username) {
        this.customer_id = customer_id;
        this.user_id = user_id;
        this.fullName = fullName;
        this.contact = contact;
        this.image = image;
        this.password = password;
        this.username = username;

    }

    
   

    
    
    public CustomerDTO(int customer_id, int user_id, String fullName, String contact) {
        this.customer_id = customer_id;
        this.user_id = user_id;
        this.fullName = fullName;
        this.contact = contact;
    }

    public CustomerDTO() {
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
    
}
