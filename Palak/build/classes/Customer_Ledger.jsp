<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="Stylesheet" type="text/css" href="Mystyle.css">
<title>Customer Ledger </title>
</head>
<body>
<%
ResultSet rs=null;
ResultSet rs1=null;
	try
	{
			String rdn=request.getParameter("rdno");
			
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
		
		PreparedStatement pst=con.prepareStatement("Select * from rd_date r,account a where r.rdno='"+rdn+"'");
		PreparedStatement pst1=con.prepareStatement("Select * from rd_date r,account a where r.rdno='"+rdn+"'");

		rs=pst.executeQuery();
		rs1=pst1.executeQuery();
	}
	catch(SQLException e)
	{
		e.printStackTrace();

	}
		
      
%>
<center>
<form>
<h1>Pragati Nidhi Limited</h1>
<h2>Customer Ledger</h2>

<Table border="1" id="tb1">
<%
 if(rs.next())
{

%>
	<tr>
		<td>Account No. :</td>
		<td><%= rs.getString(1)%></td>
		<td>Name  :</td>
		<td><%=rs.getString(17)%></td>
		<td>Account Open Date :</td>
		<td><%=rs.getString(15) %></td>
	</tr>
	<tr>
		<td>Plan Type : </td>
		<td><%=rs.getString(18) %></td>
		<td>Plan Category :</td>
		<td><%=rs.getString(19) %></td>
		<td>Mode of Payment :</td>
		<td><%=rs.getString(22) %></td>
	</tr>

	<tr>
		<td>Installment Amount :</td>
		<td><%=rs.getString(23) %></td>
		<td></td>
		<td></td>
		<td>Maturity Date : </td>
		<td><%=rs.getString(4) %></td>
	</tr>
<%
	}
%>
</Table><br/>
<table border="1" id="tr">


	<tr>
		<td>Date</td>
		<td>Inst.No.</td>
		<td>Due Date</td>
		<td>Next Due Date</td>
		<td>Inst.Amount</td>
		<td>Late Fees</td>
		<td>Balance Amount</td>
	</tr>
<%
while (rs1.next())
{
%>
	<tr>
		<td><%=rs1.getString(7)%></td>
		<td><%=rs1.getString(6)%></td>
		<td></td>
		<td><%=rs1.getString(3)%></td>
		<td><%=rs1.getString(8)%></td>
		<td>25</td>
		<td><%=rs1.getString(11)%></td>
	</tr>
<%
}
%>	
</table>
<br/>
	<br/>
	<h4>Signature of Incharge</h4>


</form>
</center>
</body>
</html>