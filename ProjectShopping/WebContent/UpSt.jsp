<%@page import="p1.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
String st=request.getParameter("status");
session=request.getSession();
int ordid=(Integer)session.getAttribute("ordid");
PreparedStatement pst=ConnectionProvider.getConnection().prepareStatement("update orders set ordstatus='"+st+"'where ordid='"+ordid+"'");
int i=pst.executeUpdate();
if(i>0)
{
	%>
	<h3>Status Updated Successfully</h3>
	<%
	RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
	rd.include(request,response);
}
%>
</body>
</html>