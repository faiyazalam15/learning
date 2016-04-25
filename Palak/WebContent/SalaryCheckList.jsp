<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Mystyle.css">
<title>Insert title here</title>
</head>
<body>
<%
	
	
		try
		{
			String std=request.getParameter("startdate");
			String enddt=request.getParameter("enddate");
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
			PreparedStatement pst=con.prepareStatement("select * )");			
				
		}
		catch(Exception e)
		{
			e.printStackTrace();

		}		
%>
		
<center>
<h2>Pragati Nidhi Limited</h2>
<form>
<table class="headtop">
	<h3>Payout Check list from date   to date  </h3>
	<tr>
		<td>Code No.</td>
		<td>Rank</td>
		<td>Name</td>
		<td>Into.Code</td>
		<td>Intro.Rank</td>
		<td>Intro. Name</td>
		<td>Date</td>
		<td>Plan Type</td>
		<td>Plan Duration</td>
		<td>Plan Mode</td>
		<td>Inst.Amt.</td>
		<td>Total Ammount </td>
		<td>Weightage</td>
		<td>Justified Buss.</td>
		<td>Salary Per</td>
		<td>Gross Salary</td>
		<td>TDS @ 10%</td>
		<td>Net Payable Amount</td>
	</tr>

	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		
	</tr>

</table>
</form>
<br/>
<br/>
<input type="submit" name="Process_Vr" value="Generate Voucher">
<input type="reset" name="Reset" value="Cancel Process">
</center>
</body>
</html>