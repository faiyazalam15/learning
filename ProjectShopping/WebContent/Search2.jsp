<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="LoginAfterUs.jsp" %>
    <%@page import="java.sql.*, p1.ConnectionProvider"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="Back.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<style type="text/css">
div.img
{
  margin-top: 80px;
  border: 1px solid #0000ff;
  height: auto;
  width: auto;
  float: left;
  text-align: center;
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
.fil
{
	border: thin;
	border-bottom-color: aqua;
	position:absolute;
	right:1070px;
	top:850px;
	font-family: sans-serif;
	color:yellow;
	font-size: 15px;
}
.im{
margin-left: 550px;
margin-top: 80px;
}
</style>
</head>
<body>
<%
String cat=request.getParameter("keyword");
try
{
		Statement st=ConnectionProvider.getConnection().createStatement();       
		ResultSet rsltl=st.executeQuery("select * from product where p_cat='"+cat+"'");
		String pn,pi=null;
		int i=0;
		if(rsltl.next())
		{
			i++;
		}
		if(i==0)
		{
				%>
				<div class="im">
				<h2>No Items in this Selected Category</h2>
				</div>
				<% 
		}
		else
		{
			ResultSet rslt=st.executeQuery("select * from product where p_cat='"+cat+"'");
		while(rslt.next())
		{
			pn=rslt.getString(4);
			pi=rslt.getString(1);
		%>
		<div class="img">
 		<a darget="_blank" href="klematis_big.htm"></a>
 		<img src="Search.jsp?val=<%=pn%>" height="150" width="150"/>
 		<div class="desc"><a href="ShowItem1.jsp?val=<%=pi%>"><%=pn%></a></div>
 		<div class="desc">Rs <%=rslt.getString(7) %></div>
		</div>
		
		
		<%
		}
		}
}
catch(Exception e)
{
	e.printStackTrace();
}
		%>	
<div class="fil">
<form action="Filter1.jsp?val=<%=cat %>" method="post">
<table>
<tr>
<td>Price Filter</td>
</tr>
<tr>
<td>Rs<input type="text" name="from" size="10px"></td>
<td>to</td>
<td>Rs<input type="text" name="to" size="10px"></td>
</tr>
<tr>
<td><input type="submit" value="Apply"></td>
</tr>
</table>
</form>
</div>
</body>
</html>