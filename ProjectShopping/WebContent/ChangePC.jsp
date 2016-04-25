<%@page import="p1.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="LoginComp.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="Back.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<style type= "text/css"> 
       .mid 
       { 
       border: thin; 
        border-bottom-color: aqua; 
        position:absolute; 
        right:500px; 
        top:405px; 

       } 
</style>
</head>
<body>
        	<% 
            	session=request.getSession();
        		String name=(String)session.getAttribute("name");
            	%>
            	<div class="mid">
            	<h1 style="color:lime;font-size:30px">Welcome <%=name %></h1>
                <div >
                    <form method="post" action="ChangePasC.jsp">
						<center><h2 style="border:5px solid gray;">Change Password</h2> </center>                   
						<table cellpadding="3" cellspacing="3" bgcolor="purple"  style="color:yellow;text-align:left;">
						<tr>
						<td>Old Password</td>
						<td><input type="password" name="pswd"></td>
						</tr>
						<tr>
						<td>New Password</td>
						<td><input type="password" name="pswd1"></td>
						</tr>
						<tr>
						<td><input type="submit" value="Change Password"></td>
						<td>
						<a href="javascript:history.back()" ><input type="button" value="Cancel"></a>
						</td>
						</tr>
						</table>
						<br/><br/>
						</form>
				</div>
			</div>
</body>
</html>       		