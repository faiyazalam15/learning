<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="p1.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Main.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.borde
{
	border: thin;
	border-bottom-color: aqua;
	position:absolute;
	right:300px;
	top:420px;
	font-family: sans-serif;
	color:yellow;
}
</style>
</head>
<body>
<div class="borde">
<%
Connection conn=ConnectionProvider.getConnection();
session=request.getSession();
String unam=(String)session.getAttribute("uname");
int cou=0;
PreparedStatement ppsm=conn.prepareStatement("select count(itemid) from cart where uname is NULL");
ResultSet rrst=ppsm.executeQuery();
while(rrst.next())
{
	cou=rrst.getInt(1);
}
if(cou==0)
{
	%>
	<h2>No Item In Cart</h2>
	
	<% 
}
else
{
	%>
	
	<h2>Items in Your Cart</h2>
	<% 
				PreparedStatement prst = conn.prepareStatement("select p_id,p_info,c_name,p_name,p_img,p_cat,p_cost from product,cart where p_id = itemid and uname is NULL");
				 ResultSet rslt = prst.executeQuery();
				 while(rslt.next())
				 {
				%>
				<table cellpadding="5" cellspacing="5" style="color:white;font-size:25px;">
				<tr><td><h3> <%=rslt.getString(4)%></h3></td></tr>
				<tr>
				<td>
				<img src="Search.jsp?val=<%=rslt.getString(4)%>" height="150" width="150"/></td> 
				<td>
				<h4> <a href="Buy.jsp?itemid=<%=rslt.getString(1)%>&itemname=<%=rslt.getString(4)%>">Order Now </a> </h4>
				<h4> <a href="Remove.jsp?itemid=<%=rslt.getString(1)%>"> Remove From Cart</a> </h4>
				</td>
				</tr>
				<tr>
				<td>Price </td><td> <%=rslt.getString(7)%><br/></td>
				</tr><tr>
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
			PreparedStatement prstt = conn.prepareStatement("select p_id,p_info,c_name,p_name,p_img,p_cat,p_cost,p_ncost from offers,cart where p_id = itemid and uname is NULL");
				 ResultSet resl = prstt.executeQuery();
				 while(resl.next())
				 {
				%>
				<table cellpadding="5" cellspacing="5" style="color:white;font-size:25px;">
				<tr><td><h3> <%=resl.getString(4)%></h3></td></tr>
				<tr>
				<td>
				<img src="Image.jsp?val=<%=resl.getString(4)%>" height="150" width="150"/></td> 
				<td>
				<h4> <a href="Buy.jsp?itemid=<%=resl.getString(1)%>&itemname=<%=resl.getString(4)%>">Order Now </a> </h4>
				<h4> <a href="Remove.jsp?itemid=<%=resl.getString(1)%>"> Remove From Cart</a> </h4>
				</td>
				</tr>
				<tr>
				<td>Old Price </td><td> <del><%=resl.getString(7)%></del><br/></td>
				</tr>
				<tr> 
				<td>New Price </td><td> <%=resl.getString(8)%></td>
				</tr>
				<tr>
				<td> Product Id </td><td><%=resl.getString(1)%></td>
				</tr>
				<tr>
				<td>Company Name </td><td><%=resl.getString(3)%></td>
				</tr>
				<tr>
				<td> Product Category </td><td><%=resl.getString(6)%></td>
				</tr>
				<tr>
				<td> Product Info</td><td><%=resl.getString(2)%></td>
				</tr>
				</table>
				<%}
				 }%>
				 </div>
</body>
</html>