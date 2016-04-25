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
$("document").ready(function(){
	$("button").click(function(){
		
		var nm=$("#code").val();
		var agnm=$("#agcode").val();
	
		$("#name").val(nm);
		$("#agentname").val(agnm);
	});
});

</script>
</head>
<body>

<center>
<form action="RdAccount.jsp" method="get">
<h1>RD Account Entry Form </h1><br/>
<h3> Enter Member's Code No. </h3>
<input type="text" name="MemCode" id="code"><br/>
<input type="text" name="memname" id="name">
<h3>Enter Agency Code Number </h3>
<input type="text" name="AgentCode" id="agcode"><br/>
<input type="text" name="AgentName" id="agentname">
<button>Click for value transfer</button></br>

<input type="submit" name="submit" value="Continue.....">


</form>
</center>
</body>
</html>