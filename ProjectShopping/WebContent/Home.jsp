<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Main.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<style>
.bor
{
	border: thin;
	border-bottom-color: aqua;
	position:absolute;
	right:370px;
	top:450px;
	font-family: sans-serif;
	color:yellow;
}
div.img
{
  margin: 50px;
  border: 1px solid #0000ff;
  height: auto;
  width: auto;
  float: left;
  text-align: center;
  top:20px;
}	
div.img img
{
  display: inline;
  margin: 3px;
  border: 1px solid #ffffff;
}
div.img a:hover img {border: 1px solid #0000ff;}
div.desc
{
  text-align: center;
  font-weight: normal;
  width: 120px;
  margin: 2px;
}
</style>
</head>
<body>
<div class="bor">
<center><h2 style="color:black;font-style: italic;font-size: 25px;">Daily Offers</h2></center>
<%
try
{
		Statement st=ConnectionProvider.getConnection().createStatement();       
		ResultSet rslt=st.executeQuery("select * from  offers");
		String pn,pi=null;
		while(rslt.next())
		{
			pn=rslt.getString(4);
			pi=rslt.getString(1);
		%>
		<div class="img">
 		<a target="_blank" href="klematis_big.htm"></a>
 		<img src="Image.jsp?val=<%=pn%>" height="150" width="150"/>
 		<div class="desc"><a href="ShowProOff.jsp?val=<%=pi%>"><%=pn%></a></div>
 		<br/><div class="desc"><del><%=rslt.getString(7)%></del></div>
 		<br/><div class="desc"><%=rslt.getString(8)%></div>
		</div>
		</div>
		<%
		}
}
catch(Exception e)
{
	e.printStackTrace();
}
		%>	
</body>
</html>