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
	session=request.getSession();
	String uname=(String)session.getAttribute("uname");
	String f_name=request.getParameter("f_name");
	String l_name=request.getParameter("l_name");
	String email=request.getParameter("email");
	String addrs=request.getParameter("addrs");
	String country=request.getParameter("country");
	String state=request.getParameter("state");
	String city=request.getParameter("city");
	String pcode=request.getParameter("pcode");
	String phone=request.getParameter("phone");
	String mob=request.getParameter("mob");
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pst=con.prepareStatement("update buyer set bf_name='"+f_name+"',bl_name='"+l_name+"',b_email='"+email+"',b_add='"+addrs+"',b_city='"+city+"',b_state='"+state+"',b_country='"+country+"',b_postcode='"+pcode+"',b_mob='"+mob+"',b_phone='"+phone+"'where uname='"+uname+"'");
	int i=pst.executeUpdate();
	if(i>0)
	{
		%>
		<h2>Your Data Updated Successfully</h2>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("LoginAfterUs.jsp");
		rd.include(request,response);
	}
%>
</body>
</html>