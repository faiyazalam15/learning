<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
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
String cname=request.getParameter("val");
PreparedStatement pst=ConnectionProvider.getConnection().prepareStatement("select photo from approval where c_name='"+cname+"'");
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