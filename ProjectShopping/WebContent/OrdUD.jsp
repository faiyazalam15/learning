<%@page import="java.sql.ResultSet"%>
<%@page import="p1.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
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
	right:330px;
	top:500px;
	font-family: sans-serif;
	color:white;
	font-size: 20px;
}
</style>
</head>
<body>
<div class="bord">
<%
session=request.getSession();
int ordid=(Integer)session.getAttribute("ordid");
String str=request.getParameter("val");
if(str.equals("update"))
{
	PreparedStatement ppst=ConnectionProvider.getConnection().prepareStatement("select maddress,email,phoneno from orders where ordid='"+ordid+"'");
	ResultSet rslt=ppst.executeQuery();
	if(rslt.next())
	{
		%><jsp:include page="LoginAfterUs.jsp"></jsp:include>
		<form action="OrdUp.jsp" method="post">
		<table cellpadding="5" cellspacing="5">
		<tr>
		<td>Mailing Address</td>
		<td><input type="text" name="mad" value="<%out.print(rslt.getString(1));%>"></td>
		</tr>
		<tr>
		<td>Email</td>
		<td><input type="text" name="email" value="<%out.print(rslt.getString(2));%>"></td>
		</tr>
		<tr>
		<td>Mobile No.</td>
		<td><input type="text" name="phon" value="<%out.print(rslt.getString(3));%>"></td>
		</tr>
		<tr>
		<td><input type="submit" value="Update"></td>
		<td><input type="button" value="Cancel" onclick="javascript:history.back()"></td>
		</tr>
		</table>
		</form>
		<%
	}
}
else if(str.equals("delete"))
{
	PreparedStatement ppst=ConnectionProvider.getConnection().prepareStatement("delete from orders where ordid='"+ordid+"'");
	int i=ppst.executeUpdate();
	if(i>0)
	{
		%>
		<h3>Your Order Cancelled Successfully</h3>
		<% 
		RequestDispatcher rd=request.getRequestDispatcher("OrderDetails.jsp");
		rd.include(request,response);
	}
}
%>
</div>
</body>
</html>