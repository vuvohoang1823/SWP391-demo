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
public class DashBoard_v2_DTO implements Serializable {

    private String trainer_id;
    private Long total_earnings;
    private String fullname;
    private String trainer_img;
    private String course_id;
    private String participant_count;
    private String title;
    private String course_img;

    public DashBoard_v2_DTO() {
    }

    public DashBoard_v2_DTO(String participant_count, String title, String course_img) {

        this.participant_count = participant_count;
        this.title = title;
        this.course_img = course_img;
    }

    public DashBoard_v2_DTO(String trainer_id, Long total_earnings, String fullname, String trainer_img) {
        this.trainer_id = trainer_id;
        this.total_earnings = total_earnings;
        this.fullname = fullname;
        this.trainer_img = trainer_img;
    }

    public String getTrainer_id() {
        return trainer_id;
    }

    public void setTrainer_id(String trainer_id) {
        this.trainer_id = trainer_id;
    }

    public Long getTotal_earnings() {
        return total_earnings;
    }

    public void setTotal_earnings(Long total_earnings) {
        this.total_earnings = total_earnings;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getTrainer_img() {
        return trainer_img;
    }

    public void setTrainer_img(String trainer_img) {
        this.trainer_img = trainer_img;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }

    public String getParticipant_count() {
        return participant_count;
    }

    public void setParticipant_count(String participant_count) {
        this.participant_count = participant_count;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCourse_img() {
        return course_img;
    }

    public void setCourse_img(String course_img) {
        this.course_img = course_img;
    }

    
}
