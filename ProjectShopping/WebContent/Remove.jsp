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
</head>
<body>
<%
String itemid=request.getParameter("itemid");
Connection con=ConnectionProvider.getConnection();
PreparedStatement ppset=con.prepareStatement("delete from cart where uname is NULL and itemid='"+itemid+"'");
ppset.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("ShowCart.jsp");
rd.forward(request,response);
%>
</body>
</html>
