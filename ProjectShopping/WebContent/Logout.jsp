<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="Main.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function preventBack()
{
	window.history.forward();
}
setTimeout("preventBack()", 0);
window.onunload=function(){null};
</script>
</head>
<body>
<% 
String name=(String)session.getAttribute("name");
if(name!=null)
		{
			session.invalidate();
			%>
			<h1 style="color:silver;font-family: cursive;font-size: 30px;margin-top: 30px;" >Successfully Logout<br/>
			Redirecting Page Please Wait...
			
			</h1>
			<script type="text/javascript">
			window.setTimeout('window.location="Login.jsp";',4000);
			</script>
			<%
			
		}
		%>	
</body>
</html>