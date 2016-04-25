<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="LoginComp.jsp" %>
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
	right:560px;
	top:420px;
	color:yellow;
	font-size: 20px;
}
</style>
</head>
<body>
<div class="bord">
<h2 style="font-size: 50px;font-family: cursive;">Welcome Admin</h2>
<table cellpadding="3" cellspacing="3" style="font-family: Comic Sans MS">
<tr>
<td><a href="AppRequest.jsp">Application Request</a></td>
</tr>
<tr>
<td><a href="CDel.jsp">Delete Account of a Company</a></td>
</tr>
<tr>
<td><a href="UpStatus.jsp">Update Status of Customer Record</a></td>
</tr>
<tr>
<td><a href="UPC.jsp">Change Username or Password of Company</a></td>
</tr>
</table>
</div>
</body>
</html>