<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file= "index.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="Mystyle.css" rel="Stylesheet" type="text/CSS">
</head>

<body >
<form action="Login" method="Post">
<center>
 <h1 id="fcolor"> Login Form </h1>
<table id="tabcolor" cellspacing="8" cellpadding="8">
<tr>
<td>User Id</td>
<td><input type="text" name="uname"></td>
</tr>
<tr>
<td> Enter Password</td>
<td> <input type="password" name="pwd"></td>
</tr> 
<tr>
	<td><input type="submit" value="submit"></td>
</tr>
 
</table>
</center>
</form>
</body>
</html>