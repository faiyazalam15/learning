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
		
		int justify_buss=0;
		double Comm_Amt=0;
		double tds=0;
		double net_pay=0;
		double fd_tot_depo=0;

		int tot_justify_buss=0;
		
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
		PreparedStatement pst=con.prepareStatement("Select distinct * from FDACCOUNT where  FDOPENING BETWEEN '"+std+"'and '"+enddt+"'order by 1 asc");
		ResultSet rs=pst.executeQuery();
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
		<td>Plan Type</td>
		<td>Plan Duration</td>
		<td>Deposited Amount</td>
		<td>Weightage</td>
		<td>Justified Buss.</td>
		<td>Commission %</td>
		<td>Commission Amt.</td>
		<td>TDS @ 10%</td>
		<td>Net Payable Amount</td>
	</tr>
<%

	

	while (rs.next())
	{
		
		PreparedStatement pst2=con.prepareStatement("select sum(considamt) from fdaccount where fdno='"+rs.getString(10)+"' and fdopening between '"+std+"' and '"+enddt+"'");
		ResultSet rs2=pst2.executeQuery();
	    rs2.next();
	    
	    fd_tot_depo=fd_tot_depo+Double.parseDouble(rs2.getString(1));
			    
		PreparedStatement pst3=con.prepareStatement("select COMMISSION,WEIGHTAGE,DURATION,COM_YEAR_FROM,COM_YEAR_TO from AGENTCOMMISSIONMASTERS where SNO='"+rs.getString(14)+"' and DURATION='"+rs.getString(5)+"'");
		ResultSet rs3=pst3.executeQuery();
	    
		rs3.next();
		
	    
	    
	    	justify_buss=Integer.parseInt(rs.getString(6))*Integer.parseInt(rs3.getString(2))/100;
	    	Comm_Amt=justify_buss*Integer.parseInt(rs3.getString(1))/100;
	    	tds=Comm_Amt*10/100;
	    	net_pay=Comm_Amt-tds;
	    	


    	
%>				
		<tr>
		<td><%=rs.getString(8) %></td>
		<td><%=rs.getString(14) %></td>
		<td><%=rs.getString(9) %></td>
		<td><%=rs.getString(15) %></td>
		<td><%=rs.getString(16)%></td>
		<td><%=rs.getString(17)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs3.getString(2) %></td>
		<td><%= justify_buss%></td>
		<td><%=rs3.getString(1) %></td>
		<td><%=Comm_Amt %></td>
		<td><%=tds %></td>
		<td><%=net_pay %></td>
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
		<td><%=fd_tot_depo %></td>
		<td></td>
		<td><%=tot_justify_buss %> </td>
	</tr>

<%
		
	}
%>
	
<%							
	}
catch(Exception e)
{
	e.printStackTrace();
}	
%>
</table>
</form>
<br/>
<br/>
<input type="submit" name="Process_Vr" value="Generate Voucher">
<input type="reset" name="Reset" value="Cancel Process">
</center>
</body>
</html>