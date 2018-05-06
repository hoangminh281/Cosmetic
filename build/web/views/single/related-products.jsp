<%@page import="model.product"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<product> relateArr = new ArrayList<product>();
    if (request.getAttribute("related") != null) {
        relateArr = (ArrayList<product>) request.getAttribute("related");
    }
%>
<!-- Related Products -->
<div class="w3l_related_products">
    <div class="container">
        <h3>Related Products</h3>
        <ul id="flexiselDemo2">	
            <%for (product pd : relateArr) {%>
            <li>
                <div class="w3l_related_products_grid">
                    <div class="agile_ecommerce_tab_left mobiles_grid">
                        <div class="hs-wrapper hs-wrapper3">
                            <img src="public/images/<%=pd.getImages()%>" alt=" " class="img-responsive" />
                            <div class="w3_hs_bottom">
                                <div class="flex_ecommerce">
                                    <a href="#" data-toggle="modal" data-target="#reModal<%=pd.getId()%>"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                </div>
                            </div>
                        </div>
                        <h5><a href="single?id=<%=pd.getId()%>"><%=pd.getName()%></a></h5>
                        <div class="simpleCart_shelfItem"> 
                            <%if (pd.getPriceNew() != 0) {%>
                            <p><span><%=pd.getPrice()%></span> <i class="item_price"><%=pd.getPriceNew()%></i></p><%} else {%>
                            <p><i class="item_price"><%=pd.getPrice()%></i></p><%}%>
                            <button onclick="themItem(<%=pd.getId()%>)" id="command" value="them" type="button" class="w3ls-cart">Add to cart</button>
                        </div>
                    </div>
                </div>
            </li>
            <%}%>
        </ul>
        <!--<script type="text/javascript">
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
                            changePoint: 480,
                            visibleItems: 1
                        },
                        landscape: {
                            changePoint: 640,
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
        <script type="text/javascript" src="public/js/jquery.flexisel.js"></script>-->
    </div>
</div>
<!-- //Related Products -->
<%for (product pd : relateArr) {%>
<div class="modal video-modal fade" id="reModal<%=pd.getId()%>" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
            </div>
            <section>
                <div class="modal-body">
                    <div class="col-md-5 modal_body_left">
                        <img src="public/images/<%=pd.getImages()%>" alt=" " class="img-responsive" />
                    </div>
                    <div class="col-md-7 modal_body_right">
                        <h4><%=pd.getName()%></h4>
                        <p><%=pd.getDetail()%></p>
                        <div class="rating">
                            <div class="rating-left">
                                <img src="public/images/star-.png" alt=" " class="img-responsive" />
                            </div>
                            <div class="rating-left">
                                <img src="public/images/star-.png" alt=" " class="img-responsive" />
                            </div>
                            <div class="rating-left">
                                <img src="public/images/star-.png" alt=" " class="img-responsive" />
                            </div>
                            <div class="rating-left">
                                <img src="public/images/star.png" alt=" " class="img-responsive" />
                            </div>
                            <div class="rating-left">
                                <img src="public/images/star.png" alt=" " class="img-responsive" />
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="modal_body_right_cart simpleCart_shelfItem">
                            <%if (pd.getPriceNew() != 0) {%>
                            <p><span><%=pd.getPrice()%></span> <i class="item_price"><%=pd.getPriceNew()%></i></p><%} else {%>
                            <p><i class="item_price"><%=pd.getPrice()%></i></p><%}%>
                            <button onclick="themItem(<%=pd.getId()%>)" id="command" value="them" type="button" class="w3ls-cart">Add to cart</button>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </section>
        </div>
    </div>
</div>
<%}%>
<!-- //single -->