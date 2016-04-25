<%@page import="p1.ConnectionProvider"%>
<%@page import="java.sql.*" %>
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
		String pswd=request.getParameter("pswd");
		String pswd1=request.getParameter("pswd1");
		Connection con=ConnectionProvider.getConnection();
		PreparedStatement pst=con.prepareStatement("select b_passwd from buyer where b_passwd='"+pswd+"'");
		int i=pst.executeUpdate();
		if(i>0)
		{
			PreparedStatement ps=con.prepareStatement("update buyer set b_passwd='"+pswd1+"'");
		int j=ps.executeUpdate();
		if(j>0)
		{
			%>
			<h2>Password Updated Successfully</h2>
			<%
			RequestDispatcher rd=request.getRequestDispatcher("LoginAfterUs.jsp");
			rd.include(request, response);
		}
		}
		else
		{
			%>
			<h2>You Entered Wrong Old Password</h2>
			<%
			RequestDispatcher rd=request.getRequestDispatcher("ChangePU.jsp");
			rd.include(request, response);
		}
			%>
</body>
</html>