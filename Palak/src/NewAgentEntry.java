

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
import javax.servlet.http.HttpSession;
@WebServlet("/NewAgentEntry")
public class NewAgentEntry extends HttpServlet
{	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String MCode=request.getParameter("MemCode");
		String Mmname=request.getParameter("MemName");
		String agentCode=request.getParameter("AgentCode");
		String Rank=request.getParameter("Rank");
		//String Regndtd=request.getParameter("Regndate");
		String introCode=request.getParameter("IntroCode");
		String introName=request.getParameter("IntroName");
		String introRank=request.getParameter("IntroRank");
		String AgFee=request.getParameter("Agencyfee");
		
		Calendar calendar = new GregorianCalendar();
	    SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
	    String currentDate = sdf.format(calendar.getTime());		
		
		
		String str="";
		int ctr;
		ResultSet rs;
		
		HttpSession session =request.getSession();
		session.setAttribute("uname", MCode);
		
		
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection Conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
				PreparedStatement pst=null;
				
				pst=Conn.prepareStatement("select * from Keydetail");
				rs=pst.executeQuery();
				rs.next();
				ctr=rs.getInt(4);
				
				if(ctr>=1 && ctr<=9)
				{
					str="N00000000";
				}
				if(ctr>9 && ctr<=99)
				{
					str="N0000000";
					
				}
				if(ctr>99 && ctr<=999)
				{
					str="N000000";
				}
				
				pst=Conn.prepareStatement("update Keydetail set AGENTCODE=?");
				pst.setInt(1, ctr+1);
				pst.executeUpdate();
				
				
				String sql="insert into Agentmaster values(?,?,?,?,?,?,?,?,?)";
				pst=Conn.prepareStatement(sql);
				
				
				pst.setString(1, MCode);
				pst.setString(2, Mmname);
				pst.setString(3 ,str.concat(String.valueOf(ctr)));
				pst.setString(4, Rank);
				pst.setString(5, currentDate);
				pst.setString(6, introCode);
				pst.setString(7, introName);
				pst.setString(8, introRank);
				pst.setString(9, AgFee);
				
				int x=pst.executeUpdate();
				
				if(x>0)
				{
					out.print("Record Successfully inserted");
					RequestDispatcher rd= request.getRequestDispatcher("Enter_AgentID.jsp");
					rd.include(request, response);
					
				}
				else
				{
					out.print("Record not inserted ");
					RequestDispatcher rd=request.getRequestDispatcher("Enter_AgentID.jsp");
					rd.include(request, response);
				}
				
			}
			catch (ClassNotFoundException | SQLException e)
			{
				 out.println(e);
			}
	

		
		
	}

	
}
