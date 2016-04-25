<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="Stylesheet" type="text/css" href="Mystyle.css">
<title>Insert title here</title>
</head>
<body>
<%
	ResultSet rs= null;
	ResultSet rs2=null;
	ResultSet rs3=null;
	ResultSet rs4=null;
	ResultSet rs5=null;
	ResultSet rs6=null;
	ResultSet rs7=null;
	
		try
		{
			String std=request.getParameter("startdate");
			String enddt=request.getParameter("enddate");
			String agntcd=request.getParameter("AgentCode");

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
			PreparedStatement pst=con.prepareStatement("Select * from Agentmaster where AGENTCODE='"+agntcd+"'");
			PreparedStatement pst2=con.prepareStatement("Select sum(considamt)from fdaccount where agentcode='"+agntcd+"'");
			PreparedStatement pst3=con.prepareStatement("Select * from fdaccount where agentcode='"+agntcd+"'and FDOPENING BETWEEN '"+std+"'and '"+enddt+"'");
			PreparedStatement pst4=con.prepareStatement("Select * from account where agentcode='"+agntcd+"'and RDDATE BETWEEN '"+std+"'and '"+enddt+"'");
			PreparedStatement pst5=con.prepareStatement("Select sum(INSTALLMENTAMT)from account where agentcode='"+agntcd+"'");
			PreparedStatement pst6=con.prepareStatement("Select * from RD_DATE r, account a where r.agentcode='"+agntcd+"'and r.RD_DATE BETWEEN '"+std+"'and '"+enddt+"'");
			PreparedStatement pst7=con.prepareStatement("Select sum(INST_AMT)from RD_DATE where agentcode='"+agntcd+"'");

			rs=pst.executeQuery();
			rs2=pst2.executeQuery();
			rs3=pst3.executeQuery();
			rs4=pst4.executeQuery();
			rs5=pst5.executeQuery();
			rs6=pst6.executeQuery();
			rs7=pst7.executeQuery();
			
 		}
		catch(Exception e)
		{
			e.printStackTrace();

		}
		

%>
<form name="vinform">
<center>
<h2>Pragati Nidhi Limited</h2>
<h3>Business Report From <%=request.getParameter("startdate")%> To <%=request.getParameter("enddate") %></h3>
	<table border="1" id="tb1">
		
		<tr>
			<td>Agent Regd Date</td>
			<td>Agent Code No.</td>
			<td>Name of Agent</td>
			<td>Agent Rank</td>
			<td>Intro. Code</td>
			<td>Intro. Name</td>
			<td>Intro. Rank</td>
		</tr>
		
<%
	while (rs.next())
	{
%>
		<tr>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(4) %></td>
	   		<td><%=rs.getString(6) %></td>
	  		<td><%=rs.getString(7) %></td>
	  		<td><%=rs.getString(8) %></td>
	   </tr>
<%
	}
%>
	</table>
	<h5>Detail of Fixed Deposit :-</h5>
	<table border="1" id="tr">		
		<tr>
			<td>A/c Open Date</td>
			<td>Account Number</td>
			<td>Name of Customer</td>
			<td>Plan Type</td>
			<td>Plan Duration</td>
			<td>Self Business Amount</td>
			
		</tr>
<%
	while(rs3.next())	
	{
%>		
		<tr>
			<td><%=rs3.getString(11) %></td>
			<td><%=rs3.getString(10) %></td>
			<td><%=rs3.getString(2)%></td>
			<td><%=rs3.getString(3)%></td>
			<td><%=rs3.getString(5) %></td>
			<td><%=rs3.getInt(6) %></td>
		</tr>
<%
	}
%>

<%
	while(rs2.next())
	{
%>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>Total Business :-</td>
			<td><input type="text" name="tm" value="<%= rs2.getString(1)%>"></td>
		</tr>
<%
	}
%>
	</table>

	<h5>Detail New  Recurring Deposit Accounts :-</h5>
	<table border="1" id="tr">		
		<tr>
			<td>A/c Open Date</td>
			<td>Account Number</td>
			<td>Name of Customer</td>
			<td>Plan Type</td>
			<td>Plan Duration</td>
			<td>Installment Mode</td>
			<td>Installment No.</td>
			<td>Self Business Amount</td>
			
		</tr>
<%
	while (rs4.next())
	{
%>		
		<tr>
			<td><%=rs4.getString(1) %></td>
			<td><%=rs4.getString(13) %></td>
			<td><%=rs4.getString(3) %></td>
			<td><%=rs4.getString(4)%></td>
			<td><%=rs4.getString(6) %></td>
			<td><%=rs4.getString(8) %></td>
			<td>1</td>
			<td><%=rs4.getString(9)%></td>
		</tr>
<%
	}
%>

<%
while(rs5.next())
	{
%>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>Total Business :-</td>
			<td><input type="text" name="tm" value="<%= rs5.getString(1)%>"></td>
		</tr>
<%
	}
%>
	</table>
<h5>Detail Renewal  Recurring Deposit Accounts :-</h5>
	<table border="1" id="tr">		
		<tr>
			<td>A/c Open Date</td>
			<td>Account Number</td>
			<td>Name of Customer</td>
			<td>Plan Type</td>
			<td>Plan Duration</td>
			<td>Installment Mode</td>
			<td>Installment No.</td>
			<td>Self Business Amount</td>
			
		</tr>
<%
	while (rs6.next())
		
	{
%>		
		<tr>
			<td><%=rs6.getString(7)%></td>
			<td><%=rs6.getString(27)%></td>
			<td><%=rs6.getString(17)%></td>
			<td><%=rs6.getString(18)%></td>
			<td><%=rs6.getString(20)%></td>
			<td><%=rs6.getString(22)%></td>
			<td><%=rs6.getString(6)%></td>
			<td><%=rs6.getString(8)%></td>
		</tr>
<%
	}
%>
<%
	while(rs7.next())
	{
%>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>Total Business :-</td>
			<td><input type="text" name="tm" value="<%= rs7.getInt(1)%>"></td>
		</tr>
		</table>
<%
	}
%>

	<br/>
	<br/>
	<h4>Signature of Incharge</h4>

</center>


</form>

</body>
</html>