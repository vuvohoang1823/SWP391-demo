/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.service;

import java.io.Serializable;

/**
 *
 * @author hoang
 */
public class Workshop  implements Serializable{
    private String title ; 
    private String image;

    public Workshop(String title, String image) {
        this.title = title;
        this.image = image;
    }

    public Workshop() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}
