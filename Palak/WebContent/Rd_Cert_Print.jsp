<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="Mystyle.css">
<title>Insert title here</title>
<style>
.format
{
	color:#00FFFF;
	font-family:Times New Roman;
	Georgia:Serif;
	font-size:20px;
	font-weight:bold;
	text-align:left;
	
}

</style>
<script>
function myFunction() {
    window.print();
}
</script>
</head>
<body id="body4">

<%
	ResultSet rs=null;
	String st=request.getParameter("RDNO");

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "pramod", "pramod");
	PreparedStatement ps = con.prepareStatement("select * from ACCOUNT a,MEMDETAIL m,RD_Date r  where a.RDNO='"+st+"'");
	/*PreparedStatement ps = con.prepareStatement("select * from FDACCOUNT where FDNO=?");*/

	rs = ps.executeQuery();
	rs.next();
	
   
	
%>
<center>
	<h2>XYZ nidhi Limited</h2>
	<h6>Regd. Office: xyz colony, xyz road, Indore (M.P.)</h6>
    <h4>CIN NO. XXXXXXXXXXXXX</h4>
<h3 style="color:#00FFFF;"><u>Recurring Deposit Certificate</u></h3></center>
<div align="right">
<table  cellspacing="8" >
<tr>
<td class="format">Date</td>
<td><%=rs.getString(1) %></td>
</tr>
<tr>
<td class="format">Member Ship Number</td>
<td><%=rs.getString(2) %></td>
</tr>
<tr>
<td class="format">RD Account Number</td>
<td><%=rs.getString(13) %></td>
</tr>
<tr>
<td class="format">Plan Code</td>
<td><%=rs.getString(4) %></td>
</tr>
<tr>
<td class="format">Plan Term</td>
<td><%=rs.getString(6) %></td>
</tr>
<tr>
	<td class="format">Installment Mode </td>
	<td><%=rs.getString(8) %></td>
</tr>
<tr>
	<td class="format">installment Amount</td>
	<td><%=rs.getString(9) %>/-</td>
</tr>
</table>
</div>
<table cellspacing="">
<tr>
<td class="format">Rs</td>
<td></td>
</tr>
<tr>
<td class="format">Received With Thanks From Shri/Smt</td>
<td><%=rs.getString(16) %></td>
</tr>
<tr>
<td class="format">S/O Shri</td>
<td><%=rs.getString(17) %></td>
<td class="format">R/O</td>
<td><%=rs.getString(21) %></td>
</tr>
<tr>
<td class="format">Rs</td>
<td><%=rs.getString(9) %></td>
</tr>
<tr>
<td class="format">For a Period of</td>
<td><%=rs.getString(6) %>-Year</td>
<td class="format">Months at rate of interest</td>
<td>9.5%</td>
</tr>
<tr>
<td class="format">Maturity Amount Rs</td>
<td><%=rs.getString(10) %>/-</td>
<td class="format">Maturity Date</td>
<td><%=rs.getString(40) %></td>
</tr>
</table>
<hr>
<table>
<tr>
<td class="format">Received Rs</td>
<td><%=rs.getString(9) %>/-</td>
<td>as Maturity Amount of above deposit</td>
</tr>
<tr>
<td class="format">Maturity Date</td>
<td><%=rs.getString(40) %></td>
</tr>
<tr>
<td class="format">Pay Rs</td>
<td><%=rs.getString(10) %>/-</td>
</tr>
<tr>
<td class="format">To Shri</td>
<td><%=rs.getString(3) %></td>
<td>Emp.Code  :</td>
<td><%=rs.getString(11) %></td>
<td>Emp. Name :</td>
<td><%=rs.getString(12) %></td>
</tr>
</table>
<p style="color:#980000">Authorised Signatory</p>
<p align="right" style="color:#980000">Signature Of The Member</p>
<button onclick="myFunction()">Print</button>

<%
}
catch(Exception ex)
{
	ex.printStackTrace();
}


%>
</body>
</html>