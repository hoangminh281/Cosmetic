/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbHelpers;

import tool.Md5;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Item;
import model.customer;
import model.groupproduct;
import model.product;
import model.review;
import model.voucher;

/**
 *
 * @author Lãng
 */
public class products_query {

    private Connection conn;
    private ResultSet results;

    public products_query() {
        Properties props = new Properties();
        InputStream instr = getClass().getResourceAsStream("dbConn.properties");
        try {
            props.load(instr);
            instr.close();
        } catch (IOException ex) {
            Logger.getLogger(products_query.class.getName()).log(Level.SEVERE, null, ex);
        }
        String driver = props.getProperty("driver.name");
        String url = props.getProperty("server.name");
        String username = props.getProperty("user.name");
        String password = props.getProperty("user.password");
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(products_query.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            conn = (Connection) DriverManager.getConnection(url, username, password);
        } catch (SQLException ex) {
            Logger.getLogger(products_query.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<product> doc_sp() throws SQLException {
        String query = "select * from product";
        PreparedStatement ps = conn.prepareStatement(query);
        this.results = ps.executeQuery();
        ArrayList<product> arr = new ArrayList<>();
        while (this.results.next()) {
            product pd = new product();
            pd.setId(this.results.getInt("id"));
            pd.setName(this.results.getString("Name"));
            pd.setDetail(this.results.getString("Detail"));
            pd.setPrice(this.results.getFloat("Price"));
            pd.setPriceNew(this.results.getFloat("PriceNew"));
            pd.setImages(this.results.getString("Images"));
            pd.setGroupProduct_Id(this.results.getInt("GroupProduct_Id"));
            arr.add(pd);
        }
        return arr;
    }

    public ArrayList<product> doc_sp_phantrang(int vt, int limit) throws SQLException {
        String query = "select * from Product limit ?,?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, vt);
        ps.setInt(2, limit);
        this.results = ps.executeQuery();
        ArrayList<product> arr = new ArrayList<>();
        while (this.results.next()) {
            product pd = new product();
            pd.setId(this.results.getInt("id"));
            pd.setName(this.results.getString("Name"));
            pd.setDetail(this.results.getString("Detail"));
            pd.setPrice(this.results.getFloat("Price"));
            pd.setPriceNew(this.results.getFloat("PriceNew"));
            pd.setImages(this.results.getString("Images"));
            pd.setGroupProduct_Id(this.results.getInt("GroupProduct_Id"));
            arr.add(pd);
        }
        return arr;
    }

    public ArrayList<product> doc_sptheonhomsp_phantrang(int groupid, int vt, int limit) throws SQLException {
        String query = "select * from product where GroupProduct_Id = ? limit ?,?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, groupid);
        ps.setInt(2, vt);
        ps.setInt(3, limit);
        this.results = ps.executeQuery();
        ArrayList<product> arr = new ArrayList<>();
        while (this.results.next()) {
            product pd = new product();
            pd.setId(this.results.getInt("id"));
            pd.setName(this.results.getString("Name"));
            pd.setDetail(this.results.getString("Detail"));
            pd.setPrice(this.results.getFloat("Price"));
            pd.setPriceNew(this.results.getFloat("PriceNew"));
            pd.setImages(this.results.getString("Images"));
            pd.setGroupProduct_Id(this.results.getInt("GroupProduct_Id"));
            arr.add(pd);
        }
        return arr;
    }

    public product doc_sp_masp(int masv) throws SQLException {
        String query = "select * from Product where id = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, masv);
        this.results = ps.executeQuery();
        if (this.results.next()) {
            product pd = new product();
            pd.setId(this.results.getInt("id"));
            pd.setName(this.results.getString("Name"));
            pd.setDetail(this.results.getString("Detail"));
            pd.setPrice(this.results.getFloat("Price"));
            pd.setPriceNew(this.results.getFloat("PriceNew"));
            pd.setImages(this.results.getString("Images"));
            pd.setGroupProduct_Id(this.results.getInt("GroupProduct_Id"));
            return pd;
        }
        return null;
    }

    public ArrayList<product> doc_sp_nhomsp(int groupid, int limit) throws SQLException {
        String query = "select * from product where GroupProduct_Id = ? limit ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, groupid);
        ps.setInt(2, limit);
        this.results = ps.executeQuery();
        ArrayList<product> arr = new ArrayList<>();
        while (this.results.next()) {
            product pd = new product();
            pd.setId(this.results.getInt("id"));
            pd.setName(this.results.getString("Name"));
            pd.setDetail(this.results.getString("Detail"));
            pd.setPrice(this.results.getFloat("Price"));
            pd.setPriceNew(this.results.getFloat("PriceNew"));
            pd.setImages(this.results.getString("Images"));
            pd.setGroupProduct_Id(this.results.getInt("GroupProduct_Id"));
            arr.add(pd);
        }
        return arr;
    }

    public ArrayList<product> doc_sp_nhomsplienquan(int id, int groupid, int limit) throws SQLException {
        String query = "select * from product where GroupProduct_Id = ? and id <> ? limit ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, groupid);
        ps.setInt(2, id);
        ps.setInt(3, limit);
        this.results = ps.executeQuery();
        ArrayList<product> arr = new ArrayList<>();
        while (this.results.next()) {
            product pd = new product();
            pd.setId(this.results.getInt("id"));
            pd.setName(this.results.getString("Name"));
            pd.setDetail(this.results.getString("Detail"));
            pd.setPrice(this.results.getFloat("Price"));
            pd.setPriceNew(this.results.getFloat("PriceNew"));
            pd.setImages(this.results.getString("Images"));
            pd.setGroupProduct_Id(this.results.getInt("GroupProduct_Id"));
            arr.add(pd);
        }
        return arr;
    }

    public ArrayList<groupproduct> doc_nhomsp() throws SQLException {
        String query = "select * from groupproduct";
        PreparedStatement ps = conn.prepareStatement(query);
        this.results = ps.executeQuery();
        ArrayList<groupproduct> arr = new ArrayList<>();
        while (this.results.next()) {
            groupproduct gp = new groupproduct();
            gp.setId(this.results.getInt("id"));
            gp.setName(this.results.getString("Name"));
            gp.setImages(this.results.getString("Images"));
            arr.add(gp);
        }
        return arr;
    }

    public groupproduct doc_nhomsp_id(int id) throws SQLException {
        String query = "select * from groupproduct where id=?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, id);
        this.results = ps.executeQuery();
        if (this.results.next()) {
            groupproduct gp = new groupproduct();
            gp.setId(this.results.getInt("id"));
            gp.setName(this.results.getString("Name"));
            gp.setImages(this.results.getString("Images"));
            return gp;
        }
        return null;
    }

    public int doc_soluongsp() throws SQLException {
        String query = "select count(*) as soluong from product";
        PreparedStatement ps = conn.prepareStatement(query);
        this.results = ps.executeQuery();
        if (this.results.next()) {
            return this.results.getInt("soluong");
        }
        return 0;
    }

    public int doc_soluongnhomsp() throws SQLException {
        String query = "select count(*) as soluong from groupproduct";
        PreparedStatement ps = conn.prepareStatement(query);
        this.results = ps.executeQuery();
        if (this.results.next()) {
            return this.results.getInt("soluong");
        }
        return 0;
    }

    public int doc_soluongsptheonhom(int groupid) throws SQLException {
        String query = "select count(*) as soluong from product where GroupProduct_Id = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, groupid);
        this.results = ps.executeQuery();
        if (this.results.next()) {
            return this.results.getInt("soluong");
        }
        return 0;
    }

    public int doc_soluongsptheogia(int tu, int den) throws SQLException {
        PreparedStatement ps;
        String query;
        if (tu == -1) {
            query = "select count(*) as soluong from product where Price < ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, den);
        } else if (den == -1) {
            query = "select count(*) as soluong from product where Price >= ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, tu);
        } else {
            query = "select count(*) as soluong from product where Price >= ?  and Price < ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, tu);
            ps.setInt(2, den);
        }
        this.results = ps.executeQuery();
        if (this.results.next()) {
            return this.results.getInt("soluong");
        }
        return 0;
    }

    public ArrayList<product> doc_sptheogia_phantrang(int tu, int den, int vt, int limit) throws SQLException {
        PreparedStatement ps;
        String query;
        if (tu == -1) {
            query = "select * from product where Price < ? order by Price limit ?,?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, den);
            ps.setInt(2, vt);
            ps.setInt(3, limit);
        } else if (den == -1) {
            query = "select * from product where Price >= ? order by Price limit ?,?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, tu);
            ps.setInt(2, vt);
            ps.setInt(3, limit);
        } else {
            query = "select * from product where Price >= ? and Price < ? order by Price limit ?,?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, tu);
            ps.setInt(2, den);
            ps.setInt(3, vt);
            ps.setInt(4, limit);
        }
        this.results = ps.executeQuery();
        ArrayList<product> arr = new ArrayList<>();
        while (this.results.next()) {
            product pd = new product();
            pd.setId(this.results.getInt("id"));
            pd.setName(this.results.getString("Name"));
            pd.setDetail(this.results.getString("Detail"));
            pd.setPrice(this.results.getFloat("Price"));
            pd.setPriceNew(this.results.getFloat("PriceNew"));
            pd.setImages(this.results.getString("Images"));
            pd.setGroupProduct_Id(this.results.getInt("GroupProduct_Id"));
            arr.add(pd);
        }
        return arr;
    }

    public customer dangnhap(String email, String password) throws SQLException {
        String query = "select * from customer where Email = ? and Password = ? ";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, password);
        this.results = ps.executeQuery();
        if (this.results.next()) {
            customer ct = new customer();
            ct.setId(this.results.getInt("id"));
            ct.setName(this.results.getString("Name"));
            ct.setEmail(this.results.getString("Email"));
            ct.setPassworld(this.results.getString("Password"));
            return ct;
        }
        return null;
    }

    public int kiemtra_emaildangki(String email) throws SQLException {
        String query = "select count(Email) as dem from customer where Email = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, email);
        this.results = ps.executeQuery();
        if (this.results.next()) {
            return this.results.getInt("dem");
        }
        return -1;
    }

    public void dangki(String name, String email, String password) throws SQLException {
        String query = "insert into customer(Name,Email,Password) values(?,?,?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.executeUpdate();
    }

    public ArrayList<review> doc_review(int productid) throws SQLException {
        String query = "select * from reviews where productid=" + productid;
        PreparedStatement ps = conn.prepareStatement(query);
        this.results = ps.executeQuery();
        ArrayList<review> arr = new ArrayList<>();
        while (this.results.next()) {
            review rv = new review();
            rv.setId(this.results.getInt("id"));
            rv.setName(this.results.getString("name"));
            rv.setEmail(this.results.getString("email"));
            rv.setTel(this.results.getString("tel"));
            rv.setComment(this.results.getString("comment"));
            rv.setDate(this.results.getString("date"));
            rv.setProductid(this.results.getString("productid"));
            arr.add(rv);
        }
        return arr;
    }

    public void them_review(review rv) throws SQLException {
        String query = "insert into reviews(name,email,tel, comment, productid) values(?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, rv.getName());
        ps.setString(2, rv.getEmail());
        ps.setString(3, rv.getTel());
        ps.setString(4, rv.getComment());
        ps.setString(5, rv.getProductid());
        ps.executeUpdate();
    }

    public int tim_soluongsptheoten(String st) throws SQLException {
        String query = "select count(*) as soluong from product where name like '%" + st + "%'";
        PreparedStatement ps = conn.prepareStatement(query);
        this.results = ps.executeQuery();
        if (this.results.next()) {
            return this.results.getInt("soluong");
        }
        return 0;
    }

    public ArrayList<product> tim_sptheotenphantrang(String st, int vt, int limit) throws SQLException {
        String query = "select * from product where name like '%" + st + "%' limit ?,?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, vt);
        ps.setInt(2, limit);
        this.results = ps.executeQuery();
        ArrayList<product> arr = new ArrayList<>();
        while (this.results.next()) {
            product pd = new product();
            pd.setId(this.results.getInt("id"));
            pd.setName(this.results.getString("Name"));
            pd.setDetail(this.results.getString("Detail"));
            pd.setPrice(this.results.getFloat("Price"));
            pd.setPriceNew(this.results.getFloat("PriceNew"));
            pd.setImages(this.results.getString("Images"));
            pd.setGroupProduct_Id(this.results.getInt("GroupProduct_Id"));
            arr.add(pd);
        }
        return arr;
    }

    public voucher doc_voucher(String hash) throws SQLException {
        String query = "select * from voucher where hashId = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, hash);
        this.results = ps.executeQuery();
        if (this.results.next()) {
            voucher vc = new voucher();
            vc.setId(this.results.getInt("id"));
            vc.setHashVoucher(this.results.getString("hashId"));
            vc.setValue(this.results.getFloat("value"));
            return vc;
        }
        return null;
    }

    public void them_voucher(String id, float value) throws SQLException {
        String query = "insert into voucher(hashId,value) value(?,?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, id);
        ps.setFloat(2, value);
        ps.executeUpdate();
    }

    public int them_order(customer ct, Cart cart) throws SQLException {
        String query = "insert into qlmp.order(Customer_Id,TotalMoney,idvoucher,Status) value(?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, ct.getId());
        ps.setDouble(2, cart.tinhtongtien() + cart.tinhtongtien() / 10 - (cart.tinhtongtien() * cart.getVouch().getValue()) / 100);
        ps.setInt(3, cart.getVouch().getId());
        ps.setInt(4, 1);
        ps.executeUpdate();
        this.results = ps.getGeneratedKeys();
        int key = 0;
        if (this.results.next()) {
            key = this.results.getInt(1);
        }
        return key;
    }

    public void dathang(customer ct, Cart cart) throws SQLException {
        int orderid = them_order(ct, cart);
        String query;
        PreparedStatement ps;
        for (Map.Entry<Integer, Item> list : cart.getCartitem().entrySet()) {
            query = "insert into qlmp.orderdetail(Order_Id,Product_Id,Quanlity) value(?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderid);
            ps.setDouble(2, list.getValue().getProduct().getId());
            ps.setInt(3, list.getValue().getQuanlity());
            ps.executeUpdate();
        }
    }

    public static void main(String[] args) throws SQLException {
        products_query pq = new products_query();
        System.out.println(pq.kiemtra_emaildangki("hoangminh@gmail"));
    }
}
