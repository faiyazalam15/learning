<%@page import="java.sql.ResultSet"%>
<%@page import="p1.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="LoginComp.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.bord
{
	border: thin;
	border-bottom-color: aqua;
	position:absolute;
	right:130px;
	top:460px;
	font-family: sans-serif;
	color:aqua;
	text-align: center;
	font-size: 15px;
}
</style>
</head>
<body>
<%
int cou=0;
Connection conn=ConnectionProvider.getConnection();
PreparedStatement ppst=conn.prepareStatement("select count(ordid) from orders");
ResultSet rslt=ppst.executeQuery();
while(rslt.next())
{
	cou=rslt.getInt(1);
}
if(cou==0)
{
	%>
	<h3 style="padding-top:40px;font-family:Harrington;font-size: 30px;">There is no orders from Customers</h3>
	<% 
}
else
{
%>
<div class="bord">
<table cellpadding="2" cellspacing="2">
<tr style="color: purple;">
<td>Order Id</td>
<td>Customer Name</td>
<td>Item Id</td>
<td>Order Date</td>
<td>Order Status</td>
<td>Email Address</td>
<td>Address</td>
<td>Mob No</td>
<td>Item Name</td>
</tr>
<%
PreparedStatement ppstm=conn.prepareStatement("select * from orders");
ResultSet rstl=ppstm.executeQuery();
while(rstl.next())
{
%>
<tr>
<td><%=rstl.getInt(1) %></td>
<td><%=rstl.getString(2) %></td>
<td><%=rstl.getString(3) %></td>
<td><%=rstl.getString(4) %></td>
<td><%=rstl.getString(5) %></td>
<td><%=rstl.getString(6) %></td>
<td><%=rstl.getString(7) %></td>
<td><%=rstl.getString(8) %></td>
<td><%=rstl.getString(9) %></td>
<td><a href="UpdateSt.jsp"><input type="button" value="Update"></a></td>
<%
int ordid=rstl.getInt(1);
session.setAttribute("ordid",ordid);
}
%>
</table>
</div>
<%
}
%>
</body>
</html>