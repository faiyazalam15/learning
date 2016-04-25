<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="p1.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="LoginAfterUs.jsp" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.bord
{
	border: thin;
	border-bottom-color: aqua;
	position: absolute;
	right:520px;
	top:450px;
	font-family: sans-serif;
	color:yellow
}
</style>
</head>
<body>
<div class="bord">
<%
 String pid =  request.getParameter("val");
 Connection conn = ConnectionProvider.getConnection();
 PreparedStatement pstl = conn.prepareStatement("select * from product where p_id = '"+pid+"'");
 ResultSet rstl = pstl.executeQuery();
 if(rstl.next())
 {
%>
<h3> <%=rstl.getString(4)%></h3>
<table>
<tr>
<td>
<img src="Search.jsp?val=<%=rstl.getString(4)%>" height="200" width="220"/><br/><br/>
<td>
<h4> <a href="Buy.jsp?itemid=<%=rstl.getString(1)%>&itemname=<%=rstl.getString(4)%>">Order Now </a> </h4>
</td><td></td>
<td><h4> <a href="Cart1.jsp?itemid=<%=rstl.getString(1)%>">Add to Cart</a> </h4></td>
</tr>
</table>
<table cellpadding="8" cellspacing="8" style="color:white;font-size:15px;">
<tr> 
<td>Price </td><td> <%=rstl.getString(7)%></td>
</tr>
<tr>
<td> Product Id </td><td><%=rstl.getString(1)%></td>
</tr>
<tr>
<td>Company Name </td><td><%=rstl.getString(3)%></td>
</tr>
<tr>
<td> Product Category </td><td><%=rstl.getString(6)%></td>
</tr>
<tr>
<td> Product Info</td><td><%=rstl.getString(2)%></td>
</tr>
</table>
<% 
 }
%>
</div>
</body>
</html>