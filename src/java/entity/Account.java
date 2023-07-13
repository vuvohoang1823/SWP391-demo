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
public class Account implements Serializable{
    private String fullname;
    private String gmail ; 
    private String username; 
    private String password;
    private String contact;
    private String img; 
    private String captcha;

    public Account(String fullname, String gmail, String username, String password, String contact, String img, String captcha) {
        this.fullname = fullname;
        this.gmail = gmail;
        this.username = username;
        this.password = password;
        this.contact = contact;
        this.img = img;
        this.captcha = captcha;
    }

    public Account(String fullname, String gmail, String username, String password, String contact, String img) {
        this.fullname = fullname;
        this.gmail = gmail;
        this.username = username;
        this.password = password;
        this.contact = contact;
        this.img = img;
    }

    public Account() {
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

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }
    
    
    
}
