<%@page import="java.util.ArrayList"%>
<%@page import="model.groupproduct"%>
<%@page import="dbHelpers.products_query"%>
<%@page import="model.product"%>
<%
    products_query pq = new products_query();
    ArrayList<groupproduct> g = pq.doc_nhomsp();
    ArrayList<product> p;
%>
<!-- banner-bottom -->
<div class="banner-bottom">
    <div class="container">
        <div class="col-md-5 wthree_banner_bottom_left">
            <div class="video-img">
                <a class="play-icon popup-with-zoom-anim" href="#small-dialog">
                    <span class="glyphicon glyphicon-expand" aria-hidden="true"></span>
                </a>
            </div> 
            <!-- pop-up-box -->     
            <script src="public/js/jquery.magnific-popup.js" type="text/javascript"></script>
            <!--//pop-up-box -->
            <div id="small-dialog" class="mfp-hide">
                <iframe src="https://www.youtube.com/embed/JuZjJ0Wnizc"></iframe>
            </div>
            <script>
                $(document).ready(function () {
                    $('.popup-with-zoom-anim').magnificPopup({
                        type: 'inline',
                        fixedContentPos: false,
                        fixedBgPos: true,
                        overflowY: 'auto',
                        closeBtnInside: true,
                        preloader: false,
                        midClick: true,
                        removalDelay: 300,
                        mainClass: 'my-mfp-zoom-in'
                    });

                });
            </script>
        </div>
        <div class="col-md-7 wthree_banner_bottom_right">
            <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                <ul id="myTab" class="nav nav-tabs" role="tablist">
                    <%for (int i = 1; i < 6; i++) {%>
                    <li role="presentation" <%if (i == 1) {%>class="active"<%}%> ><a href="#group<%=i%>" role="tab" id="group<%=i%>-tab" data-toggle="tab" aria-controls="group<%=i%>"><%=g.get(i).getName()%></a></li>
                        <%}%>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <%for (int i = 1; i < 6; i++) {
                            p = pq.doc_sp_nhomsp(i, 3);
                            if (p.size() == 0) {
                                continue;
                            } %>
                    <div role="tabpanel" class="tab-pane fade <%if (i == 1) {%> active in <%}%>" id="group<%=i%>" aria-labelledby="group<%=i%>-tab">
                        <div class="agile_ecommerce_tabs">
                            <%for (int j = 0; j < 3; j++) {%>
                            <div class="col-md-4 agile_ecommerce_tab_left">
                                <div class="hs-wrapper">
                                    <img src="public/images/<%=p.get(j).getImages()%>" alt=" " class="img-responsive" />
                                    <div class="w3_hs_bottom">
                                        <ul>
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#myModal<%=(i * 3 + j)%>"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div> 
                                <h5><a href="single?id=<%=p.get(j).getId()%>"><%=p.get(j).getName()%></a></h5>
                                <div class="simpleCart_shelfItem">
                                    <%if (p.get(j).getPriceNew() != 0) {%>
                                    <p><span><%=p.get(j).getPrice()%></span> <i class="item_price"><%=p.get(j).getPriceNew()%></i></p><%} else {%>
                                    <p><i class="item_price"><%=p.get(j).getPrice()%></i></p>
                                        <%}%>
                                    <button onclick="themItem(<%=p.get(j).getId()%>)" id="command" value="them" type="button" class="w3ls-cart">Add to cart</button>
                                </div>
                            </div>
                            <!--modal-video-->
                            <div class="modal video-modal fade" id="myModal<%=(i * 3 + j)%>" tabindex="-1" role="dialog" aria-labelledby="myModal<%=(i * 3 + j)%>">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                                        </div>
                                        <section>
                                            <div class="modal-body">
                                                <div class="col-md-5 modal_body_left">
                                                    <img src="public/images/<%=p.get(j).getImages()%>" alt=" " class="img-responsive" />
                                                </div>
                                                <div class="col-md-7 modal_body_right">
                                                    <h4><%=p.get(j).getName()%></h4>
                                                    <p><%=p.get(j).getDetail()%></p>
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
                                                        <%if (p.get(j).getPriceNew() != 0) {%>
                                                        <p><span><%=p.get(j).getPrice()%></span> <i class="item_price"><%=p.get(j).getPriceNew()%></i></p><%} else {%>
                                                        <p><i class="item_price"><%=p.get(j).getPrice()%></i></p>
                                                            <%}%>
                                                        <button onclick="themItem(<%=p.get(j).getId()%>)" id="command" value="them" type="button" class="w3ls-cart">Add to cart</button>
                                                    </div>
                                                </div>
                                                <div class="clearfix"> </div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <%}%>        
                </div>
            </div> 
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!-- //banner-bottom --> 
