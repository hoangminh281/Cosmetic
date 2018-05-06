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
public class groupproduct {
    private int id;
    private String name;
    private String images;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
    
    public groupproduct(){}

    public groupproduct(int id, String name, String content, String images, int order, int status) {
        this.id = id;
        this.name = name;
        this.images = images;
    }
}
