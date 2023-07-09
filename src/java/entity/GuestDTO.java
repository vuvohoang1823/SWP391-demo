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
 * @author hoang
 */
public class GuestDTO implements Serializable{
    private String id;
    private String fullname;
    private String email;
    private String titleQ;
    private String titleMess;
    private String status;
    private Date submitDate;
    private String answer;

    public GuestDTO(String id, String fullname, String email, String titleQ, String titleMess, String status, Date submitDate, String answer) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.titleQ = titleQ;
        this.titleMess = titleMess;
        this.status = status;
        this.submitDate = submitDate;
        this.answer = answer;
    }
    

    public GuestDTO(String id, String fullname, String email, String titleQ, String titleMess, String status, Date submitDate) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.titleQ = titleQ;
        this.titleMess = titleMess;
        this.status = status;
        this.submitDate = submitDate;
    }

    public GuestDTO(String id, String fullname, String email, String titleQ, String titleMess, String status) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.titleQ = titleQ;
        this.titleMess = titleMess;
        this.status = status;
    }

    public GuestDTO() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTitleQ() {
        return titleQ;
    }

    public void setTitleQ(String titleQ) {
        this.titleQ = titleQ;
    }

    public String getTitleMess() {
        return titleMess;
    }

    public void setTitleMess(String titleMess) {
        this.titleMess = titleMess;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
    
    
}
