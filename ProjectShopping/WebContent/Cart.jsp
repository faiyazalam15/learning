<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="p1.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.bor
{
	border: thin;
	border-bottom-color: aqua;
	position:absolute;
	right:380px;
	top:460px;
	font-family: sans-serif;
	color:yellow;
}
</style>
</head>
<body>
<%
String itemid=request.getParameter("itemid");
session=request.getSession();
String uname=(String)session.getAttribute("uname");
PreparedStatement ppstm=ConnectionProvider.getConnection().prepareStatement("insert into cart values(?,?)");
ppstm.setString(1,itemid);
ppstm.setString(2,uname);
ppstm.executeUpdate();
		%>
		<div class="bor">
<h3>Product Added to Cart Successfully</h3>
</div>
<%
PreparedStatement ppst=ConnectionProvider.getConnection().prepareStatement("select * from product where p_id='"+itemid+"'");
int i=ppst.executeUpdate();
if(i>0)
{
	%>
<jsp:include page="ShowItem.jsp">
<jsp:param name="val" value="<%=itemid %>"/>
</jsp:include>
<%
}
PreparedStatement ppstl=ConnectionProvider.getConnection().prepareStatement("select * from offers where p_id='"+itemid+"'");
int k=ppstl.executeUpdate();
if(k>0)
{
	%>
	<jsp:include page="ShowProOff.jsp">
	<jsp:param name="val" value="<%=itemid %>"/>
	</jsp:include>
	<% 
	}%>
</body>
</html>