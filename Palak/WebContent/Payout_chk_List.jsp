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
			Double tds=0.0;
			int total=0;
			String std=request.getParameter("startdate");
			String enddt=request.getParameter("enddate");
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
			PreparedStatement pst=con.prepareStatement("Select distinct AGENTCODE,RANK,AGENTNAME,INTROCODE,INTRORANK,INTRONAME from RD_DATE where  RENEWAL_RECP_DAT BETWEEN '"+std+"'and '"+enddt+"'order by 1 asc");
			ResultSet rs=pst.executeQuery();

			PreparedStatement pst5=con.prepareStatement("Select distinct AGENTCODE,RANK,AGENTNAME,INTROCODE,INTRORANK,INTRONAME,FDNO,PLANDURATION,CONSIDAMT from FDACCOUNT where  FDOPENING BETWEEN '"+std+"'and '"+enddt+"'order by 1 asc");
			ResultSet rs5=pst5.executeQuery();

			PreparedStatement ps=con.prepareStatement("Select distinct AGENTCODE,RANK,AGENTNAME,INTROCODE,INTRORANK,INTRONAME from RD_DATE where  RENEWAL_RECP_DAT BETWEEN '"+std+"'and '"+enddt+"'order by 1 asc");
			ResultSet r=ps.executeQuery();
			while(r.next())
			{
				total++;
			}
				
			out.print("Total Record::"+total);
			
			
			
			
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
			while(rs.next())
			{
				PreparedStatement pst1=con.prepareStatement("SELECT distinct r.RDNO,a.PLANDURATION FROM RD_DATE r,account a WHERE RENEWAL_RECP_DAT BETWEEN '"+std+"' and '"+enddt+"' and r.AGENTCODE='"+rs.getString("AGENTCODE")+"' and r.rdno=a.rdno");
				ResultSet rs1=pst1.executeQuery();
				double tot_wght=0;
				double tot_justify=0;
				double tot_comm_amt=0;
				double tot_tds=0;
				double tot_Net_Pay=0;
				int tot=0;
				double tot_depo=0;
				while(rs1.next())
				{
					PreparedStatement pst2=con.prepareStatement("select sum(INST_AMT) from rd_date WHERE RENEWAL_RECP_DAT BETWEEN '"+std+"' and '"+enddt+"' and rdno='"+rs1.getString(1)+"'");
					ResultSet rs2=pst2.executeQuery();
					rs2.next();
					tot=tot+Integer.parseInt(rs2.getString(1));
					
					PreparedStatement pst3=con.prepareStatement("select COMMISSION,WEIGHTAGE,DURATION,COM_YEAR_FROM,COM_YEAR_TO from AGENTCOMMISSIONMASTERS where SNO='"+rs.getString("RANK")+"' and DURATION='"+rs1.getString(2)+"'");
					ResultSet rs3=pst3.executeQuery();
				    rs3.next();
				    
				    double justifi=(Double.parseDouble(rs2.getString(1))*Double.parseDouble(rs3.getString(2)))/100;
				    
					double comm=(justifi*Double.parseDouble(rs3.getString(1)))/100;
					
					tds=(comm*10)/100;
					double Net_Pay_Amt=comm -tds;
					
					tot_wght=tot_wght+Integer.parseInt(rs3.getString(2));
					tot_justify=tot_justify+justifi;
					tot_comm_amt=tot_comm_amt+comm;
					tot_tds=tot_tds+tds;
					tot_Net_Pay=tot_Net_Pay+Net_Pay_Amt;
					System.out.println(tot_Net_Pay);
		
						
				
	%>			
					<tr>
					<td><%=rs.getString("AGENTCODE")%></td>
					<td><%=rs.getString("RANK")%></td>
					<td><%=rs.getString("AGENTNAME")%></td>
					<td><font color="red"><%=rs.getString("INTROCODE")%></font></td>
					<td><font color="red"><%=rs.getString("INTRORANK")%></font></td>
					<td><font color="red"><%=rs.getString("INTRONAME")%></font></td>
					<td><%=rs1.getString(1)%></td>
					<td><%=rs1.getString(2)%></td>
					<td><%=rs2.getString(1) %></td>
					<td><%=rs3.getString(2) %></td>
					<td><%=justifi %></td>
					<td><%=rs3.getString(1) %></td>
					<td><%=comm%></td>
					<td><%=tds%></td>
					<td><%=Net_Pay_Amt %></td>
					
				
					<%-- <td><%=rs3.getString(1) %></td> --%>
	<%
					
				
				}
				pst1.close();
				rs1.close();
			
%>
				<tr>
				<td style="background-color:blue; color:white;"></td>
				<td style="background-color:blue; color:white;"></td>
				<td style="background-color:blue; color:white;"></td>
				<td style="background-color:blue; color:white;"></td>
				<td style="background-color:blue; color:white;"></td>
				<td style="background-color:blue; color:white;"></td>
				<td style="background-color:blue; color:white;"></td>
				<td style="background-color:blue; color:white;"></td>
				<td style="background-color:blue; color:white;"><%=tot%></td>
				<td style="background-color:blue; color:white;"><%=tot_wght %></td>
				<td style="background-color:blue; color:white;"><%=tot_justify %></td>
				<td style="background-color:blue; color:white;"></td>
				<td style="background-color:blue; color:white;"><%=tot_comm_amt %></td>
				<td style="background-color:blue; color:white;"><%=tot_tds %></td>
				<td style="background-color:blue; color:white;"><%=tot_Net_Pay%></td>
				
				</tr>
<%

		int  fd_wgt=0;
		double fd_comm=0;
        double justify_tot=0;
        double fd_tot_tds=0;
        double fd_net_pay_amt=0;


		while (rs5.next())
		{
			
			PreparedStatement pst7=con.prepareStatement("select sum(considamt) from fdaccount WHERE fdopening BETWEEN '"+std+"' and '"+enddt+"'");
			ResultSet rs7=pst7.executeQuery();
			rs7.next();
			
				double fd_tot=0;
			
				fd_tot=fd_tot+Integer.parseInt(rs7.getString(1));
			
			
			
			PreparedStatement pst6=con.prepareStatement("select COMMISSION,WEIGHTAGE,DURATION,COM_YEAR_FROM,COM_YEAR_TO from AGENTCOMMISSIONMASTERS where SNO='"+rs5.getString(2)+"' and DURATION='"+rs5.getString(8)+"'");
			ResultSet rs6=pst6.executeQuery();
			rs6.next();
			
			 double fd_justify=Integer.parseInt(rs5.getString(9))*Integer.parseInt(rs6.getString(2))/100;
			 double fd_comm_amt=fd_justify*rs6.getInt(1)/100;
			 double fd_tds=fd_comm_amt*10/100;
			 double fd_net_pay=fd_comm_amt-fd_tds;
		        
			 fd_net_pay_amt=fd_net_pay_amt+ fd_net_pay;


		      
			 
			 
			 justify_tot=justify_tot+fd_justify;
			 fd_wgt=fd_wgt+Integer.parseInt(rs6.getString(2));
			 fd_comm=fd_comm+fd_comm_amt;
			 fd_tot_tds=fd_tot_tds+fd_tds;
%>	
				<tr>
				<td><%=rs5.getString(1)%></td>	
				<td><%=rs5.getString(2)%></td>
				<td><%=rs5.getString(3)%></td>
				<td><%=rs5.getString(4)%></td>
				<td><%=rs5.getString(5)%></td>
				<td><%=rs5.getString(6)%></td>
				<td><%=rs5.getString(7)%></td>
				<td><%=rs5.getString(8)%></td>
				<td><%=rs5.getString(9)%></td>
				<td><%=rs6.getInt(2)%></td>
				<td><%=fd_justify%></td>
				<td><%=rs6.getInt(1)%></td>
				<td><%=fd_comm_amt %></td>
				<td><%=fd_tds %></td>
				<td><%=fd_net_pay %></td>
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
				<td><%=fd_wgt %></td>
				<td><%=justify_tot %></td>
				<td></td>
				<td><%=fd_comm %></td>
				<td><%=fd_tot_tds %></td>
				<td><%=fd_net_pay_amt %></td>
				</tr>
<%
		}
		
%>	
		
		
		
<%
			}
			
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