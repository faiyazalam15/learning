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
	right:300px;
	top:450px;
	font-family: sans-serif;
	color:yellow;
}
</style>
</head>
<body>
<%
session=request.getSession();
String cname=(String)session.getAttribute("cname");
%>
<div class="bord">
<form action="AfterDisApp.jsp" method="post">
<table cellpadding="5" cellspacing="5">
<tr><td><h2>
Are You sure you want to disapprove <%=cname %>
</h2></td>
<td><input type="radio" value="Yes" name="disa">Yes
<input type="radio" value="No" name="disa">No</td>
</tr>
<tr>
<td><input type="submit" value="Disapprove">
<input type="button" onclick="javascript:history.back()" value="Cancel"></td>
</tr>
</table>
</form>
</div>
</body>
</html>