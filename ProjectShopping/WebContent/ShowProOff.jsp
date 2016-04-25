<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="p1.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="Main.jsp" %>
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
	position:absolute;
	right:200px;
	top:450px;
	font-family: sans-serif;
	color:yellow;
}
</style>
</head>
<body>
<div class="bord">
<%
 String pid =  request.getParameter("val");
 Connection conn = ConnectionProvider.getConnection();
 PreparedStatement prst = conn.prepareStatement("select * from offers where p_id = '"+pid+"'");
 ResultSet rslt = prst.executeQuery();
 if(rslt.next())
 {
%>
<h3> <%=rslt.getString(4)%></h3>
<table>
<tr>
<td>
<img src="Image.jsp?val=<%=rslt.getString(4)%>" height="300" width="300"/><br/><br/></td>
<td>
<h4> <a href="Buy.jsp?itemid=<%=rslt.getString(1)%>&itemname=<%=rslt.getString(4)%>">Order Now </a> </h4>
</td><td></td>
<td><h4> <a href="Cart.jsp?itemid=<%=rslt.getString(1)%>">Add to Cart</a> </h4></td>
</tr>
</table>
<table cellpadding="8" cellspacing="8" style="color:white;font-size:25px;">
<tr> 
<td>Old Price </td><td><del><%=rslt.getString(7)%></del></td>
</tr>
<tr> 
<td>New Price </td><td> <%=rslt.getString(8)%></td>
</tr>
<tr>
<td> Product Id </td><td><%=rslt.getString(1)%></td>
</tr>
<tr>
<td>Company Name </td><td><%=rslt.getString(3)%></td>
</tr>
<tr>
<td> Product Category </td><td><%=rslt.getString(6)%></td>
</tr>
<tr>
<td> Product Info</td><td><%=rslt.getString(2)%></td>
</tr>
</table>
<% 
 }
%>
<a href="javascript:history.back()"><input type="button" value="back"></a>
</div>
</body>
</html>