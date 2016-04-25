<%@page import="java.sql.PreparedStatement"%>
<%@page import="p1.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
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
	right:350px;
	top:450px;
	font-family: sans-serif;
	color:yellow;
}
</style>
</head>
<body>
<%
	String cname=request.getParameter("cname");
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pst=con.prepareStatement("delete from company where c_name='"+cname+"'");
	int i=pst.executeUpdate();
	if(i>0)
	{
		%>
		<div class="bord">
		<h2>Company Deleted Successfully</h2></div>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
		rd.include(request,response);
	}
	else
	{
%>
	<div class="bord">
		<h3>Company Not Deleted Successfully</h3></div>
		<%

		RequestDispatcher rd=request.getRequestDispatcher("CDel.jsp");
		rd.include(request,response);
	}
	%>
</body>
</html>