<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="LoginComp.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.bo
{
	border: thin;
	border-bottom-color: aqua;
	position:absolute;
	right:500px;
	top:420px;
	font-family: sans-serif;
	color:yellow;
}
</style>
</head>
<body>
<div class="bo">
<form action="ChangeUPCA.jsp">
<h2 style="font-family: inherit;color: lime;">Change Username or Password of Company</h2>
<table>
<tr>
<td>Company Name</td>
<td><input type="text" name="cname"></td>
</tr>
<tr>
<td>New Username</td>
<td><input type="text" name="uname"></td>
</tr>
<tr>
<td>New Password</td>
<td><input type="password" name="pswd"></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Send Mail">
<input type="button" value="Cancel" onclick="javascript:history.back()">
</td>
</tr>
</table>
</form>
</div>
</body>
</html>