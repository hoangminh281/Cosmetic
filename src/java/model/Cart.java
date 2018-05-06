
package model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private HashMap<Integer, Item> cartitem;
    private voucher vouch;

    public void setVouch(voucher vouch) {
        this.vouch = vouch;
    }

    public voucher getVouch() {
        return vouch;
    }

    public Cart() {
        cartitem = new HashMap<>();
        vouch = new voucher();
    }

    public Cart(HashMap<Integer, Item> cartitem) {
        this.cartitem = cartitem;
        vouch = new voucher();
    }

    public void setCartitem(HashMap<Integer, Item> cartitem) {
        this.cartitem = cartitem;
    }

    public HashMap<Integer, Item> getCartitem() {
        return cartitem;
    }
    //them 1 item
    public void themitem(Integer key, Item item) {
        if (cartitem.containsKey(key)) {
            item.setQuanlity(item.getQuanlity()+1);
            cartitem.put(key, item);
        } else {
            cartitem.put(key, item);
        }
    }
    //xoa 1 item
    public void xoaitem(Integer key, Item item) {
        if (cartitem.containsKey(key)) {
            if (item.getQuanlity()<=1) {
                cartitem.remove(key);
            } else {
                item.setQuanlity(item.getQuanlity()-1);
                cartitem.put(key, item);
            }
        }
    }
    //xoa luon item
    public void xoaluonitem(Integer key) {
        if (cartitem.containsKey(key)) {
            cartitem.remove(key);
        }
    }
    public void xoavoucher() {
        vouch = new voucher();
    }
    //xoagiohang
    public void xoacart() {
        cartitem.clear();
        vouch = new voucher();
    }
    //dem so luong
    public int demitem() {
        return cartitem.size();
    }
    public double tinhtongtien() {
        double sum=0;
        for (Map.Entry<Integer, Item> list: cartitem.entrySet()) {
            sum+=(list.getValue().getProduct().getPriceNew()!=0?list.getValue().getProduct().getPriceNew():list.getValue().getProduct().getPrice()) * list.getValue().getQuanlity();
        }
        return sum;
    }
}
