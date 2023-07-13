/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.logging.Logger;

/**
 *
 * @author hoang
 */
public class UserDTO implements Serializable {

    private int user_id;
    private String username;
    private String fullname;
    private String password;
    private String role;
    private String gmail;
    private String contact;
    private static final Logger LOG = Logger.getLogger(UserDTO.class.getName());

    public UserDTO() {
    }

    public UserDTO(int user_id, String username, String password, String role) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public UserDTO(int user_id, String username, String fullname, String password, String role, String gmail, String contact) {
        this.user_id = user_id;
        this.username = username;
        this.fullname = fullname;
        this.password = password;
        this.role = role;
        this.gmail = gmail;
        this.contact = contact;
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

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}
