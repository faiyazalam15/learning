<%@page import="p1.ConnectionProvider"%>
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
String mad,email,phon;
mad=request.getParameter("mad");
email=request.getParameter("email");
phon=request.getParameter("phon");
session=request.getSession();
int ordid=(Integer)session.getAttribute("ordid");
PreparedStatement ppst=ConnectionProvider.getConnection().prepareStatement("update orders set maddress='"+mad+"',email='"+email+"',phoneno='"+phon+"'where ordid='"+ordid+"'");
int i=ppst.executeUpdate();
if(i>0)
{
	%>
	<h3>Your Information Updated Successfully</h3>
	<% 
	RequestDispatcher rd=request.getRequestDispatcher("OrderDetails.jsp");
	rd.include(request,response);
}
else
{
%>
<h3>Some Internal Error Occured</h3>
<%
RequestDispatcher rd=request.getRequestDispatcher("OrdUD.jsp");
rd.include(request,response);
}
%>
</body>
</html>