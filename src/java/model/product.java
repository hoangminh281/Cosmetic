/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Lãng
 */
public class product {
    
    private int id;
    private String Name;
    private String Detail;
    private float Price;
    private float PriceNew;
    private String Images;
    private int GroupProduct_Id;

    public void setPriceNew(float PriceNew) {
        this.PriceNew = PriceNew;
    }

    public float getPriceNew() {
        return PriceNew;
    }
    

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setDetail(String Detail) {
        this.Detail = Detail;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public void setImages(String Images) {
        this.Images = Images;
    }

    public void setGroupProduct_Id(int GroupProduct_Id) {
        this.GroupProduct_Id = GroupProduct_Id;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return Name;
    }

    public String getDetail() {
        return Detail;
    }

    public float getPrice() {
        return Price;
    }

    public String getImages() {
        return Images;
    }

    
    public int getGroupProduct_Id() {
        return GroupProduct_Id;
    }
        
    public product(){}
    
    public product(int id, String Name, String Detail, float Price,float PriceNew, String Images) {
        this.id = id;
        this.Name = Name;
        this.Detail = Detail;
        this.Price = Price;
        this.Images = Images;
        this.PriceNew = PriceNew;
    }
}
