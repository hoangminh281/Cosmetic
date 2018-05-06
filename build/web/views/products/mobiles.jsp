<%@page import="model.groupproduct"%>
<%@page import="model.product" %>
<%@page import="java.util.ArrayList" %>
<%
    ArrayList<product> arr = new ArrayList<product>();
    if (request.getAttribute("list") != null) {
        arr = (ArrayList) request.getAttribute("list");
    }
    int count = 0;
    if (request.getAttribute("count") != null) {
        count = (Integer) request.getAttribute("count");
    }
    ArrayList<groupproduct> nhomsp = new ArrayList<groupproduct>();
    if (request.getAttribute("nhomsp") != null) {
        nhomsp = (ArrayList<groupproduct>) request.getAttribute("nhomsp");
    }
    int dem = 0;
    int modal = 0;
    String st = "";
    if (request.getAttribute("group") != null) {
        st = "&group=" + request.getAttribute("group");
    }
    if (request.getAttribute("money") != null) {
        st = "&money=" + request.getAttribute("money");
    }
    if (request.getAttribute("Search") != null) {
        st = "&Search=" + request.getAttribute("Search");
    }

    int pages = 1;
    if (request.getAttribute("pages") != null) {
        pages = (Integer) request.getAttribute("pages");
    }
%>
<!-- mobiles -->
<div class="mobiles">
    <div class="container">
        <div class="w3ls_mobiles_grids">
            <div class="col-md-4 w3ls_mobiles_grid_left">
                <div class="w3ls_mobiles_grid_left_grid">
                    <h3>Categories</h3>
                    <div class="w3ls_mobiles_grid_left_grid_sub">
                        <ul class="panel_bottom">
                            <%for (groupproduct gp : nhomsp) {%>
                            <li><a href="product_pages?group=<%=gp.getId()%>"><%=gp.getName()%></a></li>
                                <%}%>
                        </ul>
                    </div>
                </div>
                <div class="w3ls_mobiles_grid_left_grid">
                    <h3>Price</h3>
                    <div class="w3ls_mobiles_grid_left_grid_sub">
                        <div class="ecommerce_color ecommerce_size">
                            <ul>
                                <li><a href="product_pages?money=0">Below 100.000 VND</a></li>
                                <li><a href="product_pages?money=100">100.000-200.000 VND</a></li>
                                <li><a href="product_pages?money=200">200.000-500.000 VND</a></li>
                                <li><a href="product_pages?money=500">500.000-1.000.000 VND</a></li>
                                <li><a href="product_pages?money=1000">Above 1.000.000 VND</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 w3ls_mobiles_grid_right">


                <div class="w3ls_mobiles_grid_right_grid2">
                    <div class="w3ls_mobiles_grid_right_grid2_left">
                        <h3>Showing Results: <%=((pages - 1) * 9 + 1)%>-<%=((pages - 1) * 9 + 1) + arr.size() - 1%></h3>
                    </div>
                    <div class="w3ls_mobiles_grid_right_grid2_right">
                        <select name="select_item" class="select_item">
                            <option selected="selected">Default sorting</option>
                            <option>Sort by popularity</option>
                            <option>Sort by average rating</option>
                            <option>Sort by newness</option>
                            <option>Sort by price: low to high</option>
                            <option>Sort by price: high to low</option>
                        </select>
                    </div>
                    <div class="clearfix"> </div>
                </div>

                <!-- chen san pham -->
                <%
                    for (product p : arr) {
                        if (dem == 0) {%>
                <div class="w3ls_mobiles_grid_right_grid3">
                    <%}%>
                    <div class="col-md-4 agileinfo_new_products_grid agileinfo_new_products_grid_mobiles">
                        <div class="agile_ecommerce_tab_left mobiles_grid">
                            <div class="hs-wrapper hs-wrapper2">
                                <img src="public/images/<%=p.getImages()%>" alt=" " class="img-responsive" /> 
                                <div class="w3_hs_bottom w3_hs_bottom_sub1">
                                    <ul>
                                        <li>
                                            <a href="#" data-toggle="modal" data-target="#myModal<%=modal%>"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <h5><a href="single?id=<%=p.getId()%>"><%=p.getName()%></a></h5> 
                            <div class="simpleCart_shelfItem">
                                <%if (p.getPriceNew() != 0) {%>
                                <p><span><%=p.getPrice()%></span> <i class="item_price"><%=p.getPriceNew()%></i></p><%} else {%>
                                <p><i class="item_price"><%=p.getPrice()%></i></p><%}%>
                                <button onclick="themItem(<%=p.getId()%>)" id="command" value="them" type="button" class="w3ls-cart">Add to cart</button>
                            </div> 
                            <%if (dem == 0) {%>
                            <div class="mobiles_grid_pos">
                                <h6>New</h6>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <%if (dem == 2) {%>
                    <div class="clearfix"> </div>
                </div>
                <% dem = 0;
                    } else
                        dem++;%>
                <!-- Chen modal san pham -->
                <div class="modal video-modal fade" id="myModal<%=modal%>" tabindex="-1" role="dialog" aria-labelledby="myModal<%=modal%>">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                            </div>
                            <section>
                                <div class="modal-body">
                                    <div class="col-md-5 modal_body_left">
                                        <img src="public/images/<%=p.getImages()%>" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="col-md-7 modal_body_right">
                                        <h4><%=p.getName()%></h4>
                                        <p><%=p.getDetail()%></p>
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
                                            <%if (p.getPriceNew() != 0) {%>
                                            <p><span><%=p.getPrice()%></span> <i class="item_price"><%=p.getPriceNew()%></i></p><%} else {%>
                                            <p><i class="item_price"><%=p.getPrice()%></i></p><%}%>
                                            <button onclick="themItem(<%=p.getId()%>)" id="command" value="them" type="button" class="w3ls-cart">Add to cart</button>
                                        </div> 	

                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
                <%modal++;
                    }%>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<div style="text-align: center">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li class="page-item" onclick="return <%=pages == 1 ? false : true%>">
                <a class="page-link" href="product_pages?pages=<%=(pages - 1)%><%=st%>" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>
            <% count /= 9;
                for (int i = 1; i <= count + 1; i++) {%>
            <li class="page-item <%if (i == pages) {%>active<%}%>"><a class="page-link" href="product_pages?pages=<%=i%><%=st%>"><%=i%></a></li>
                <%}%>
            <li class="page-item" onclick="return <%=pages == (count + 1) ? false : true%>">
                <a class="page-link" href="product_pages?pages=<%=(pages + 1)%><%=st%>" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>
        </ul>
    </nav>
</div>