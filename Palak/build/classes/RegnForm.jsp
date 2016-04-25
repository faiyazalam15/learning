<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="RegnForm" method="post">
<center>

<h1 id="fcolor">Create New User ( Registration Form)</h1>
<table id="tabcolor">
	<tr>
		<td> User Name</td>
		<td><input type="text" name="usernm"></td>
	</tr>
	<tr>
		<td>Date of Birth</td>
		<td><input type="text" name="dob"></td>
	</tr>
	<tr>
		<td>Email Address or Mobile No.</td>
		<td><input type="text" name="mobno"></td>
	</tr>
	<tr>
		<td>Password Set</td>
		<td><input type="password" name="pass"></td>
	</tr>
	<tr>
		<td>Confirm Password</td>
		<td><input type="password" name="pass1"></td>
	</tr>
	<tr>
		<td>><input type="submit" name="sbmt" value="submit"></a></td>
		<td><input type="reset" name="reset" value="reset"></td>	
	</tr>
		
		
</table>
</center>
</form>
</body>
</html>