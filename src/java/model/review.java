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
public class review {
    private int id;
    private String name;
    private String email;
    private String tel;
    private String comment;
    private String date;
    private String productid;

    public void setDate(String date) {
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getTel() {
        return tel;
    }

    public String getComment() {
        return comment;
    }

    public String getProductid() {
        return productid;
    }

    public review(){}
    
    public review(String name, String email, String tel, String comment, String productid) {
        this.name = name;
        this.email = email;
        this.tel = tel;
        this.comment = comment;
        this.productid = productid;
    }
}
