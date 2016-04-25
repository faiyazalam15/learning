<%@ page import="java.io.*,java.sql.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date,java.text.SimpleDateFormat,java.util.Calendar,java.util.Date,java.util.GregorianCalendar;"%>
<%
	response.setContentType("text/xml");
	String sn=request.getParameter("ok");
	String maturityDate,nextInstallemnt=null,currentDate;
	Connection Conn;
	PreparedStatement pst=null;
	String str="";
	int ctr1,installmentAmt;
	
	String MemCode,Memname,PlanType,PlanCategory,PlanDuration,ConsidAmt,InstallmentMode,MatAmt,AgentCode,AgentName;	

	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "pramod", "pramod");
	PreparedStatement ps = con.prepareStatement("select * from account a,rd_date r where NEXT_DUE_DATE in(select max(NEXT_DUE_DATE) from rd_date where rdno='"+sn+"') and r.rdno='"+sn+"' and a.rdno='"+sn+"'");
	//ps.setString(1,sn);
	//ps.setString(2,sn);
	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
	
		/* PreparedStatement ps1 = con.prepareStatement("select max(RENEWAL_RECP_DAT) from rd_date where rdno=?");
		ps1.setString(1,sn);
		ResultSet rs1 = ps1.executeQuery();
		rs1.next();
		out.print(rs1.getDate(1)); */
		ctr1=rs.getInt(19)+1;
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(rs.getDate(16));
	    SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
	    currentDate = sdf.format(calendar.getTime());
	    System.out.println(currentDate);
	    PlanType=rs.getString(4);
	    PlanDuration=rs.getString(6);
	    InstallmentMode=rs.getString(8);
		 if(PlanType.equals("RD"))
		 {
				if(PlanType.equals("RD"))
				{
						if(PlanDuration.equals("1"))
						{
							
							calendar.add(Calendar.YEAR, +1);
							maturityDate = sdf.format(calendar.getTime());
							
							calendar.add(Calendar.YEAR, -1);
							
							if(InstallmentMode.equals("360")) //Daily
							{
								if(calendar.DAY_OF_WEEK==7)
								calendar.add(Calendar.DAY_OF_MONTH, +2);
								else
								calendar.add(Calendar.DAY_OF_MONTH, +1);
								nextInstallemnt = sdf.format(calendar.getTime());
								 
							}
							else
							if(InstallmentMode.equals("12")) //Monthly
							{
								
								calendar.add(Calendar.MONTH, +1);
								nextInstallemnt = sdf.format(calendar.getTime());
								System.out.println(nextInstallemnt);
						
							}
							else
							if(InstallmentMode.equals("4")) //Quartly
							{
								
								calendar.add(Calendar.MONTH, +2);
								nextInstallemnt = sdf.format(calendar.getTime());
							}	
							else
							if(InstallmentMode.equals("2")) //Half Yearly
							{
								
								calendar.add(Calendar.MONTH, +5);
								nextInstallemnt = sdf.format(calendar.getTime());
							}
							else
							if(InstallmentMode.equals("1")) // Yearly
							{
								
								calendar.add(Calendar.MONTH, +11);
								nextInstallemnt = sdf.format(calendar.getTime());
								System.out.println("Next Installment is::"+nextInstallemnt);
							}
							
						}
						else
						if(PlanDuration.equals("2"))
						{
								calendar.add(Calendar.YEAR, +2);
								maturityDate = sdf.format(calendar.getTime());
								calendar.add(Calendar.YEAR, -2);
								if(InstallmentMode.equals("360")) //Daily
								{
									
									calendar.add(Calendar.DAY_OF_MONTH, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("12")) //Monthly
								{
									
									calendar.add(Calendar.MONTH, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("4")) //Quartly
								{
									
									calendar.add(Calendar.MONTH, +2);
									nextInstallemnt = sdf.format(calendar.getTime());
								}	
								else
								if(InstallmentMode.equals("2")) //Half Yearly
								{
									
									calendar.add(Calendar.MONTH, +5);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("1")) // Yearly
								{
									
									calendar.add(Calendar.YEAR, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
							}
							if(PlanDuration.equals("3"))
							{
								calendar.add(Calendar.YEAR, +3);
								maturityDate = sdf.format(calendar.getTime());
								calendar.add(Calendar.YEAR, -3);
								if(InstallmentMode.equals("360")) //Daily
								{
									
									calendar.add(Calendar.DAY_OF_MONTH, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("12")) //Monthly
								{
									
									calendar.add(Calendar.MONTH, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("4")) //Quartly
								{
									
									calendar.add(Calendar.MONTH, +2);
									nextInstallemnt = sdf.format(calendar.getTime());
								}	
								else
								if(InstallmentMode.equals("2")) //Half Yearly
								{
									
									calendar.add(Calendar.MONTH, +5);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("1")) //Half Yearly
								{
									
									calendar.add(Calendar.YEAR, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								
							}
							if(PlanDuration.equals("4"))
							{
								calendar.add(Calendar.YEAR, +4);
								maturityDate = sdf.format(calendar.getTime());
								calendar.add(Calendar.YEAR, -4);
								if(InstallmentMode.equals("360")) //Daily
								{
									
									calendar.add(Calendar.DAY_OF_MONTH, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("12")) //Monthly
								{
									
									calendar.add(Calendar.MONTH, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("4")) //Quartly
								{
									
									calendar.add(Calendar.MONTH, +2);
									nextInstallemnt = sdf.format(calendar.getTime());
								}	
								else
								if(InstallmentMode.equals("2")) //Half Yearly
								{
									
									calendar.add(Calendar.MONTH, +5);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("1")) //Half Yearly
								{
									
									calendar.add(Calendar.YEAR, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								
							}
							if(PlanDuration.equals("5"))
							{
								calendar.add(Calendar.YEAR, +5);
								maturityDate = sdf.format(calendar.getTime());
								calendar.add(Calendar.YEAR, -5);
								if(InstallmentMode.equals("360")) //Daily
								{
									
									calendar.add(Calendar.DAY_OF_MONTH, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("12")) //Monthly
								{
									
									calendar.add(Calendar.MONTH, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("4")) //Quartly
								{
									
									calendar.add(Calendar.MONTH, +2);
									nextInstallemnt = sdf.format(calendar.getTime());
								}	
								else
								if(InstallmentMode.equals("2")) //Half Yearly
								{
									
									calendar.add(Calendar.MONTH, +5);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("1")) //Yearly
								{
									
									calendar.add(Calendar.YEAR, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
							}
						}
				}
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyy");
			
		out.println("<emp>");
		out.println("<rdno>"+rs.getString(13)+"</rdno>");
		out.println("<mem>"+rs.getString(3)+"</mem>");
		out.println("<ptype>"+rs.getString(4)+"</ptype>");
		out.println("<pcat>"+rs.getString(5)+"</pcat>");
		out.println("<pdur>"+rs.getString(6)+"</pdur>");
		out.println("<camt>"+rs.getString(7)+"</camt>");
		out.println("<insmode>"+rs.getString(8)+"</insmode>");
		out.println("<insamt>"+rs.getString(9)+"</insamt>");
		out.println("<matamt>"+formatter.format(rs.getDate(17))+"</matamt>");
		out.println("<rddue>"+formatter.format(rs.getDate(16))+"</rddue>");
		out.println("<nextdue>"+nextInstallemnt+"</nextdue>");
		out.println("<instno>"+ctr1+"</instno>");
		out.println("<agcod>"+rs.getString(11)+"</agcod>");
		out.println("<agnam>"+rs.getString(12)+"</agnam>");
		
		
		
		out.println("</emp>");
 	}

	rs.close();
	con.close();
%>