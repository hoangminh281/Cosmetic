<%String view = (String) request.getAttribute("view");
    if (view == "views/products/v_products.jsp") {
%>
<%@include file="../views/products/v_products.jsp"%>
<%
}
else if (view == "views/single/v_single.jsp") {%>
<%@include file="../views/single/v_single.jsp" %>
<%
} 
else if (view == "views/giohang/v_giohang.jsp") {%>
<%@include file="../views/giohang/v_giohang.jsp" %>
<%
} 
else {
%>
<%@include file="../views/home/v_home.jsp" %>
<% }
%>