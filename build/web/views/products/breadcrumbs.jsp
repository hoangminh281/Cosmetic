<%@page import="model.groupproduct"%>
<!-- breadcrumbs -->
<div class="breadcrumb_dress">
    <div class="container">
        <ul>
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
            <li>Products</li>
                <%
                    if (request.getAttribute("nhom")!=null) {%>
                        <li> <i>/</i> <%=((groupproduct) request.getAttribute("nhom")).getName()%></li>
                    <%}%>
        </ul>
    </div>
</div>
<!-- //breadcrumbs --> 