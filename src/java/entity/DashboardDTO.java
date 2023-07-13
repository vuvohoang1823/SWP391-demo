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
public class DashboardDTO {

    private int workshop;
    private int onlineCourse;
    private int consultation;
    private int birdCourse;
    private int total;

    public DashboardDTO() {
    }

    public DashboardDTO(int total) {
        this.total = total;
    }

    public DashboardDTO(int workshop, int onlineCourse, int consultation, int birdCourse, int total) {
        this.workshop = workshop;
        this.onlineCourse = onlineCourse;
        this.consultation = consultation;
        this.birdCourse = birdCourse;
        this.total = total;
    }

    public int getWorkshop() {
        return workshop;
    }

    public void setWorkshop(int workshop) {
        this.workshop = workshop;
    }

    public int getOnlineCourse() {
        return onlineCourse;
    }

    public void setOnlineCourse(int onlineCourse) {
        this.onlineCourse = onlineCourse;
    }

    public int getConsultation() {
        return consultation;
    }

    public void setConsultation(int consultation) {
        this.consultation = consultation;
    }

    public int getBirdCourse() {
        return birdCourse;
    }

    public void setBirdCourse(int birdCourse) {
        this.birdCourse = birdCourse;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

}