<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- footer -->
<div class="footer">
    <div class="container">
        <div class="w3_footer_grids">
            <div class="col-md-3 w3_footer_grid">
                <h3>Contact</h3>
                <p>Website được thiết kế bởi MT & PĐ.</p>
                <ul class="address">
                    <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>Học viện Công nghệ BCVT<span>Hồ Chí Minh City.</span></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:tranhoangminhptit@gmail.com">tranhoangminhptit@gmail.com</a></li>
                    <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+1234 567 890</li>
                </ul>
            </div>
            <div class="col-md-3 w3_footer_grid">
                <h3>Information</h3>
                <ul class="info"> 
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="product_pages">Product</a></li>
                    <li><a href="#">Cosmetic</a></li>
                    <li><a href="#">FAQ's</a></li>
                    <li><a href="#">Special Products</a></li>
                </ul>
            </div>
            <div class="col-md-3 w3_footer_grid">
                <h3>Category</h3>
                <ul class="info"> 
                    <li><a href="product_pages?group=1">Cleansers</a></li>
                    <li><a href="product_pages?group=2">Serum</a></li>
                    <li><a href="product_pages?group=3">Makeup</a></li>
                    <li><a href="product_pages?group=4">SunScreen</a></li>
                    <li><a href="product_pages?group=5">Exfoliators</a></li>
                </ul>
            </div>
            <div class="col-md-3 w3_footer_grid">
                <h3>Profile</h3>
                <ul class="info"> 
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="product_pages">Today's Deals</a></li>
                </ul>
                <h4>Follow Us</h4>
                <div class="agileits_social_button">
                    <ul>
                        <li><a href="https://www.facebook.com/tranhoangminh2812" class="facebook"> </a></li>
                        <li><a href="https://twitter.com/HoangMinh2812" class="twitter"> </a></li>
                        <li><a href="https://plus.google.com/113292570467402599163" class="google"> </a></li>
                        <li><a href="#" class="pinterest"> </a></li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="footer-copy">
        <div class="footer-copy1">
            <div class="footer-copy-pos">
                <a href="#home1" class="scroll"><img src="public/images/arrow.png" alt=" " class="img-responsive" /></a>
            </div>
        </div>
        <div class="container">
            <p>&copy; 2017 Cosmetic Store. All rights reserved | Design by Minh Trần</p>
        </div>
    </div>
</div>
<!-- //footer --> 
<script type="text/javascript">
    $(window).load(function () {
        $("#flexiselDemo2").flexisel({
            visibleItems: 4,
            animationSpeed: 1000,
            autoPlay: true,
            autoPlaySpeed: 3000,
            pauseOnHover: true,
            enableResponsiveBreakpoints: true,
            responsiveBreakpoints: {
                portrait: {
                    changePoint: 568,
                    visibleItems: 1
                },
                landscape: {
                    changePoint: 667,
                    visibleItems: 2
                },
                tablet: {
                    changePoint: 768,
                    visibleItems: 3
                }
            }
        });

    });
</script>
<script type="text/javascript" src="public/js/jquery.flexisel.js"></script>
<!-- cart-js -->
<script>
    function themItem(id) {
        var xhttp = new XMLHttpRequest();
        var quanlity = $('#quanlity').text();
        if (quanlity === "")
            quanlity = 1;
        var command = document.getElementById("command").value;
        xhttp.open("GET", "giohang?command=" + command + "&id=" + id + "&quanlity=" + quanlity, false);
        xhttp.send();
        document.getElementById("soluonghang").innerHTML = xhttp.responseText;
    }
    function xoaCart() {
        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "giohang?command=xoacart", false);
        xhttp.send();
        document.getElementById("soluonghang").innerHTML = xhttp.responseText;
    }
</script>
<!-- //cart-js -->   
</body>