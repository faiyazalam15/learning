<%@page import="java.sql.*"%>
<%@page import="p1.ConnectionProvider"%>
<%@page import="java.io.*"%>
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
	String pname=request.getParameter("val");
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pst=con.prepareStatement("select p_img from offers where p_name='"+pname+"'");
	ResultSet rs=pst.executeQuery();
	while(rs.next())
	{
		Blob image = rs.getBlob(1);
		byte[ ] imgData = image.getBytes(1,(int)image.length());
		response.setContentType("image/gif");
		
		
		OutputStream o = response.getOutputStream();
		o.write(imgData);
	}
%>
</body>
</html>