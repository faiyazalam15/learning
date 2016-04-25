

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/FdAccount")
public class FdAccount extends HttpServlet 
{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String str="";
		int ctr;
		ResultSet rs;
		
		String MemCode=request.getParameter("MemCode");
		String Memname=request.getParameter("Mmname");
		String PlanType=request.getParameter("PlanType");
		String PlanCategory=request.getParameter("PlanCategory");
		String PlanDuration=request.getParameter("PlanDuration");
		String ConsidAmt=request.getParameter("ConsidAmt");
		String MatAmt=request.getParameter("MatAmt");
		String AgentCode=request.getParameter("AgentCode");
		String AgentName=request.getParameter("AgentName");
		String FdNo=request.getParameter("FdNo");
		
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection Conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
				PreparedStatement pst=null;
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
				
				
				pst=Conn.prepareStatement("insert into fdaccount values(?,?,?,?,?,?,?,?,?,?)");
				pst.setString(1, MemCode);
				pst.setString(2, Memname);
				pst.setString(3, PlanType);
				pst.setString(4, PlanCategory);
				pst.setString(5, PlanDuration);
				pst.setString(6, ConsidAmt);
				pst.setString(7, MatAmt);
				pst.setString(8, AgentCode);
				pst.setString(9, AgentName);
				pst.setString(10, str.concat(String.valueOf(ctr)));
				int x=pst.executeUpdate();
				
				
				
				
				
				
				
				int r1,r2,r3,r4,r5;
				String code1,code2,code3,code4,code5,rm,icode;
				r1=r2=r3=r4=r5=0;
				code1=code2=code3=code4=code5=icode=rm=null;	
				
				
					pst=Conn.prepareStatement("select AGENTCODE,RANK,INTROCODE,INTRONAME,INTRORANK from agentmaster where AGENTCODE=?");
					pst.setString(1,str.concat(String.valueOf(ctr)));
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
				
					pst=Conn.prepareStatement("insert into rank values(?,?,?,?,?)");
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
				
				
				
				
				
				
				
				
				
				
				
				if(x>0)
				{
					out.print("Successfully Inserted");
					RequestDispatcher rd=request.getRequestDispatcher("FdAccount.jsp");
					rd.include(request, response);
					
						
				}//close
				else
				{
					RequestDispatcher rd=request.getRequestDispatcher("RegistrationType.jsp");
					rd.forward(request, response);
				}
				
				
			}
			catch (ClassNotFoundException | SQLException e)
			{
				out.println(e);
			}
		
		
		
		
	}


}
