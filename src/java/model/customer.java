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
public class customer {

    private int id;
    private String name;
    private String email;
    private String password;

    public customer() {
    }

    public customer( String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }
    public customer(int id, String name, String email, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassworld(String passworld) {
        this.password = passworld;
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getPassworld() {
        return password;
    }
}
