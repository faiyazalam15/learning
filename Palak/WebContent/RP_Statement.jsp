<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="Mystyle.css">
<title>Insert title here</title>
</head>
<body>
<%
	ResultSet rs=null;
	ResultSet rs1=null;
	ResultSet rs2=null;
	ResultSet rs3=null;
	ResultSet rs4=null;
		
	try
	{
		String rpdt=request.getParameter("rpdate");
	

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
		PreparedStatement pst=con.prepareStatement("Select * from fdaccount where FDOPENING='"+rpdt+"'");
		PreparedStatement pst1=con.prepareStatement("Select * from fdaccount where FDOPENING='"+rpdt+"'");
		PreparedStatement pst2=con.prepareStatement("Select sum(considamt) from fdaccount where FDOPENING='"+rpdt+"'");
		PreparedStatement pst3=con.prepareStatement("Select * from ACCOUNT a,RD_DATE r where r.Renewal_recp_dat='"+rpdt+"'");
		PreparedStatement pst4=con.prepareStatement("Select sum(inst_amt) from RD_DATE where Renewal_recp_dat='"+rpdt+"'");

		rs=pst.executeQuery();
		rs1=pst1.executeQuery();
		rs2=pst2.executeQuery();
		rs3=pst3.executeQuery();
		rs4=pst4.executeQuery();


	
	}
	catch(Exception e)
	{
		e.printStackTrace();

	}


%>
<center>
<h1>Company Name</h1>
<h5>Company Address</h5>
<h2>Receipt & payament Statement</h2>
<form>
<table>
<%
	if(rs1.next())
	{
%>
	<tr>
		<td>Branch Name :</td>
		<td>Faridabad</td>
		<td>Branch Code :</td>
		<td>001</td>
		<td>Date  :</td>
		<td><%=rs1.getString(11) %></td>
<%
	}
%>
</table>
<table>
	<th>Part-A : Cash Transaction</th>
	<th>Receipt :</th>
</table>
<table class="headtop">
		<tr>
		<td>Account Name</td>
		<td>Discription</td>
		<td>Receipt Amount</td>
		<td>Payment Amount</td>
		<td>Balance Amount</td>
	</tr>
<%
	while(rs.next())
	{
%>

	<tr>
		<td>Fixed Deposit</td>
		<td><%=rs.getString(10)%>
			<%=rs.getString(2) %>, Plan<%=rs.getString(5)%> Year, Agent Code :<%=rs.getString(8)%>
			Agent Name :<%=rs.getString(9)%></td>
		<td><%=rs.getInt(6)%></td>
		<td>0</td>
<%
	}
%>	
<%
	if(rs2.next())
	{
%>
		<td><%=rs2.getString(1) %></td>
<%
	}
%>
<%
	while(rs3.next())
	{
%>
<tr>
		<td>Recurring Deposit</td>
		<td><%=rs3.getString(13)%>
			<%=rs3.getString(3)%>, Plan<%=rs3.getString(6)%> Year, Agent Code :<%=rs3.getString(11) %>
			Agent Name :<%=rs3.getString(9)%>, Inst. No.<%=rs3.getInt(19)%></td>
		<td><%=rs3.getInt(21)%></td>
		<td>0</td>

<%
	}
%>
<%
	if(rs4.next())
	{
		
%>
	
		<td><%=rs4.getString(1)%></td>
	
<%
	}
%>
		
</table>
</form>
</center>
</body>
</html>