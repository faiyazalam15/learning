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
	String cname=(String)session.getAttribute("cname");
	String f_name=request.getParameter("f_name");
	String l_name=request.getParameter("l_name");
	String email=request.getParameter("email");
	String s_email=request.getParameter("s_email");
	String addrs=request.getParameter("addrs");
	String country=request.getParameter("country");
	String state=request.getParameter("state");
	String city=request.getParameter("city");
	String pcode=request.getParameter("pcode");
	String phone=request.getParameter("phone");
	String mob=request.getParameter("mob");
	String uname=request.getParameter("uname");
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pst=con.prepareStatement("update company set c_email='"+email+"',cs_email='"+
	s_email+"',cs_add='"+addrs+"',c_city='"+city+"',c_state='"+state+"',c_country='"+country+"',c_postcode='"+pcode+"',c_mob='"+mob+"',c_phone='"+phone+"',uname='"+uname+"'where c_name='"+cname+"'");
	int i=pst.executeUpdate();
	if(i>0)
	{
		%>
		<script>alert("Your Data Updated Successfully");</script>
		<%
		RequestDispatcher rd=request.getRequestDispatcher("LoginAfterC.jsp");
		rd.include(request,response);
	}
%>
</body>
</html>