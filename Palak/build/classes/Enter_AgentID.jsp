<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="Mystyle.css">
<title>Insert title here</title>
</head>
<body id="body3">
<center>
<form action="NewAgentEntryjsp.jsp" method="get" id="body1">
<h1>Enter The Enter The Member ID For Agent<BR>
<input type="text" name="agId">
</h1>
<br>
<input type="submit" value="Register Agent">
</form>
</center>
<h1 style="color:red;">
<%
String n=null;
ServletContext context=getServletContext();
n=(String)context.getAttribute("info");
if(n!=null)
out.print(n);
%>
</h1>

</body>
</html>