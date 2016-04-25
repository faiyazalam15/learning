

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/NewPlanEntry")
public class NewPlanEntry extends HttpServlet
{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String plantype=request.getParameter("PlanType");
		String plancategory=request.getParameter("PlanCategory");
		String planduration=request.getParameter("PlanDuration");
		String considamt=request.getParameter("ConsidAmt");
		String monthlyamt=request.getParameter("MonthAmt");
		String qtrlyamt=request.getParameter("QtrlyAmt");
		String hyrlyamt=request.getParameter("HyrlyAmt");
		String yrlyamt=request.getParameter("YrlyAmt");
		String matamt=request.getParameter("MatAmt");
		String quotapercent=request.getParameter("QuotaPercent");
		String interestpercent=request.getParameter("InterestPercent");
		
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
				PreparedStatement pst= null;
				
				String sql="insert into Plan values (?,?,?,?,?,?,?,?,?,?,?)";
				pst=con.prepareStatement(sql);
				
				pst.setString(1, plantype);
				pst.setString(2, plancategory);
				pst.setDouble(3, Double.parseDouble(planduration));
				pst.setDouble(4, Double.parseDouble(considamt));
				pst.setDouble(5, Double.parseDouble(monthlyamt));
				pst.setDouble(6, Double.parseDouble(qtrlyamt));
				pst.setDouble(7,  Double.parseDouble(hyrlyamt));
				pst.setDouble(8, Double.parseDouble(yrlyamt));
				pst.setDouble(9, Double.parseDouble(matamt));
				pst.setDouble(10,Double.parseDouble(quotapercent));
				pst.setDouble(11,Double.parseDouble(interestpercent));
				int x=pst.executeUpdate();
				
				if(x>0)
				{
					out.print("<script>alert('Success')</script>");
					RequestDispatcher rs=request.getRequestDispatcher("NewPlanEntry.jsp");
					 rs.forward(request, response);
					 
				}
			
				
			}
			catch(Exception e)
			{
				out.println(e);
			}
		
	}

		
}
