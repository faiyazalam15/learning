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
	font-family: sans-serif;
	color:yellow;
}
</style>
</head>
<body>
<div class="bord">
<form action="DelAcAfter.jsp" method="post">
<h2>Delete Account of Company</h2>
<table>
<tr>
<td>Enter Company Name</td>
<td><input type="text" name="cname"></td>
</tr>
<tr>
<td><input type="submit" value="Delete"></td>
<td><a href="javascript:history.back()"><button>Cancel</button></a></td>
</tr>
</table>
</form>
</div>
</body>
</html>