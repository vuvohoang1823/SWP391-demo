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
public class BirdDTO {

    private String bird_id;
    private String name;
    private String type;
    private String image;
    private String birthDate;
    private String customerName;

    public BirdDTO(String bird_id, String name, String type) {
        this.bird_id = bird_id;
        this.name = name;
        this.type = type;
    }

    public BirdDTO(String bird_id, String name, String type, String image) {
        this.bird_id = bird_id;
        this.name = name;
        this.type = type;
        this.image = image;
    }

    public BirdDTO(String bird_id, String name, String type, String image, String birthDate, String customerName) {
        this.bird_id = bird_id;
        this.name = name;
        this.type = type;
        this.image = image;
        this.birthDate = birthDate;
        this.customerName = customerName;
    }

    public BirdDTO(String bird_id, String type) {
        this.bird_id = bird_id;
        this.type = type;
    }

    public BirdDTO() {
    }

    @Override
    public String toString() {
        return "BirdDTO{" + "bird_id=" + bird_id + ", name=" + name + ", type=" + type + ", image=" + image + '}';
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
    
}
