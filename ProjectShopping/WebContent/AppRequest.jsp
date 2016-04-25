<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="LoginComp.jsp" %>
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
	left:290px;
	top:450px;
	font-family:Lucida Calligraphy;
	color:yellow;
	text-align: center;
}
</style>
</head>
<body>
<div class="bord">
<%
Connection conn=ConnectionProvider.getConnection();
PreparedStatement ppst=conn.prepareStatement("select *from approval");
ResultSet rrst=ppst.executeQuery();
int l=0;
while(rrst.next())
{
	l++;
}
	if(l==0)
{
	%>
	<h2>No Companies For Approval</h2>
	<% 
}
else
{
%>
<table cellpadding="2" cellspacing="2" >
<tr style="color: black;">
<td>Company Name</td>
<td>First Name</td>
<td>Last Name</td>
<td>Email</td>
<td>Secondary Email</td>
<td>Address</td>
<td>City</td>
<td>State</td>
<td>Country</td>
<td>Postal Code</td>
<td>Phone No.</td>
<td>Mob No.</td>
<td>Photo</td>
</tr>
<%
PreparedStatement ppstl=conn.prepareStatement("select * from approval");
ResultSet rstl=ppstl.executeQuery();
while(rstl.next())
{
	

%>

<tr>
<td><%=rstl.getString(1) %></td>
<td><%=rstl.getString(2) %></td>
<td><%=rstl.getString(3) %></td>
<td><%=rstl.getString(4) %></td>
<td><%=rstl.getString(5) %></td>
<td><%=rstl.getString(13) %></td>
<td><%=rstl.getString(6) %></td>
<td><%=rstl.getString(7) %></td>
<td><%=rstl.getString(8) %></td>
<td><%=rstl.getString(9) %></td>
<td><%=rstl.getString(10) %></td>
<td><%=rstl.getString(11) %></td>
<td>
<img src="Photo.jsp?val=<%=rstl.getString(1)%>" height="100" width="100"/>
</td>

<td><a href="AfterApprove.jsp"><input type="button" value="Approve"></a></td>
<td><a href="DisApp.jsp"><input type="button" value="Disapprove"></a></td>
</tr>
<%
String cname=rstl.getString(1);
session.setAttribute("cname",cname);
}
%>
</table>
<%} %>
</div>
</body>
</html>