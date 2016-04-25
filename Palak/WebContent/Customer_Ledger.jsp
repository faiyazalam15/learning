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
		
		PreparedStatement pst1=con.prepareStatement("Select distinct RENEWAL_RECP_DAT,C_INST,NEXT_DUE_DATE,INST_AMT,BAL_AMT,MATURITY_DATE from rd_date  where rdno='"+rdn+"'order by 1 asc");
		PreparedStatement pst=con.prepareStatement("Select distinct * from account  where rdno='"+rdn+"'order by 1 asc");

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
		<td><%= rs.getString(13)%></td>
		<td>Name  :</td>
		<td><%=rs.getString(3)%></td>
		<td>Account Open Date :</td>
		<td><%=rs.getString(1) %></td>
	</tr>
	<tr>
		<td>Plan Type : </td>
		<td><%=rs.getString(4) %></td>
		<td>Plan Category :</td>
		<td><%=rs.getString(5) %></td>
		<td>Mode of Payment :</td>
		<td><%=rs.getString(8) %></td>
	</tr>

	<tr>
		<td>Installment Amount :</td>
		<td><%=rs.getString(9) %></td>
		<td></td>
		<td></td>
<%
	}
	if(rs1.next())
	{
%>
		<td>Maturity Date : </td>
		<td><%=rs1.getString("MATURITY_DATE") %></td>
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
while(rs1.next())
{
%>
	<tr>
		<td><%=rs1.getString("RENEWAL_RECP_DAT")%></td>
		<td><%=rs1.getString("c_inst")%></td>
		<td></td>
		<td><%=rs1.getString("NEXT_DUE_DATE")%></td>
		<td><%=rs1.getString("INST_AMT")%></td>
		<td>25</td>
		<td><%=rs1.getString("BAL_AMT")%></td>
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