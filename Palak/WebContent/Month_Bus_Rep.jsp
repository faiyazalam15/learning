<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="Stylesheet" type="text/css" href="Mystyle.css">
<title>Insert title here</title>
</head>
<body id="body3">

<form action="MonthlyReport.jsp" id=body1>
<center>
<table class="margin1">
	<tr>
		<th>Monthly Business Report</th>
	</tr>
	<tr>
		<td>Start Date</td>
		<td><input type="text" name="startdate" id="stdt"></td>
		<td>End Date</td>
		<td><input type="text" name="enddate" id="stdt1"></td>
		<td>Branch</td>
		<td><select name="BrCode">
				<option>Select Branch</option>
				<option>All Branches</option>
				<option>Alwar</option>
				<option>Faridabad</option>
				<option>Kishangrh</option>
			</select>
		</td>
	</tr>
	
</table>
<br/>
<br/>
<br/>
<input type="submit" name="submit" value="Show Report">
<input type="reset" name="reset" value="reset">
</center>
</form>
</body>
</html>