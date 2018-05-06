<%@page import="model.customer"%>
<%@page import="model.review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.product"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    product p = (product) request.getAttribute("sanpham");
    int quality = 1;
    ArrayList<review> rearr = new ArrayList();
    if (request.getAttribute("reviews") != null) {
        rearr = (ArrayList<review>) request.getAttribute("reviews");
    }
    if (ss.getAttribute("account") != null) {
        ct = (customer) ss.getAttribute("account");
    }
%>
<!--present-single-->
<div class="single">
    <div class="container">
        <div class="col-md-4 single-left">
            <div class="flexslider">
                <ul class="slides">
                    <li data-thumb="public/images/<%=p.getImages()%>">
                        <div class="thumb-image"> <img src="public/images/<%=p.getImages()%>" data-imagezoom="true" class="img-responsive" alt=""> </div>
                    </li>
                </ul>
            </div>
            <!-- flexslider -->
            <script defer src="public/js/jquery.flexslider.js"></script>
            <link rel="stylesheet" href="public/css/flexslider.css" type="text/css" media="screen" />
            <script>
                // Can also be used with $(document).ready()
                $(window).load(function () {
                    $('.flexslider').flexslider({
                        animation: "slide",
                        controlNav: "thumbnails"
                    });
                });
            </script>
            <!-- flexslider -->
            <!-- zooming-effect -->
            <script src="public/js/imagezoom.js"></script>
            <!-- //zooming-effect -->
        </div>
        <div class="col-md-8 single-right">
            <h3><%=p.getName()%></h3>
            <div class="rating1">
                <span class="starRating">
                    <input id="rating5" type="radio" name="rating" value="5">
                    <label for="rating5">5</label>
                    <input id="rating4" type="radio" name="rating" value="4">
                    <label for="rating4">4</label>
                    <input id="rating3" type="radio" name="rating" value="3" checked>
                    <label for="rating3">3</label>
                    <input id="rating2" type="radio" name="rating" value="2">
                    <label for="rating2">2</label>
                    <input id="rating1" type="radio" name="rating" value="1">
                    <label for="rating1">1</label>
                </span>
            </div>
            <div class="description">
                <h5><i>Description</i></h5>
                <p><%=p.getDetail()%></p>
            </div>
            <div class="color-quality">
                <h5>Quality :</h5>
                <div class="quantity"> 
                    <div class="quantity-select">                           
                        <div class="entry value-minus1">&nbsp;</div>
                        <div class="entry value1" id="quanlity"><span>1</span></div>
                        <div class="entry value-plus1 active">&nbsp;</div>
                    </div>
                </div>
                <!--quantity-->
                <script>
                $('.value-plus1').on('click', function () {
                    var divUpd = $(this).parent().find('.value1'), newVal = parseInt(divUpd.text(), 10) + 1;
                    divUpd.text(newVal);
                    quality++;
                });

                $('.value-minus1').on('click', function () {
                    var divUpd = $(this).parent().find('.value1'), newVal = parseInt(divUpd.text(), 10) - 1;
                    if (newVal >= 1)
                        divUpd.text(newVal);
                    quality--;
                });
                </script>
                <!--quantity-->
                <div class="clearfix"> </div>
            </div>
            <div class="simpleCart_shelfItem">
                <%if (p.getPriceNew() != 0 && p.getPriceNew() != p.getPrice()) {%>
                <p><span><%=p.getPrice()%></span> <i class="item_price"><%=p.getPriceNew()%></i></p><%} else {%>
                <p><i class="item_price"><%=p.getPrice()%></i></p><%}%>
                <button onclick="themItem(<%=p.getId()%>)" id="command" value="them" type="button" class="w3ls-cart">Add to cart</button>
            </div> 
        </div>
        <div class="clearfix"> </div>
    </div>
</div> 
<!--info-single-->
<div class="additional_info">
    <div class="container">
        <div class="sap_tabs">	
            <div id="horizontalTab1" style="display: block; width: 100%; margin: 0px;">
                <ul>
                    <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Product Information</span></li>
                    <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Reviews</span></li>
                </ul>		
                <div class="tab-1 resp-tab-content additional_info_grid" aria-labelledby="tab_item-0">
                    <h3><%=p.getName()%></h3>
                    <p><%=p.getDetail()%></p>
                </div>	

                <div class="tab-2 resp-tab-content additional_info_grid" aria-labelledby="tab_item-1">
                    <h4><span class="badge">(<%=rearr.size()%>)</span> Reviews</h4>
                    <%for (review rv : rearr) {%>
                    <div class="additional_info_sub_grids">
                        <div class="col-xs-2 additional_info_sub_grid_left">
                            <img src="public/images/people.png" alt=" " class="img-responsive" />
                        </div>
                        <div class="col-xs-10 additional_info_sub_grid_right">
                            <div class="additional_info_sub_grid_rightl">
                                <a href="#"><%=rv.getName()%></a>
                                <h5><%=rv.getDate()%></h5>
                                <p><%=rv.getComment()%></p>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <%}%>
                    <div class="review_grids">
                        <h5>Add A Review</h5>
                        <form action="reviews" method="post">
                            <%if (ct == null) {%>
                            <input type="text" name="Name" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Name';
                                    }" required="">
                            <input type="email" name="Email" placeholder="Email" required="">
                            <input type="text" name="Telephone" value="Telephone" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Telephone';
                                    }" required="">
                            <%}%>
                            <input type="hidden" name="Productid" value="<%=p.getId()%>" placeholder="Productid" required="">
                            <textarea name="Review" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Add Your Review';
                                    }" required="">Add Your Review</textarea>
                            <input type="submit" value="Submit" >
                        </form>
                    </div>
                </div> 			        					            	      
            </div>	
        </div>
        <script src="public/js/easyResponsiveTabs.js" type="text/javascript"></script>
        <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#horizontalTab1').easyResponsiveTabs({
                                        type: 'default', //Types: default, vertical, accordion           
                                        width: 'auto', //auto or any width like 600px
                                        fit: true   // 100% fit in a container
                                    });
                                });
        </script>
    </div>
</div>