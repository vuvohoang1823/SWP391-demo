/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author hoang
 */
public class TrainerSP {
     private int trainerID ; 
    private int userID; 
    private String fullName ; 
    private String achievement ; 
    private String img ; 
    private String status ; 
    private int contact ;

    public TrainerSP(int trainerID, int userID, String fullName, String achievement, String img, String status, int contact) {
        this.trainerID = trainerID;
        this.userID = userID;
        this.fullName = fullName;
        this.achievement = achievement;
        this.img = img;
        this.status = status;
        this.contact = contact;
    }

    public TrainerSP() {
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
    
}
