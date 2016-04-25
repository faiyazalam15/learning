<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,p1.ConnectionProvider" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
.bord
{
	border: thin;
	border-bottom-color: aqua;
	position:absolute;
	right:280px;
	top:500px;
	font-family: sans-serif;
	color:yellow;
}
</style>
<title>Insert title here</title>
</head>
<body>
<% 
		String pid=request.getParameter("pid");
		Connection con=ConnectionProvider.getConnection();
		try
		{
			PreparedStatement pst=con.prepareStatement("delete from offers where p_id='"+pid+"'");
			int i=pst.executeUpdate();
			if(i>0)
			{
				%>
				<h3>Product Deleted Successfully</h3>
				<% 
				RequestDispatcher rd=request.getRequestDispatcher("LoginAfterC.jsp");
				rd.include(request,response);	
			}
			else
			{
				%>
				<h3>Product Not Deleted Successfully</h3>
				<% 
				RequestDispatcher rd=request.getRequestDispatcher("DelProOff.jsp");
				rd.include(request,response);
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	%>
</body>
</html>