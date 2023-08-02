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
 * @author LAPTOP
 */
public class WorkshopDDD implements Serializable {

    private String title;
    private String fullname;
    private Date dateCheck;
    private Date complete_date;
    private int amount;
    private String customer_fullname;
    private String customer_gmail;
    private String customer_contact;
    private String attendance;
    private String course_id;
    private String customer_id;
    private String status;
    private String workshop_id;
    private String attendance_id;
    private String trainer_fullname;
    private String certificate_status;
    private String attendance_status;

    public WorkshopDDD() {
    }

    public WorkshopDDD(String customer_id, String customer_fullname, String customer_gmail, String customer_contact, String attendance_id, String attendance, String title, Date complete_date, int amount, Date dateCheck, String status, String trainer_fullname, String certificate_status) {
        this.title = title;
        this.dateCheck = dateCheck;
        this.complete_date = complete_date;
        this.amount = amount;
        this.customer_fullname = customer_fullname;
        this.customer_gmail = customer_gmail;
        this.customer_contact = customer_contact;
        this.attendance = attendance;
        this.customer_id = customer_id;
        this.status = status;
        this.attendance_id = attendance_id;
        this.trainer_fullname = trainer_fullname;
        this.certificate_status = certificate_status;
    }

    public WorkshopDDD(String customer_fullname, String customer_gmail, String customer_contact, String attendance, String course_id, String customer_id, String status, String workshop_id, String title) {
        this.customer_fullname = customer_fullname;
        this.customer_gmail = customer_gmail;
        this.customer_contact = customer_contact;
        this.attendance = attendance;
        this.course_id = course_id;
        this.customer_id = customer_id;
        this.status = status;
        this.workshop_id = workshop_id;
        this.title = title;
    }

    public WorkshopDDD(String title, String fullname, Date dateCheck, int amount, String status, String customer_id, String course_id, String attendance_id, String certificate_status, String attendance_status) {
        this.title = title;
        this.fullname = fullname;
        this.dateCheck = dateCheck;
        this.amount = amount;
        this.status = status;
        this.customer_id = customer_id;
        this.course_id = course_id;
        this.attendance_id = attendance_id;
        this.certificate_status = certificate_status;
        this.attendance_status = attendance_status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Date getDateCheck() {
        return dateCheck;
    }

    public void setDateCheck(Date dateCheck) {
        this.dateCheck = dateCheck;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getCustomer_fullname() {
        return customer_fullname;
    }

    public void setCustomer_fullname(String customer_fullname) {
        this.customer_fullname = customer_fullname;
    }

    public String getCustomer_gmail() {
        return customer_gmail;
    }

    public void setCustomer_gmail(String customer_gmail) {
        this.customer_gmail = customer_gmail;
    }

    public String getCustomer_contact() {
        return customer_contact;
    }

    public void setCustomer_contact(String customer_contact) {
        this.customer_contact = customer_contact;
    }

    public String getAttendance() {
        return attendance;
    }

    public void setAttendance(String attendance) {
        this.attendance = attendance;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getWorkshop_id() {
        return workshop_id;
    }

    public void setWorkshop_id(String workshop_id) {
        this.workshop_id = workshop_id;
    }

    public String getAttendance_id() {
        return attendance_id;
    }

    public void setAttendance_id(String attendance_id) {
        this.attendance_id = attendance_id;
    }

    public Date getComplete_date() {
        return complete_date;
    }

    public void setComplete_date(Date complete_date) {
        this.complete_date = complete_date;
    }

    public String getTrainer_fullname() {
        return trainer_fullname;
    }

    public void setTrainer_fullname(String trainer_fullname) {
        this.trainer_fullname = trainer_fullname;
    }

    public String getCertificate_status() {
        return certificate_status;
    }

    public void setCertificate_status(String certificate_status) {
        this.certificate_status = certificate_status;
    }

    public String getAttendance_status() {
        return attendance_status;
    }

    public void setAttendance_status(String attendance_status) {
        this.attendance_status = attendance_status;
    }

}
