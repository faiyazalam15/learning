import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/account")
public class account extends HttpServlet
{
	String maturityDate,nextInstallemnt,currentDate;
	Connection Conn;
	PreparedStatement pst=null;
	String str="";
	int ctr1,installmentAmt;
	ResultSet rs;
	static int instcount;
	String MemCode,Memname,PlanType,PlanCategory,PlanDuration,ConsidAmt,InstallmentMode,MatAmt,AgentCode,Rank,AgentName,Introcode,Introname,Introrank;	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		PlanType=request.getParameter("PlanType");
		MemCode=request.getParameter("MemCode");
		Memname=request.getParameter("Mmname");
		PlanCategory=request.getParameter("PlanCategory");
		PlanDuration=request.getParameter("PlanDuration");
		ConsidAmt=request.getParameter("ConsidAmt");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
			
		} 
		catch (ClassNotFoundException | SQLException e1) 
		{
			e1.printStackTrace();
		}
						
		Calendar calendar = new GregorianCalendar();
	    SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
	    currentDate = sdf.format(calendar.getTime());
	    

	    
	    if(PlanType.equals("FD"))
	    {
	    
			if(PlanDuration.equals("6"))
			{
				calendar.add(Calendar.MONTH, +6);
				maturityDate = sdf.format(calendar.getTime());
				System.out.println("Maturity Date::"+maturityDate);
								
			}
			else
			if(PlanDuration.equals("1"))
			{
					calendar.add(Calendar.YEAR, +1);
					maturityDate = sdf.format(calendar.getTime());
					System.out.println("Maturity Date:: Pramod Nawle"+maturityDate);
					
			}
			else
			if(PlanDuration.equals("2"))
			{
					calendar.add(Calendar.YEAR, +2);
					maturityDate = sdf.format(calendar.getTime());
					System.out.println("Maturity Date::"+maturityDate);
			}
			else
			if(PlanDuration.equals("3"))
			{
					calendar.add(Calendar.YEAR, +3);
					maturityDate = sdf.format(calendar.getTime());
					System.out.println("Maturity Date::"+maturityDate);
			}
			else
			if(PlanDuration.equals("4"))
			{
					calendar.add(Calendar.YEAR, +4);
					maturityDate = sdf.format(calendar.getTime());
					System.out.println("Maturity Date::"+maturityDate);
			}
			else
			if(PlanDuration.equals("5"))
			{
					calendar.add(Calendar.YEAR, +5);
					maturityDate = sdf.format(calendar.getTime());
					System.out.println("Maturity Date::"+maturityDate);
			}
		}
		
		/*HttpSession session =request.getSession();
			session.setAttribute("uname", MemCode);*/
		
			if(PlanType.equals("RD"))
			{
				System.out.println("Hello RD");
				InstallmentMode=request.getParameter("InstallmentMode");
				installmentAmt=Integer.parseInt(request.getParameter("installmentAmt"));
				MatAmt=request.getParameter("MatAmt");
				AgentCode=request.getParameter("AgentCode");
				AgentName=request.getParameter("AgentName");
				Rank =request.getParameter("Rank");
				Introcode=request.getParameter("intrcd");
				Introrank=request.getParameter("intrornk");
				Introname=request.getParameter("intrname");
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
								calendar.add(Calendar.MONTH, +2);
								nextInstallemnt = sdf.format(calendar.getTime());
							}	
							else
							if(InstallmentMode.equals("2")) //Half Yearly
							{
								instcount=2;
								calendar.add(Calendar.MONTH, +5);
								nextInstallemnt = sdf.format(calendar.getTime());
							}
							else
							if(InstallmentMode.equals("1")) // Yearly
							{
								instcount=1;
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
				try 
				{
					pst=Conn.prepareStatement("select * from KEYDETAIL");
					rs=pst.executeQuery();
					rs.next();
					ctr1=rs.getInt(2);
					
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
				
				if(ctr1>=1 && ctr1<=9)
				{
					str="RD0000000";
				}
				if(ctr1>9 && ctr1<=99)
				{
					str="RD000000";
					
				}
				if(ctr1>99 && ctr1<=999)
				{
					str="RD00000";
				}
				System.out.println(str.concat(String.valueOf(ctr1)));
				
				
				
				try 
				{
					pst=Conn.prepareStatement("update KEYDETAIL set RDCODE=?");
					pst.setInt(1, ctr1+1);
					pst.executeUpdate();
				
					
					pst=Conn.prepareStatement("insert into account values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
					pst.setString(1,currentDate);
					pst.setString(2, MemCode);
					pst.setString(3, Memname); 
					pst.setString(4, PlanType);
					pst.setString(5, PlanCategory);
					pst.setString(6, PlanDuration);
					pst.setInt(7, Integer.parseInt(ConsidAmt));
					pst.setString(8, InstallmentMode);
					pst.setInt(9, installmentAmt);
					pst.setInt(10, Integer.parseInt(MatAmt)); 
					pst.setString(11, AgentCode);
					pst.setString(12, AgentName);
					pst.setString(13, str.concat(String.valueOf(ctr1)));
					pst.setString(14, Rank);
					pst.setString(15, Introcode);
					pst.setString(16, Introrank);
					pst.setString(17, Introname);
					pst.setString(18, maturityDate);
					int x=pst.executeUpdate();
							
						pst=Conn.prepareStatement("insert into RD_DATE values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
						pst.setString(1,str.concat(String.valueOf(ctr1)));
						pst.setString(2,currentDate);
						pst.setString(3, nextInstallemnt);
						pst.setString(4, maturityDate);
						pst.setInt(5,instcount );
						pst.setInt(6, 1);
						pst.setString(7, currentDate);
						pst.setInt(8, installmentAmt);
						pst.setInt(9, instcount-1);
						pst.setInt(10, installmentAmt);
						pst.setInt(11, Integer.parseInt(ConsidAmt)-installmentAmt);
						pst.setInt(12, Integer.parseInt(ConsidAmt));
						pst.setString(13, AgentCode );
						pst.setString(14, AgentName);
						pst.setString(15, Rank);
						pst.setString(16, Introcode);
						pst.setString(17, Introrank);
						pst.setString(18, Introname);
						
						pst.executeUpdate();
					
					if(x>0)
					{
						out.print("Successfully Inserted :-"+str.concat(String.valueOf(ctr1)));
						RequestDispatcher rd=request.getRequestDispatcher("RdAccount.jsp");
						rd.include(request, response);
					}
					else
					{
						RequestDispatcher rd=request.getRequestDispatcher("RegistrationType.jsp");
						rd.forward(request, response);
					}
					
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
			else
			if(PlanType.equals("FD"))
			{
				
				int ctr;
				MatAmt=request.getParameter("MatAmt");
				AgentCode=request.getParameter("AgentCode");
				AgentName=request.getParameter("AgentName");
				Rank =request.getParameter("Rank");
				Introcode=request.getParameter("intrcd");
				Introrank=request.getParameter("intrornk");
				Introname=request.getParameter("intrname");
			
					try
					{
						pst=Conn.prepareStatement("select * from Keydetail");
						rs=pst.executeQuery();
						rs.next();
						ctr=rs.getInt(3);
							if(ctr>=1 && ctr<=9)
							{
								str="FD0000000";
							}
							if(ctr>9 && ctr<=99)
							{
								str="FD000000";
							}
							if(ctr>99 && ctr<=999)
							{
							str="FD00000";
							}
							if(ctr>999 && ctr<=9999)
							{
								str="FD0000";
							}
						
							pst=Conn.prepareStatement("update Keydetail set FDCode=?");
							pst.setInt(1, ctr+1);
							pst.executeUpdate();
							System.out.println("Hello Test");
							System.out.println(MemCode);
							System.out.println(Memname);
							System.out.println(PlanType);
							System.out.println(PlanCategory);
							System.out.println(PlanDuration);
							System.out.println(ConsidAmt);
							System.out.println(MatAmt);
							System.out.println(AgentCode);
							System.out.println(AgentName);
							System.out.println(currentDate);
							System.out.println(maturityDate);
							System.out.println(str.concat(String.valueOf(ctr)));
							System.out.println("Rank");
							System.out.println("Introcode");
							System.out.println("Introrank");
							System.out.println("Introname");
							double roi=10.0;
							pst=Conn.prepareStatement("insert into fdaccount values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
							pst.setString(1, MemCode);
							pst.setString(2, Memname);
							pst.setString(3, PlanType);
							pst.setString(4, PlanCategory);
							pst.setString(5, PlanDuration);
							pst.setInt(6, Integer.parseInt(ConsidAmt));
							pst.setInt(7,Integer.parseInt(MatAmt));
							pst.setString(8, AgentCode);
							pst.setString(9, AgentName);
							pst.setString(10, str.concat(String.valueOf(ctr)));
							pst.setString(11, currentDate);
							pst.setString(12, maturityDate);
							pst.setDouble(13, roi);
							pst.setString(14, Rank);
							pst.setString(15, Introcode);
							pst.setString(16, Introrank);
							pst.setString(17, Introname);
														
							int x=pst.executeUpdate();
							
						/*pst=Conn.prepareStatement("insert into RD_DATE values(?,?,?,?)");
						pst.setString(1,str.concat(String.valueOf(ctr1)));
						pst.setString(2,currentDate);
						pst.setString(3,"Not Required");
						pst.setString(4, maturityDate);
						pst.executeUpdate();*/
						
							
						
							/*int r1,r2,r3,r4,r5;
							String code1,code2,code3,code4,code5,rm,icode;
							r1=r2=r3=r4=r5=0;
							code1=code2=code3=code4=code5=icode=rm=null;	
							
						
							pst=Conn.prepareStatement("select AGENTCODE,RANK,INTROCODE,INTRONAME,INTRORANK from agentmaster where AGENTCODE=?");
							pst.setString(1,AgentCode);
							ResultSet rs1=pst.executeQuery();
							
							if(rs1.next())
							{
								r1=Integer.parseInt(rs1.getString("RANK"));
								code1=rs1.getString("AGENTCODE");
								icode=rs1.getString("INTROCODE");

								if(Integer.parseInt(rs1.getString("RANK"))<Integer.parseInt(rs1.getString("INTRORANK")))
								{
									pst=Conn.prepareStatement("select AGENTCODE,RANK,INTROCODE,INTRONAME,INTRORANK from agentmaster where AGENTCODE =?");
									pst.setString(1, icode);
									ResultSet rs2=pst.executeQuery();
									if(rs2.next())
									{
										r2=Integer.parseInt(rs2.getString("RANK"));
										code2=rs2.getString("AGENTCODE");
										icode=rs2.getString("INTROCODE");
										if(Integer.parseInt(rs2.getString("RANK"))<Integer.parseInt(rs2.getString("INTRORANK")))
										{
											pst=Conn.prepareStatement("select AGENTCODE,RANK,INTROCODE,INTRONAME,INTRORANK from agentmaster where AGENTCODE =?");
											pst.setString(1, icode);
											ResultSet rs3=pst.executeQuery();
											if(rs3.next())
											{
												r3=Integer.parseInt(rs3.getString("RANK"));
												code3=rs3.getString("AGENTCODE");
												icode=rs3.getString("INTROCODE");
												
												if(Integer.parseInt(rs3.getString("RANK"))<Integer.parseInt(rs3.getString("INTRORANK")))
												{
													pst=Conn.prepareStatement("select AGENTCODE,RANK,INTROCODE,INTRONAME,INTRORANK from agentmaster where AGENTCODE =?");
													pst.setString(1, icode);
													ResultSet rs4=pst.executeQuery();
													if(rs4.next())
													{
														r4=Integer.parseInt(rs4.getString("RANK"));
														code4=rs4.getString("AGENTCODE");
														icode=rs4.getString("INTROCODE");
														if(Integer.parseInt(rs4.getString("RANK"))<Integer.parseInt(rs4.getString("INTRORANK")))
														{
															pst=Conn.prepareStatement("select AGENTCODE,RANK,INTROCODE,INTRONAME,INTRORANK from agentmaster where AGENTCODE =?");
															pst.setString(1, icode);
															ResultSet rs5=pst.executeQuery();
															if(rs5.next())
															{
																r5=Integer.parseInt(rs5.getString("RANK"));
																code5=rs5.getString("AGENTCODE");
																
															
																
															}
														}
														
													
														
													}
												}
												
											
												
											}
										}
										else
										rm="Not";
									
										
									}
									
								}
							}
						    
							pst=Conn.prepareStatement("insert into rank values(?,?,?,?,?,?,?,?,?)");
							
							if(r1==1)
								pst.setString(1,code1);
								
							else
							if(r2==1)
								pst.setString(1,code2);
							else
							if(r3==1)
								pst.setString(1,code3);
							else
							if(r4==1)
								pst.setString(1,code4);
							else
							if(r5==1)
								pst.setString(1,code5);
							else
								pst.setString(1,null);	
							
							
							
							
							if(r1==2)
								pst.setString(2,code1);
							else
							if(r2==2)
								pst.setString(2,code2);
							else
							if(r3==2)
								pst.setString(2,code3);
							else
							if(r4==2)
								pst.setString(2,code4);
							else
							if(r5==2)
								pst.setString(2,code5);
							else
								pst.setString(2,null);	
							
							
							
							if(r1==3)
								pst.setString(3,code1);
							else
							if(r2==3)
								pst.setString(3,code2);
							else
							if(r3==3)
								pst.setString(3,code3);
							else
							if(r4==3)
								pst.setString(3,code4);
							else
							if(r5==3)
								pst.setString(3,code5);
							else
								pst.setString(3,null);	
							
						
						
							if(r1==4)
								pst.setString(4,code1);
							else
							if(r2==4)
								pst.setString(4,code2);
							else
							if(r3==4)
								pst.setString(4,code3);
							else
							if(r4==4)
								pst.setString(4,code4);
							else
							if(r5==4)
								pst.setString(4,code5);
							else
								pst.setString(4,null);	
						
						
						
							if(r1==5)
								pst.setString(5,code1);
							else
							if(r2==5)
								pst.setString(5,code2);
							else
							if(r3==5)
								pst.setString(5,code3);
							else
							if(r4==5)
								pst.setString(5,code4);
							else
							if(r5==5)
								pst.setString(5,code5);
							else
								pst.setString(5,null);	
							
							pst.setInt(6,Integer.parseInt(ConsidAmt));
							pst.setInt(7,Integer.parseInt(PlanDuration));
							pst.setString(8,str.concat(String.valueOf(ctr)));
							pst.setString(9,AgentCode);
							pst.executeUpdate();
						
						
							System.out.println("Rank::"+r1);
							System.out.println("Code::"+code1);
							
							
							System.out.println("Rank::"+r2);
							System.out.println("Code::"+code2);
								
							System.out.println("Rank::"+r3);
							System.out.println("Code::"+code3);
							
							System.out.println("Rank::"+r4);
							System.out.println("Code::"+code4);
							
							System.out.println("Rank::"+r5);
							System.out.println("Code::"+code5);
							System.out.println(rm);
						*/	
						
						
						if(x>0)
						{
							out.print("Successfully Inserted :-  "+str.concat(String.valueOf(ctr)));
							RequestDispatcher rd=request.getRequestDispatcher("RdAccount.jsp");
							rd.include(request, response);
						}
						else
						{
							RequestDispatcher rd=request.getRequestDispatcher("RegistrationType.jsp");
							rd.forward(request, response);
						}
						
						
				}
				catch (SQLException e)
				{
				out.println(e);
				}
			}
	}
}