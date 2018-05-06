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
public class Item {
    private product product;
    private int quanlity;

    public Item(product product, int quanlity) {
        this.product = product;
        this.quanlity = quanlity;
    }

    public void setProduct(product product) {
        this.product = product;
    }

    public void setQuanlity(int quanlity) {
        this.quanlity = quanlity;
    }

    public product getProduct() {
        return product;
    }

    public int getQuanlity() {
        return quanlity;
    }
    public float getPrice() {
        return product.getPriceNew()!=0?product.getPriceNew():product.getPrice(); 
    }
    public float getsumitem() {
        return quanlity * (product.getPriceNew()!=0?product.getPriceNew():product.getPrice());
    }
}
