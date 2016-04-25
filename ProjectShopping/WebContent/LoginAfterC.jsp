<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="LoginComp.jsp" %>
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
        right:220px; 
        top:420px; 
       } 
</style>
</head>
<body>
        	<% 
            	session=request.getSession();
        		String name=(String)session.getAttribute("name");
            	%>
        	
            	<div class="mid">
            	<center><h1 style="color:lime;font-size:30px;text-align: center;">Welcome <%=name %></h1></center>
                <div >
                <table>
                <tr><td>
						<center><h2 style="border:5px solid gray;">My Accounts</h2> </center>                   
						<table cellpadding="5" cellspacing="30" bgcolor="purple"  style="color:purple;text-align:left;width:420px; ">
						<tr>
						<td><img src="images/Cyan.ico"></td>
						<td><a href="UpdateC.jsp">View or Change Account Information</a></td>
						</tr>
						<tr>
						<td><img src="images/Green.ico"></td>
						<td><a href="ChangePC.jsp">Change Account Password</a></td>
						</tr>
						</table>
						</td>
						<td>
						<center><h2 style="border:5px solid gray;">My Facilities</h2> </center>                   
						<table cellpadding="5" cellspacing="1" bgcolor="purple"  style="color:purple;text-align:left;width:420px; ">
						<tr>
						<td><img src="images/Blue.ico"></td>
						<td><a href="Addpro.jsp">Add Product</a></td>
						</tr>
						<tr>
						<td><img src="images/Orange.ico"></td>
						<td><a href="AddproOff.jsp">Add Product for Offers</a></td>
						</tr>
						<tr>
						<td><img src="images/Magenta.ico"></td>
						<td><a href="DelPro.jsp">Delete Product</a></td>
						</tr>
						<tr>
						<td><img src="images/Red.ico"></td>
						<td><a href="DelProOff.jsp">Delete Product from Offers</a></td>
						</tr>
						</table>
						</td>
						</tr>
						</table>
						</div>
				</div>
</body>
</html>