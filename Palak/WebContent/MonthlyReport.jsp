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
	String brcd=request.getParameter("BrCode");

	ResultSet rs=null;
	ResultSet rs1=null;
		try
		{
			String std=request.getParameter("startdate");
			String enddt=request.getParameter("enddate");
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
			
			PreparedStatement pst=con.prepareStatement("select sum(considamt) from fdaccount where fdopening between '"+std+"' and '"+enddt+"'");
			PreparedStatement pst1=con.prepareStatement("select  sum(inst_amt) from rd_date where renewal_recp_dat between '"+std+"' and '"+enddt+"'");

			rs=pst.executeQuery();
			rs1=pst1.executeQuery();

			}
		catch(Exception e)
		{
			e.printStackTrace();
		
		}
		
		
%>
<center>
<h1>Monthly Business Report</h1>
<h3>Business Report From <%=request.getParameter("startdate")%> To <%=request.getParameter("enddate") %></h3>
<form>
<table>
	<tr>
		<td>Sr.No.</td>
		<td>Month</td>
		<td>Branch Code</td>
		<td>Branch Name</td>
		<td>F.D. </td>
		<td>R.D.</td>
		<td>D.D.S.</td>
		<td>Total Business</td>
	</tr>
<%
	while(rs.next())
	{
		
%>
	<tr>
		<td>1</td>
		<td>Month</td>
		<td>001</td>
		<td><%= brcd %></td>
		<td><%=rs.getInt(1) %></td>
		
<%
	}
	while(rs1.next())
	{

%>
        <td><%=rs1.getString(1) %></td>
		<td><%=rs1.getInt(1) %></td>
		
	</tr>
<%
		
	}

%>
</table>
</form>
</center>
</body>
</html>