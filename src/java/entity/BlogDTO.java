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
public class BlogDTO implements Serializable {

    private String blogid;
    private String staff_id;
    private Date date;
    private String thumbnail;
    private String title;
    private String author;
    private String introduction;
    private String content1;
    private String content2;
    private String inconclusion;
    private String contentIMG;

    public BlogDTO(String blogid, String staff_id, Date date, String thumbnail, String title, String author, String introduction, String content1, String content2, String inconclusion, String contentIMG) {
        this.blogid = blogid;
        this.staff_id = staff_id;
        this.date = date;
        this.thumbnail = thumbnail;
        this.title = title;
        this.author = author;
        this.introduction = introduction;
        this.content1 = content1;
        this.content2 = content2;
        this.inconclusion = inconclusion;
        this.contentIMG = contentIMG;
    }

    public BlogDTO() {
    }

    public String getBlogid() {
        return blogid;
    }

    public void setBlogid(String blogid) {
        this.blogid = blogid;
    }

    public String getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(String staff_id) {
        this.staff_id = staff_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getContent1() {
        return content1;
    }

    public void setContent1(String content1) {
        this.content1 = content1;
    }

    public String getContent2() {
        return content2;
    }

    public void setContent2(String content2) {
        this.content2 = content2;
    }

    public String getInconclusion() {
        return inconclusion;
    }

    public void setInconclusion(String inconclusion) {
        this.inconclusion = inconclusion;
    }

    public String getContentIMG() {
        return contentIMG;
    }

    public void setContentIMG(String contentIMG) {
        this.contentIMG = contentIMG;
    }
    
    

}
