<%@ page import="com.sun.crypto.provider.RSACipher" %>
<%@ page import = "javax.swing.JOptionPane" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="jquery.js"></script>
<script>
$(document).ready(function(){
	$("button").click(function(){
		$("h1").hide();
	});
});
</script>
</head>
<body>
<center>
<form action="FdAccount.jsp" method="get">
<h1>RD Account Entry Form </h1><br/>
<h3> Enter RD Account Number  </h3>
<input type="text" name="MemCode" >
<input type="submit" name="submit" value="Continue.....">
<h1>Hello world<h1>
<button>Click</button>

</form>
</center>
</body>
</html>