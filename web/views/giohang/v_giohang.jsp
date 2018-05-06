
<%@page import="model.customer"%>
<%@page import="model.Cart"%>
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--giohang-->
<div class="giohang">
    <div class="container">
        <h3 class="styleh3">Giỏ hàng</h3>
        <table class="table table-striped table-bordered table-responsive">
            <thead>
                <tr>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Mã sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Thành tiền</th>
                </tr>
            </thead>
            <tbody>
                <% int count = 1;
                    for (Map.Entry<Integer, Item> list : cart.getCartitem().entrySet()) {
                        count++;%>
                <tr>
                    <td><img src="public/images/<%=list.getValue().getProduct().getImages()%>" class="img-responsive img-order"> </td>
                    <td style="width: 400px"><%=list.getValue().getProduct().getName()%></td>
                    <td><%=list.getValue().getProduct().getId()%></td>
                    <td><div class="quantity"> 
                            <div class="quantity-select">                           
                                <div onclick="giamsl(<%=list.getKey()%>)" class="entry value-minus1 value-minus<%=count%>">&nbsp;</div>
                                <div class="entry value1 value<%=count%>"><span><%=list.getValue().getQuanlity()%></span></div>
                                <div onclick="tangsl(<%=list.getKey()%>)" class="entry value-plus1 value-plus<%=count%> active">&nbsp;</div>
                            </div>
                        </div></td>
                    <td id="dongia<%=count%>"><%=list.getValue().getPrice()%> VNĐ</td>
                    <td id="thanhtien<%=count%>"><%=list.getValue().getsumitem()%> VNĐ</td>
                    <!--quantity-->
            <script>
                $('.value-plus<%=count%>').on('click', function () {
                    var divUpd = $(this).parent().find('.value<%=count%>'), newVal = parseInt(divUpd.text(), 10) + 1;
                    divUpd.text(newVal);
                    var dongia = $('#dongia<%=count%>');
                    var thanhtien = $('#thanhtien<%=count%>');
                    thanhtien.text(parseInt(dongia.text(), 10) * newVal + ".0 VNĐ");
                });
                $('.value-minus<%=count%>').on('click', function () {
                    var divUpd = $(this).parent().find('.value<%=count%>'), newVal = parseInt(divUpd.text(), 10);
                    if (newVal > 1) {
                        newVal -= 1;
                        divUpd.text(newVal);
                    }
                    var dongia = $('#dongia<%=count%>');
                    var thanhtien = $('#thanhtien<%=count%>');
                    thanhtien.text(parseInt(dongia.text(), 10) * newVal + ".0 VNĐ");
                });
            </script>
            <!--quantity-->
            <%}%>
            </tbody>
        </table>
        <div class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title fonth3">Áp dụng mã giảm giá</h5>
                </div>
                <div class="panel-body">
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon3">Nhập mã giảm giá ở đây:</span>
                        <input type="text" class="form-control" id="voucherText" name="voucherText" placeholder="Nhập mã giảm giá ở đây...">
                        <div class="input-group-btn">
                            <span class="input-group-btn"><button onclick="checkvoucher()" type="button" id="" class="btn btn-primary" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Đang kiểm tra">Sử dụng mã giảm giá</button> </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <table class="table table1 table-bordered table-responsive">
            <tbody>
                <tr>
                    <th>Giảm giá</th>
                    <td id="valueVoucher">-0%</td>
                </tr>
                <tr>
                    <th>Vat</th>
                    <td id="vat">10%</td>
                </tr>
                <tr>
                    <th>Tổng cộng</th>
                    <td id="tongcong"><%=(cart.tinhtongtien() + (cart.tinhtongtien() * 10) / 100)%> VNĐ</td>
                </tr>
            </tbody>
        </table>
        <div class="clearfix"> </div>
        <button onclick="window.location = 'product_pages'" type="button" class="btn btn-info">Tiếp tục mua hàng</button>
        <button onclick="window.location = 'giohang?command=dathang'" type="button" class="btn btn-success btn1">Thanh toán</button>
    </div>
</div>
<script>
    $('.btn').on('click', function () {
        var $this = $(this);
        $this.button('loading');
        setTimeout(function () {
            $this.button('reset');
        }, 2000);
    });
    var tong =<%=cart.tinhtongtien()%>;
    function checkvoucher() {
        if (document.getElementById("voucherText").value == "")
            return;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("GET", "giamgia?id=" + document.getElementById("voucherText").value, false);
        xmlhttp.send();
        var giam = xmlhttp.responseText;
        document.getElementById("valueVoucher").innerHTML = "-" + giam + "%";
        document.getElementById("tongcong").innerHTML = Math.ceil((10 - parseInt(giam)) * parseInt(tong) / 100 + parseInt(tong)) + " VNĐ";
    }
    function tangsl(id) {
        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "giohang?command=themsl" + "&id=" + id, false);
        xhttp.send();
        tong = xhttp.responseText;
        var giam = $('#valueVoucher').text();
        document.getElementById("tongcong").innerHTML = (((10 + parseInt(giam)) * tong) / 100 + parseInt(tong)) + " VNĐ";
    }
    function giamsl(id) {
        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "giohang?command=botsl" + "&id=" + id, false);
        xhttp.send();
        tong = xhttp.responseText;
        var giam = $('#valueVoucher').text();
        document.getElementById("tongcong").innerHTML = (((10 + parseInt(giam)) * tong) / 100 + parseInt(tong)) + " VNĐ";
    }
</script>
<!--//giohang-->