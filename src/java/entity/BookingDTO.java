/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author hoang
 */
public class BookingDTO {

    private String courseImg;
    private String trainerID;
    private String trainerName;
    private String trainerImg;
    private String courseID;
    private String courseName;
    private int coursePrice;
    private String customerID;
    private String customerName;
    private String birdID;
    private String nameBird;
    private String typeBird;
    private Date start_date;
    private Date end_date;
    private String status;
    private int amount;
    private int payment_id;
    private String category;
    private Date create_date;
    private Date preferred_date;
    private Date checkout_date;

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getPreferred_date() {
        return preferred_date;
    }

    public void setPreferred_date(Date preferred_date) {
        this.preferred_date = preferred_date;
    }

    public Date getCheckout_date() {
        return checkout_date;
    }

    public void setCheckout_date(Date checkout_date) {
        this.checkout_date = checkout_date;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public BookingDTO(String trainerID, String courseID, String customerID, String birdID, String nameBird, String typeBird, Date start_date, Date end_date, String status, int amount, int payment_id) {
        this.trainerID = trainerID;
        this.courseID = courseID;
        this.customerID = customerID;
        this.birdID = birdID;
        this.nameBird = nameBird;
        this.typeBird = typeBird;
        this.start_date = start_date;
        this.end_date = end_date;
        this.status = status;
        this.amount = amount;
        this.payment_id = payment_id;
    }

    public BookingDTO(String trainerName, String courseName, int coursePrice, String customerName, String birdID, String nameBird, String typeBird, Date start_date, Date end_date, String status, Date create_date) {
        this.trainerName = trainerName;
        this.courseName = courseName;
        this.coursePrice = coursePrice;
        this.customerName = customerName;
        this.birdID = birdID;
        this.nameBird = nameBird;
        this.typeBird = typeBird;
        this.start_date = start_date;
        this.end_date = end_date;
        this.status = status;
        this.create_date = create_date;
    }

    public BookingDTO(String customer_id, String courseID, String trainer_id, String birdName, String birdtype, String category, String title, int price, String image, Date start_Date, Date end_date, String status, int amount, int payment_id) {
        this.customerID = customer_id;
        this.courseID = courseID;
        this.trainerID = trainer_id;
        this.nameBird = birdName;
        this.typeBird = birdtype;
        this.category = category;
        this.courseName = title;
        this.coursePrice = price;
        this.courseImg = image;
        this.start_date = start_Date;
        this.end_date = end_date;
        this.status = status;
        this.amount = amount;
        this.payment_id = payment_id;
    }

    public BookingDTO(String trainerName, String courseName, int coursePrice, String customerName, String nameBird, String typeBird, Date start_date, Date end_date, Date checkout_date, String birdID) {
        this.trainerName = trainerName;
        this.courseName = courseName;
        this.coursePrice = coursePrice;
        this.customerName = customerName;
        this.nameBird = nameBird;
        this.typeBird = typeBird;
        this.start_date = start_date;
        this.end_date = end_date;
        this.checkout_date = checkout_date;
        this.birdID = birdID;
    }

    public BookingDTO(String customerName, String courseName, String typeBird, String birdID, Date create_date) {
        this.customerName = customerName;
        this.courseName = courseName;
        this.typeBird = typeBird;
        this.birdID = birdID;
        this.create_date = create_date;
    }

    public BookingDTO(String birdID, String courseName, int coursePrice, String customerName, Date start_date) {
        this.birdID = birdID;
        this.courseName = courseName;
        this.coursePrice = coursePrice;
        this.customerName = customerName;
        this.start_date = start_date;
    }

    public BookingDTO(String courseID, String courseName, String courseImg, String birdID, String nameBird, String typeBird, Date start_date, Date end_date, String status) {
        this.courseImg = courseImg;
        this.courseID = courseID;
        this.courseName = courseName;
        this.birdID = birdID;
        this.nameBird = nameBird;
        this.typeBird = typeBird;
        this.start_date = start_date;
        this.end_date = end_date;
        this.status = status;
    }

    public BookingDTO(String courseID, String courseName, String courseImg, String trainerID, String trainerName, String trainerImg, String birdID, String nameBird, String typeBird, Date start_date, Date end_date, String status) {
        this.courseImg = courseImg;
        this.trainerID = trainerID;
        this.trainerName = trainerName;
        this.trainerImg = trainerImg;
        this.courseID = courseID;
        this.courseName = courseName;
        this.birdID = birdID;
        this.nameBird = nameBird;
        this.typeBird = typeBird;
        this.start_date = start_date;
        this.end_date = end_date;
        this.status = status;
    }

    public BookingDTO(String customerName, String nameBird, String typeBird, String courseName, int coursePrice, Date create_date, Date preferred_date, String birdID) {
        this.courseName = courseName;
        this.coursePrice = coursePrice;
        this.customerName = customerName;
        this.nameBird = nameBird;
        this.typeBird = typeBird;
        this.create_date = create_date;
        this.preferred_date = preferred_date;
        this.birdID = birdID;
    }

    public BookingDTO(String customerName, String nameBird, String typeBird, String courseName, int coursePrice, Date create_date, Date preferred_date, String birdID, String status, Date start_date, Date end_date, Date checkout_date) {
        this.courseName = courseName;
        this.coursePrice = coursePrice;
        this.customerName = customerName;
        this.nameBird = nameBird;
        this.typeBird = typeBird;
        this.create_date = create_date;
        this.preferred_date = preferred_date;
        this.birdID = birdID;
    }

    public BookingDTO(String trainerName, String courseName, int coursePrice, String customerName, String birdID, String nameBird, String typeBird, Date start_date, Date end_date, String status, Date create_date, Date preferred_date, Date checkout_date) {
        this.trainerName = trainerName;
        this.courseName = courseName;
        this.coursePrice = coursePrice;
        this.customerName = customerName;
        this.birdID = birdID;
        this.nameBird = nameBird;
        this.typeBird = typeBird;
        this.start_date = start_date;
        this.end_date = end_date;
        this.status = status;
        this.create_date = create_date;
        this.preferred_date = preferred_date;
        this.checkout_date = checkout_date;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getCoursePrice() {
        return coursePrice;
    }

    public void setCoursePrice(int coursePrice) {
        this.coursePrice = coursePrice;
    }

    public BookingDTO() {
    }

    public String getCourseImg() {
        return courseImg;
    }

    public void setCourseImg(String courseImg) {
        this.courseImg = courseImg;
    }

    public String getTrainerName() {
        return trainerName;
    }

    public void setTrainerName(String trainerName) {
        this.trainerName = trainerName;
    }

    public String getTrainerImg() {
        return trainerImg;
    }

    public void setTrainerImg(String trainerImg) {
        this.trainerImg = trainerImg;
    }

    public String getTrainerID() {
        return trainerID;
    }

    public void setTrainerID(String trainerID) {
        this.trainerID = trainerID;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getBirdID() {
        return birdID;
    }

    public void setBirdID(String birdID) {
        this.birdID = birdID;
    }

    public String getNameBird() {
        return nameBird;
    }

    public void setNameBird(String nameBird) {
        this.nameBird = nameBird;
    }

    public String getTypeBird() {
        return typeBird;
    }

    public void setTypeBird(String typeBird) {
        this.typeBird = typeBird;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

}
