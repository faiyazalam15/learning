<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<body>

<%
try
{
	String st=request.getParameter("fdId");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "pramod", "pramod");
	PreparedStatement ps = con.prepareStatement("select * from FDACCOUNT,MEMDETAIL  where MMNAME=MEMNAME AND FDNO=?");
	/*PreparedStatement ps = con.prepareStatement("select * from FDACCOUNT where FDNO=?");*/
	ps.setString(1,st);
	ResultSet rs = ps.executeQuery();
	rs.next();
	
   
	
%>
<center>
	<h2>XYZ nidhi Limited</h2>
	<h6>Regd. Office: xyz colony, xyz road, Indore (M.P.)</h6>
    <h4>CIN NO. XXXXXXXXXXXXX</h4>
<h3 style="color:#00FFFF;"><u>Fixed Deposit Certificate</u></h3></center>
<div align="right">
<table  cellspacing="8" >
<tr>
<td class="format">Date</td>
<td><%=rs.getString("FDOPENING") %></td>
</tr>
<tr>
<td class="format">Member Ship Number</td>
<td><%=rs.getString("MEMCODE") %></td>
</tr>
<tr>
<td class="format">FDR Account Number</td>
<td><%=rs.getString("FDNO") %></td>
</tr>
<tr>
<td class="format">Plan Code</td>
<td><%=rs.getString("PLANTYPE") %></td>
</tr>
<tr>
<td class="format">Plan Term</td>
<td><%=rs.getString("PLANDURATION") %></td>
</tr>
</table>
</div>
<table cellspacing="">
<tr>
<td class="format">Rs</td>
<td><%=rs.getString("CONSIDAMT") %></td>
</tr>
<tr>
<td class="format">Received With Thanks From Shri/Smt</td>
<td><%=rs.getString("MMNAME") %></td>
</tr>
<tr>
<td class="format">S/O Shri</td>
<td><%=rs.getString("MEMFNAME") %></td>
<td class="format">R/O</td>
<td><%=rs.getString("MEMADDR") %></td>
</tr>
<tr>
<td class="format">Rs</td>
<td><%=rs.getString("CONSIDAMT") %></td>
</tr>
<tr>
<td class="format">For a Period of</td>
<td><%=rs.getString("PLANDURATION") %></td>
<td class="format">Months at rate of interest</td>
<td><%=rs.getString("ROI") %> per annum as per the terms & conditions</td>
</tr>
<tr>
<td class="format">Maturity Amount Rs</td>
<td><%=rs.getString("MATAMT") %></td>
<td class="format">Maturity Date</td>
<td><%=rs.getString("MATURITYDATE") %></td>
</tr>
</table>
<hr>
<table>
<tr>
<td class="format">Received Rs</td>
<td><%=rs.getString("MATAMT") %> as Meturity Amount of above deposit</td>
</tr>
<tr>
<td class="format">Maturity Date</td>
<td><%=rs.getString("MATURITYDATE") %></td>
</tr>
<tr>
<td class="format">Pay Rs</td>
<td><%=rs.getString("MATAMT") %></td>
</tr>
<tr>
<td class="format">To Shri</td>
<td><%=rs.getString("MMNAME") %></td>
<td>Emp.Code  :</td>
<td><%=rs.getString("AGENTCODE") %></td>
<td>Emp. Name :</td>
<td><%=rs.getString("AGENTNAME") %></td>
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