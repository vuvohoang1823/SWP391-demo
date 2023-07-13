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
public class Trainer implements Serializable{
    private int trainerID ; 
    private int userID; 
    private String fullName ; 
    private String achievement ; 
    private String img ; 
    private String status ; 
    private int contact ;
    private String skill_id;
    private String skill_name;

    public Trainer() {
    }

    public Trainer(int trainerID, int userID, String fullName, String achievement, String img, String status, int contact, String skill_id, String skill_name) {
        this.trainerID = trainerID;
        this.userID = userID;
        this.fullName = fullName;
        this.achievement = achievement;
        this.img = img;
        this.status = status;
        this.contact = contact;
        this.skill_id = skill_id;
        this.skill_name = skill_name;
    }

    public int getTrainerID() {
        return trainerID;
    }

    public void setTrainerID(int trainerID) {
        this.trainerID = trainerID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAchievement() {
        return achievement;
    }

    public void setAchievement(String achievement) {
        this.achievement = achievement;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getContact() {
        return contact;
    }

    public void setContact(int contact) {
        this.contact = contact;
    }

    public String getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(String skill_id) {
        this.skill_id = skill_id;
    }

    public String getSkill_name() {
        return skill_name;
    }

    public void setSkill_name(String skill_name) {
        this.skill_name = skill_name;
    }

    

   
    
}