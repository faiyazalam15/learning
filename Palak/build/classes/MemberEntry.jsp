<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="Mystyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<form>
<center>
<h1> New Member's Entry From </h1>
<table class="outline">
	<tr>
		<td>Registration Date :</td>
		<td><input type="text" name="date"></td>
		<td>Branch Code></td>
		
			<td><select>
				<option>001</option>
				<option>002</option>
				<option>005</option>
				</select>
			</td>
		<td>
			<select>
				<option>Alwar</option>
				<option>indore</option>
				<option>Udaipur</option>
			</select>
	</tr>
</table>
<table class="outline">


<tr>
	<td>Member's Code :<input type="text" name="MemCode"><td>
	<td>Member Name   :<input type="text" value="" name="MemName"></td>
	<td>Share Alloted from no.:<input type="text" name="Sharenofrom"></td>
	<td>Share Alloted to no.:<input type="text" name="Sharenoto"></td>
	<td>MemberShip Fees : <input type="text" name="Memfee" value="110"></td>
</tr>
</table>
<table>
<tr>
	<td><a href="MemDetail.jsp"><input type="button" name="MemDetail" value="Application Detail"></a></td>
	<td><input type="submit" name="Memfee" value="MemberShip Fees Detail"></td>
	<td><a href="Accounts.jsp"><input type ="button" name="AccountsDetail" value="AccountDetail"></a></td>
    
</tr>

</table>
</center>
</form>
</body>
</html>