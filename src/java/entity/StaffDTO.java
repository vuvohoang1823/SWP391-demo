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
public class StaffDTO implements Serializable{

    private String staff_id ;
    private String username; 
    private String password; 
    private String role ; 

    public StaffDTO(String staff_id, String username, String password, String role) {
        this.staff_id = staff_id;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public StaffDTO() {
    }

    public String getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(String staff_id) {
        this.staff_id = staff_id;
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
