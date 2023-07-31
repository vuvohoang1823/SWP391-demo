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
 * @author ASUS
 */
public class CustomerBirdDTO implements Serializable{
    private String bird_id ; 
    private String name ; 
    private String customer_id ; 
    private String bird_img;
    private Date birdDate;
    private String type_id; 
    private String type_name; 

    public CustomerBirdDTO() {
    }

    public CustomerBirdDTO(String type_id, String type_name) {
        this.type_id = type_id;
        this.type_name = type_name;
    }
     
    public CustomerBirdDTO(String bird_id, String name, String customer_id, String bird_img, Date birdDate, String type_id, String type_name) {
        this.bird_id = bird_id;
        this.name = name;
        this.customer_id = customer_id;
        this.bird_img = bird_img;
        this.birdDate = birdDate;
        this.type_id = type_id;
        this.type_name = type_name;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    public String getBird_id() {
        return bird_id;
    }

    public void setBird_id(String bird_id) {
        this.bird_id = bird_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getBird_img() {
        return bird_img;
    }

    public void setBird_img(String bird_img) {
        this.bird_img = bird_img;
    }

    public Date getBirdDate() {
        return birdDate;
    }

    public void setBirdDate(Date birdDate) {
        this.birdDate = birdDate;
    }

    public String getType_id() {
        return type_id;
    }

    public void setType_id(String type_id) {
        this.type_id = type_id;
    }
    
    
}
