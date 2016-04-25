<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="LoginComp.jsp" %>
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
        right:600px; 
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
            	<h1 style="color:lime;font-size:30px">Welcome <%=name %></h1>
                <div>
                    <form method="post" action="DelProdOff.jsp">
						<center><h2 style="border:5px solid gray;">Delete Product from Offers</h2> </center>                   
						<table cellpadding="5" cellspacing="5" bgcolor="lime"  style="color:blue;text-align:left;width:420px; ">
						<tr>
						<td>Product Id</td>
						<td><input type="text" name="pid"></td>
						</tr>
						<tr>
						<td><input type="submit" value="Delete"></td>
						<td><input type="button" value="Cancel" onclick="javascript:history.back()"></td>
						</tr>
						</table>
						
					</form>
				</div>
			</div>
		</body>
</html>