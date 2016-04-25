<%@page import="java.sql.PreparedStatement"%>
<%@page import="p1.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.border
{
	border: thin;
	border-bottom-color: aqua;
	position:absolute;
	right:270px;
	top:450px;
	font-family: sans-serif;
	color:yellow;
}
</style>
</head>
<body>
<%
String uname,pswd,cname;
uname=request.getParameter("uname");
pswd=request.getParameter("pswd");
cname=request.getParameter("cname");
PreparedStatement pst=ConnectionProvider.getConnection().prepareStatement("update company set uname='"+uname+"',pswd='"+pswd+"'where c_name='"+cname+"'");
int i=pst.executeUpdate();
if(i>0)
{
	%>
	<div class="border">
	<h2>Username or Password of Company set Successfully</h2>
	</div>
	<%
	RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
	rd.include(request,response);
}
else
{
	%>
	<div class="border">
	<h2>You Entered Wrong Company Name</h2>
	</div>
	<%
	RequestDispatcher rd=request.getRequestDispatcher("UPC.jsp");
	rd.include(request,response);
}
%>
</body>
</html>