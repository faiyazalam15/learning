<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<form>
<h2>Give Permission to Users</h2>
<table>
	<tr>
		<td>Enter User Id</td>
		<td><input type="text" name="usernm"></td>
		<td>Permitted Branch</td>
		<td><input type="text" name="permit"></td>
	</tr>
</table>
<table>
	<tr>
		<td>Fresh Business Entry</td>
		<td><input type="checkbox"></td>
		<td>Renewal Business Entry</td>
		<td><input type="checkbox"></td>
		<td>Associates Entry</td>
		<td><input type="checkbox"></td>
	</tr>
	<tr>
		<td>Fresh Business update Entry</td>
		<td><input type="checkbox"></td>
		<td>Renewal Business  update Entry</td>
		<td><input type="checkbox"></td>
		<td>Associates  update Entry</td>
		<td><input type="checkbox"></td>
	</tr>
	<tr>
		<td>Fresh Business Delete Entry</td>
		<td><input type="checkbox"></td>
		<td>Renewal Business Delete Entry</td>
		<td><input type="checkbox"></td>
		<td>Associates Delete Entry</td>
		<td><input type="checkbox"></td>
	</tr>
	<tr>
		<td>Salary/Payament Process</td>
		<td><input type="checkbox"></td>
		<td>F.A's/ Employee Report Print</td>
		<td><input type="checkbox"></td>
		<td>Branch Report Print</td>
		<td><input type="checkbox"></td>
	</tr>
	<tr>
		<td>Certificate/ Bond Print</td>
		<td><input type="checkbox"></td>
		<td>Renewal Receipt Print</td>
		<td><input type="checkbox"></td>
		<td>Change Password</td>
		<td><input type="checkbox"></td>
	</tr>
</table>
		<input type="submit" name="save" value="submit">
		<input type="reset" name="reset" value="reset">
</form>
</center>

</body>
</html>