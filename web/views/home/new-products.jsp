<%@page import="java.util.ArrayList"%>
<%@page import="model.groupproduct"%>
<%@page import="dbHelpers.products_query"%>
<%@page import="model.product"%>
<%
    products_query query = new products_query();
    ArrayList<product> pd;
%>
<!-- new-products -->
<div class="new-products">
    <div class="container">
        <h3>New Products</h3>
        <div class="agileinfo_new_products_grids">
            <%for (int i = 1; i < 5; i++) {%>
            <div class="col-md-3 agileinfo_new_products_grid">
                <div class="agile_ecommerce_tab_left agileinfo_new_products_grid1">
                    <div class="hs-wrapper hs-wrapper1 trans">
                        <%pd = query.doc_sp_nhomsp(i, 5);
                            for (int j = 0; j < 5; j++) {%>
                        <img src="public/images/<%=pd.get(j).getImages()%>" alt=" " class="img-responsive" />
                        <%}%>
                        <div class="w3_hs_bottom w3_hs_bottom_sub">
                            <ul>
                                <li>
                                    <a href="#" data-toggle="modal" data-target="#myModalNew<%=i%>"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <h5><a href="single?id=<%=pd.get(0).getId()%>"><%=pd.get(0).getName()%></a></h5>
                    <div class="simpleCart_shelfItem">
                        <%if (pd.get(0).getPriceNew() != 0) {%>
                        <p><span><%=pd.get(0).getPrice()%></span> <i class="item_price"><%=pd.get(0).getPriceNew()%></i></p>
                            <%} else {%>
                        <p><i class="item_price"><%=pd.get(0).getPrice()%></i></p>
                            <%}%>
                        <button onclick="themItem(<%=pd.get(0).getId()%>)" id="command" value="them" type="button" class="w3ls-cart">Add to cart</button>
                    </div>
                </div>
                <div class="modal video-modal fade" id="myModalNew<%=i%>" tabindex="-1" role="dialog" aria-labelledby="myModal<%=i%>">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                            </div>
                            <section>
                                <div class="modal-body">
                                    <div class="col-md-5 modal_body_left">
                                        <img src="public/images/<%=pd.get(0).getImages()%>" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="col-md-7 modal_body_right">
                                        <h4><%=pd.get(0).getName()%></h4>
                                        <p><%=pd.get(0).getDetail()%></p>
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
                                            <%if (pd.get(0).getPriceNew() != 0) {%>
                                            <p><span><%=pd.get(0).getPrice()%></span> <i class="item_price"><%=pd.get(0).getPriceNew()%></i></p><%} else {%>
                                            <p><i class="item_price"><%=pd.get(0).getPrice()%></i></p>
                                                <%}%>
                                            <button onclick="themItem(<%=pd.get(0).getId()%>)" id="command" value="them" type="button" class="w3ls-cart">Add to cart</button>
                                        </div>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>   
            </div>
            <%}%>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //new-products -->