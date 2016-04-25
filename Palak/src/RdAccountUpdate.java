

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/RdAccountUpdate")
public class RdAccountUpdate extends HttpServlet 
{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String memnm,rdno,plantype,plancategory,planduration,instalmentmode,agentcode,agentname;
		String considamt,matamt,instalmentamt;
		
		memnm=request.getParameter("Memname");
		plantype=request.getParameter("PlanType");
		plancategory=request.getParameter("PlanCategory");
		planduration=request.getParameter("PlanDuration");
		considamt=request.getParameter("ConsidAmt");
		instalmentmode=request.getParameter("InstallmentMode");
		instalmentamt=request.getParameter("InstallmentAmt");
		matamt=request.getParameter("MatAmt");
		agentcode=request.getParameter("AgentCode");
		agentname=request.getParameter("AgentName");
		rdno=request.getParameter("RdNo");
		
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection Con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
			
			/*PreparedStatement pst=null;
			String sql="update account set PlanType='"+plantype+"',plancategory='"+plancategory+"',planduration='"+planduration+"',ConsidAmt='"+considamt+"',Installmentmode='"+instalmentmode+"',Installmentamt='"+instalmentamt+"',MatAmt='"+matamt+"',AgentCode='"+agentcode+"',AgentName='"+agentname+"' where RdNo=?";
			
			pst=Con.prepareStatement(sql);*/
			
			PreparedStatement pst=Con.prepareStatement("update account set  Mmname=?,PlanType=?,PlanCategory=?,planduration=?,ConsidAmt=?,InstallmentMode=?,InstallmentAmt=?,MatAmt=?,AgentCode=?,AgentName=? where RdNo=?");
			
			pst.setString(1, memnm);
			pst.setString(2, plantype);
			pst.setString(3, plancategory);
			pst.setString(4, planduration);
			pst.setString(5, considamt);
			pst.setString(6, instalmentmode);
			pst.setString(7, instalmentamt);
			pst.setString(8, matamt);
			pst.setString(9, agentcode);
			pst.setString(10, agentname);
			pst.setString(11,rdno);

			int x =pst.executeUpdate();
			if(x>0)
			{
				out.print("Record Successfully Updated");
				RequestDispatcher rd=request.getRequestDispatcher("RdAcountUpdate.jsp");
				rd.include(request, response);
			}
			else
			{
				out.println("Record Not Update");
				RequestDispatcher rd1=request.getRequestDispatcher("NidhiFrontPage.jsp");
				rd1.forward(request, response);
			}
			
			
		}
		catch(ClassNotFoundException | SQLException e)
		{
			out.println(e);
		}
		
	}

}
