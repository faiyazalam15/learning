<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="LoginComp.jsp" %>
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
	right:340px;
	top:550px;
	font-family: sans-serif;
	color:yellow;
}
</style>
</head>
<body>
<%
session=request.getSession();
int orderid=(Integer)session.getAttribute("ordid");
%>
<form action="UpSt.jsp">
<div class="bord">
<table>
<tr>
<td>Select status of Ordid <%=orderid%></td>
</tr>
<tr>
<td><input type="radio" name="status" value="Accepted">Accepted
<td><input type="radio" name="status" value="Dispatched">Dispatched
<td><input type="radio" name="status" value="Delivered">Delivered
</td>
</tr>
<tr>
<td><input type="submit" value="Update Status"></td>
</tr>
</table>
</div>
</form>
</body>
</html>