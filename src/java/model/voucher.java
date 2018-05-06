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
public class voucher {
    private int id;
    private String hashVoucher;
    private float value;  

    public voucher(int id, String hashVoucher, float value) {
        this.id = id;
        this.hashVoucher = hashVoucher;
        this.value = value;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setHashVoucher(String hashVoucher) {
        this.hashVoucher = hashVoucher;
    }

    public int getId() {
        return id;
    }

    public String getHashVoucher() {
        return hashVoucher;
    }

    public void setValue(float value) {
        this.value = value;
    }


    public float getValue() {
        return value;
    }

    public voucher(){}
    
}
