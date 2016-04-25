<%@page import="java.sql.SQLException"%>
<%@page import="p1.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	right:360px;
	top:410px;
	font-family: sans-serif;
	color:yellow;
	font-size: 20px;
}
</style>
</head>
<body>
<%
String utype=request.getParameter("utype");
	String uname=request.getParameter("uname");
	String pswd=request.getParameter("password");
	String name,cname;
	session=request.getSession();
	try
	{
	Connection con=ConnectionProvider.getConnection();
	
	if(utype.equalsIgnoreCase("Company"))
	{
		PreparedStatement pst=con.prepareStatement("select * from company where uname='"+uname+"'and pswd='"+pswd+"'");
	int i=pst.executeUpdate();
	
	if(i>0)
	{
		
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			name=rs.getString(2);
			cname=rs.getString(1);
			session.setAttribute("cname",cname);
			session.setAttribute("name",name);
			
		}
		RequestDispatcher rd=request.getRequestDispatcher("LoginAfterC.jsp");
		rd.include(request,response);
	}
	else
	{
		%>
		<div class="bord"><h2>You Entered Wrong Username/Password</h2></div>
		<%	
		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
		rd.include(request, response);
	}
} 
	else if(utype.equalsIgnoreCase("User"))
	{
		PreparedStatement pst=con.prepareStatement("select * from buyer where uname='"+uname+"'and b_passwd='"+pswd+"'");
	int i=pst.executeUpdate();
	if(i>0)
	{
		
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			name=rs.getString(1);
			session.setAttribute("name",name);
			session.setAttribute("uname",uname);
		}
		RequestDispatcher rd=request.getRequestDispatcher("LoginAfterUs.jsp");
		rd.include(request,response);
	}
	else
	{
		%>
		<div class="bord"><h2>You Entered Wrong Username/Password</h2>
		<%			
		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
		rd.include(request, response);
	}
	}
else if(utype.equalsIgnoreCase("Employee"))
	{
		PreparedStatement pst=con.prepareStatement("select * from empl where emp_no='"+uname+"'and pswd='"+pswd+"'");
	int i=pst.executeUpdate();
	if(i>0)
	{
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			name=rs.getString(2);
			session.setAttribute("name",name);
		}
	}
	else
	{
	%>
		<div class="bord"><h2>You Entered Wrong Username/Password</h2></div>
		<%			
		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
		rd.include(request, response);
	}
	
}
else if(utype.equalsIgnoreCase("admin"))
{
	
if(uname.equalsIgnoreCase("admin") && pswd.equalsIgnoreCase("admin"))
{
	name="admin";
	session.setAttribute("name",name);
	RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
	rd.include(request,response);
}
else
	
{
%>
	<div class="bord"><h2>You Entered Wrong Username/Password</h2></div>
	<%			
	RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
	rd.include(request, response);
}

}
}
catch(SQLException e)
{
	out.print(e);
}

%>
</body>
</html>