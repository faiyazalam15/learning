import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AgentUpdate")//sql open kijiye
public class AgentUpdate extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			
			String memcd=request.getParameter("MemCode");
			String memnm=request.getParameter("MemName");
			String rnk=request.getParameter("Rank");
			String Regdtd=request.getParameter("Regndate");
			String introcd=request.getParameter("IntroCode");
			String intronm=request.getParameter("IntroName");
			String intrornk=request.getParameter("IntroRank");
			String Agfee=request.getParameter("Agencyfee");
			String Agcd=request.getParameter("AgentCode");
			System.out.println(memcd);
			System.out.println(memnm);
			
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
				PreparedStatement pst=con.prepareStatement("update agentmaster set Rank=?,Regndate=?,Introcode=?,Introname=?,Introrank=?,Agencyfee=? where Agentcode='"+Agcd+"'");
				
				//open 
				pst.setString(1, rnk);
				pst.setString(2, Regdtd);
				pst.setString(3, introcd);
				pst.setString(4, intronm);
				pst.setInt(5, Integer.parseInt(intrornk));
				pst.setInt(6, Integer.parseInt(Agfee));
				
				int x=pst.executeUpdate();
				
				if(x>0)
				{
				
					out.print("Record Successfully Update");
					//RequestDispatcher rd=request.getRequestDispatcher("AgentUpdate.jsp");
					//rd.include(request, response);
					
					
				}
				else
				{
				
					//RequestDispatcher rd=request.getRequestDispatcher("AgentUpdate.jsp");
					//rd.include(request, response);
					out.print("Record Not Update" );
							
				}
				
			}
			catch( ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();
				
			}
	}

}


