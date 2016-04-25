
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Renewal")
public class Renewal extends HttpServlet 
{
	
	//String rdn,pltype,pcat,pdur,consiamt,insmod,insamt,insno,nextduedt,matdt;
	Connection con;
	String maturityDate,nextInstallemnt,currentDate;
	Connection Conn;
	PreparedStatement pst=null;
	String str="";
	int ctr1,installmentAmt;
	ResultSet rs;
	static int instcount;
	String MemCode,Memname,PlanType,PlanCategory,PlanDuration,ConsidAmt,InstallmentMode,MatAmt,AgentCode,AgentName;	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			response.setContentType("text/html");
	
			PrintWriter out=response.getWriter();
			PlanType=request.getParameter("PlanType");			
			
			PlanCategory=request.getParameter("PlanCategory");
			PlanDuration=request.getParameter("PlanDuration");
			ConsidAmt=request.getParameter("ConsidAmt");
			String rdno=request.getParameter("RdNo");			
			int x=Integer.parseInt(request.getParameter("InstallmentNo"));
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
				
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
				PreparedStatement ps=con.prepareStatement("select * from rd_date where rdno=?");
				ps.setString(1,rdno);
				ResultSet rs=ps.executeQuery();
				rs.next();
				
				Calendar calendar = new GregorianCalendar();
				calendar.setTime(new Date());
			    SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
			    currentDate = sdf.format(calendar.getTime());
			    calendar.setTime(rs.getDate(3));
			    String nextInstallemnt= request.getParameter("NextDueDate");
			    String maturityDate= request.getParameter("MatDate");
			    System.out.println("Date Calc::"+nextInstallemnt);
			  /*  
			   if(PlanType.equals("RD"))
				{
					System.out.println("Hello RD");
					System.out.println("NextInstallment");
					InstallmentMode=request.getParameter("InstallmentMode");
					installmentAmt=Integer.parseInt(request.getParameter("installmentAmt"));
					MatAmt=request.getParameter("MatAmt");
					AgentCode=request.getParameter("AgentCode");
					AgentName=request.getParameter("AgentName");
					
					if(PlanType.equals("RD"))
					{
							if(PlanDuration.equals("1"))
							{
								
								calendar.add(Calendar.YEAR, +1);
								maturityDate = sdf.format(calendar.getTime());
								
								calendar.add(Calendar.YEAR, -1);
								
								if(InstallmentMode.equals("360")) //Daily
								{
									instcount=360;
									if(calendar.DAY_OF_WEEK==7)
									calendar.add(Calendar.DAY_OF_MONTH, +2);
									else
									calendar.add(Calendar.DAY_OF_MONTH, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("12")) //Monthly
								{
									instcount=12;
									calendar.add(Calendar.MONTH, +1);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("4")) //Quartly
								{
									instcount=4;
									calendar.add(Calendar.MONTH, +3);
									nextInstallemnt = sdf.format(calendar.getTime());
								}	
								else
								if(InstallmentMode.equals("2")) //Half Yearly
								{
									instcount=2;
									calendar.add(Calendar.MONTH, +6);
									nextInstallemnt = sdf.format(calendar.getTime());
								}
								else
								if(InstallmentMode.equals("1")) // Yearly
								{
									instcount=1;
									calendar.add(Calendar.MONTH, +1);
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
										instcount=720;
										calendar.add(Calendar.DAY_OF_MONTH, +1);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
									else
									if(InstallmentMode.equals("12")) //Monthly
									{
										instcount=24;
										calendar.add(Calendar.MONTH, +1);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
									else
									if(InstallmentMode.equals("4")) //Quartly
									{
										instcount=8;
										calendar.add(Calendar.MONTH, +2);
										nextInstallemnt = sdf.format(calendar.getTime());
									}	
									else
									if(InstallmentMode.equals("2")) //Half Yearly
									{
										instcount=4;
										calendar.add(Calendar.MONTH, +5);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
									else
									if(InstallmentMode.equals("1")) // Yearly
									{
										instcount=2;
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
										instcount=1080;
										calendar.add(Calendar.DAY_OF_MONTH, +1);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
									else
									if(InstallmentMode.equals("12")) //Monthly
									{
										instcount=36;
										calendar.add(Calendar.MONTH, +1);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
									else
									if(InstallmentMode.equals("4")) //Quartly
									{
										instcount=12;
										calendar.add(Calendar.MONTH, +2);
										nextInstallemnt = sdf.format(calendar.getTime());
									}	
									else
									if(InstallmentMode.equals("2")) //Half Yearly
									{
										instcount=6;
										calendar.add(Calendar.MONTH, +5);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
									else
									if(InstallmentMode.equals("1")) //Half Yearly
									{
										instcount=3;
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
										instcount=1440;
										calendar.add(Calendar.DAY_OF_MONTH, +1);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
									else
									if(InstallmentMode.equals("12")) //Monthly
									{
										instcount=48;
										calendar.add(Calendar.MONTH, +1);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
									else
									if(InstallmentMode.equals("4")) //Quartly
									{
										instcount=16;
										calendar.add(Calendar.MONTH, +2);
										nextInstallemnt = sdf.format(calendar.getTime());
									}	
									else
									if(InstallmentMode.equals("2")) //Half Yearly
									{
										instcount=8;
										calendar.add(Calendar.MONTH, +5);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
									else
									if(InstallmentMode.equals("1")) //Half Yearly
									{
										instcount=4;
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
										instcount=1800;
										calendar.add(Calendar.DAY_OF_MONTH, +1);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
									else
									if(InstallmentMode.equals("12")) //Monthly
									{
										instcount=60;
										calendar.add(Calendar.MONTH, +1);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
									else
									if(InstallmentMode.equals("4")) //Quartly
									{
										instcount=20;
										calendar.add(Calendar.MONTH, +2);
										nextInstallemnt = sdf.format(calendar.getTime());
									}	
									else
									if(InstallmentMode.equals("2")) //Half Yearly
									{
										instcount=10;
										calendar.add(Calendar.MONTH, +5);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
									else
									if(InstallmentMode.equals("1")) //Yearly
									{
										instcount=5;
										calendar.add(Calendar.YEAR, +1);
										nextInstallemnt = sdf.format(calendar.getTime());
									}
								}
							}
					}
			  */ PreparedStatement ps1=con.prepareStatement("select * from account where rdno=?");
				ps1.setString(1,rdno);
				ResultSet rs1=ps1.executeQuery();
				rs1.next();
				
				PreparedStatement pst=con.prepareStatement("INSERT INTO RD_DATE VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				pst.setString(1,rdno);
				pst.setDate(2,rs.getDate(2));
				pst.setString(3,nextInstallemnt);
				pst.setString(4,maturityDate);
				pst.setInt(5,rs.getInt(5));
				pst.setInt(6,x);
				pst.setString(7,currentDate);
				pst.setInt(8,rs1.getInt(9));
				pst.setInt(9,rs.getInt(5)-x);
				pst.setInt(10,x*rs.getInt(8));
				pst.setInt(11,(rs.getInt(12)- (x*rs.getInt(8))));
				pst.setInt(12,rs.getInt(12));
				pst.setString(13,rs1.getString(11));
				pst.setString(14, rs1.getString(12));
				pst.setString(15, rs1.getString(14));
				pst.setString(16, rs1.getString(15));
				pst.setString(17, rs1.getString(16));
				pst.setString(18, rs1.getString(17));
				
			/*	System.out.println("rdno"+rdno);
				System.out.println("RD Date :  "+rs.getDate(2));
				System.out.println("Next Due Date"+nextInstallemnt);
				System.out.println("Maturity Date"+maturityDate);
				System.out.println("Total Installment :"+rs.getInt(5));
				System.out.println("current Installment :"+x);
				System.out.println("Renewal Entry Date  :"+currentDate);
				System.out.println("Installment Amount  :"+rs1.getInt(9));
				System.out.println("Remaining Installment  : "+(rs.getInt(5)-x));
				System.out.println("Total Depo. Amount  :"+x*rs1.getInt(9));
				System.out.println("Balance Amount  :"+(rs.getInt(12)- (x*rs1.getInt(9))));
				System.out.println("Consideration Amount  : "+rs.getInt(12));
				System.out.println("Agent Code  : "+rs1.getString(11));
				System.out.println("Agent Name  :"+AgentName);*/
				
				
				
				int y=pst.executeUpdate();
				if(y>0)
				{
					out.print("Success");
					RequestDispatcher rd=request.getRequestDispatcher("RenewalEntry.jsp");
					rd.include(request, response);
				}
				else
				{
					out.print("Not Success");
					RequestDispatcher rd=request.getRequestDispatcher("RegistrationType.jsp");
					rd.forward(request, response);
				}
				
			} 
			catch (ClassNotFoundException | SQLException e1) 
			{
				e1.printStackTrace();
			}
	}

	
}
