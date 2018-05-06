<%@page import="model.Cart"%>
<%@page import="model.customer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    HttpSession ss = request.getSession();
    customer ct = new customer();
    ct = (customer) ss.getAttribute("account");
    Cart cart = (Cart) ss.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        ss.setAttribute("cart", cart);
    }
    String note = String.valueOf(request.getAttribute("tb"));
%>
<body>
    <!-- for bootstrap working -->
    <script type="text/javascript" src="public/js/bootstrap-3.1.1.min.js"></script>
    <!-- //for bootstrap working -->
    <!-- header -->
    <div class="header" id="home1">
        <div class="container"> 
            <%if (ct != null) {%>
            <div>
                <a title="Đăng xuất" href="logout">Chào, <%=ct.getName()%></a>
            </div>           
            <%} else {%>
            <div class="w3l_login" style="color: #3c43a4">
                <a href="#" data-toggle="modal" data-target="#myModal88"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
            </div>
            <%}%>
            <div class="w3l_logo">
                <h1><a href="index.jsp">Susu's Cosmetis<span>Flawless skin is the secret weapon.</span></a></h1>
            </div>
            <div class="search">
                <input class="search_box" type="checkbox" id="search_box">
                <label class="icon-search" for="search_box"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></label>
                <div class="search_form">
                    <form action="product_pages" method="post">
                        <input type="text" id="text" name="Search" placeholder="Search...">
                        <input onclick="return isEmpty();" type="submit" value="Send">
                    </form>
                </div>
            </div>
            <div class="top_nav_right">
                <div class="box_1">
                    <a href="order" onclick="return check()">
                        <h3> <div>
                                <i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
                                <span></span> (<span id="soluonghang"><%=cart.demitem()%></span> items)</div>
                        </h3>
                    </a>
                    <p><a onclick="xoaCart()">Empty Cart</a></p>
                </div>	
            </div>
        </div>
    </div>
    <script>
        function check() {
        <%if (ct == null) {%>
            $('#myModal88').modal('show');
            return false;
        <%}%>
            if ($('#soluonghang').text() != "0")
                return true;
            return false;
        }
        function thongbao() {
            alert(<%=note%>);
        }
    </script>