import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/AgentCommissionMaster")
public class AgentCommissionMaster extends HttpServlet
{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int sno1,sno2,sno3,sno4,sno5;
		String rank,ptype,pcat,pduration,com_year_from,com_year_to,nrm_spcl,rank1,rank2,rank3,rank4,rank5;
		double Commission1,Commission2,Commission3,Commission4,Commission5,wet;
		
		
		ptype=request.getParameter("plantype"); 
		nrm_spcl=request.getParameter("nrm_spcl");
		pduration=request.getParameter("Duration");
		com_year_from=request.getParameter("com_year_from");
		com_year_to=request.getParameter("com_year_to");
		
		sno1=Integer.parseInt(request.getParameter("Sno1"));
		rank1=request.getParameter("Rank1");
		Commission1=Double.parseDouble(request.getParameter("Commission1"));
		wet=Double.parseDouble(request.getParameter("wght1"));
		
		sno2=Integer.parseInt(request.getParameter("Sno2"));
		rank2=request.getParameter("Rank2");
		Commission2=Double.parseDouble(request.getParameter("Commission2"));
		wet=Double.parseDouble(request.getParameter("wght2"));

		
		sno3=Integer.parseInt(request.getParameter("Sno3"));
		rank3=request.getParameter("Rank3");
		Commission3=Double.parseDouble(request.getParameter("Commission3"));
		wet=Double.parseDouble(request.getParameter("wght3"));

		
		sno4=Integer.parseInt(request.getParameter("Sno4"));
		rank4=request.getParameter("Rank4");
		Commission4=Double.parseDouble(request.getParameter("Commission4"));
		wet=Double.parseDouble(request.getParameter("wght4"));

		sno5=Integer.parseInt(request.getParameter("Sno5"));
		rank5=request.getParameter("Rank5");
		Commission5=Double.parseDouble(request.getParameter("Commission5"));
		wet=Double.parseDouble(request.getParameter("wght5"));

		try
		{
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
			
			PreparedStatement pst=con.prepareStatement("insert into AgentCommissionMasters values(?,?,?,?,?,?,?,?,?)");
			pst.setString(1, ptype);
			pst.setString(2, nrm_spcl);
			pst.setString(3, pduration);
			pst.setString(4, com_year_from);
			pst.setString(5, com_year_to);
			pst.setInt(6, sno1);
			pst.setString(7, rank1);
			pst.setDouble(8, Commission1);
			pst.setDouble(9, wet);
			
			/*pst.executeUpdate();*/
			
			PreparedStatement pst1=con.prepareStatement("insert into AgentCommissionMasters values(?,?,?,?,?,?,?,?,?)");
			pst1.setString(1, ptype);
			pst1.setString(2, nrm_spcl);
			pst1.setString(3, pduration);
			pst1.setString(4, com_year_from);
			pst1.setString(5, com_year_to);
			pst1.setInt(6,sno2);
			pst1.setString(7, rank2);
			pst1.setDouble(8, Commission2);
			pst1.setDouble(9, wet);
			pst1.executeUpdate();
			
			PreparedStatement pst2=con.prepareStatement("insert into AgentCommissionMasters values(?,?,?,?,?,?,?,?,?)");
			pst2.setString(1, ptype);
			pst2.setString(2, nrm_spcl);
			pst2.setString(3, pduration);
			pst2.setString(4, com_year_from);
			pst2.setString(5, com_year_to);
			pst2.setInt(6, sno3);
			pst2.setString(7, rank3);
			pst2.setDouble(8, Commission3);
			pst2.setDouble(9, wet);
			pst2.executeUpdate();
			
			PreparedStatement pst3=con.prepareStatement("insert into AgentCommissionMasters values(?,?,?,?,?,?,?,?,?)");
			pst3.setString(1, ptype);
			pst3.setString(2, nrm_spcl);
			pst3.setString(3, pduration);
			pst3.setString(4, com_year_from);
			pst3.setString(5, com_year_to);
			pst3.setInt(6, sno4);
			pst3.setString(7, rank4);
			pst3.setDouble(8, Commission4);
			pst3.setDouble(9, wet);
			pst3.executeUpdate();
			
			PreparedStatement pst4=con.prepareStatement("insert into AgentCommissionMasters values(?,?,?,?,?,?,?,?,?)");
			pst4.setString(1, ptype);
			pst4.setString(2, nrm_spcl);
			pst4.setString(3, pduration);
			pst4.setString(4, com_year_from);
			pst4.setString(5, com_year_to);
			pst4.setInt(6, sno5);
			pst4.setString(7, rank5);
			pst4.setDouble(8, Commission5);
			pst4.setDouble(9, wet);
			pst4.executeUpdate();
			
			PreparedStatement pst5=con.prepareStatement("insert into AgentCommissionMasters values(?,?,?,?,?,?,?,?,?)");
			pst5.setString(1, ptype);
			pst5.setString(2, nrm_spcl);
			pst5.setString(3, pduration);
			pst5.setString(4, com_year_from);
			pst5.setString(5, com_year_to);
			pst5.setInt(6, sno5);
			pst5.setString(7, rank5);
			pst5.setDouble(8, Commission5);
			pst5.setDouble(9, wet);
			pst.executeUpdate();
			
			PreparedStatement pst6=con.prepareStatement("insert into AgentCommissionMasters values(?,?,?,?,?,?,?,?,?)");
			pst6.setString(1, ptype);
			pst6.setString(2, nrm_spcl);
			pst6.setString(3, pduration);
			pst6.setString(4, com_year_from);
			pst6.setString(5, com_year_to);
			pst6.setInt(6, sno5);
			pst6.setString(7, rank5);
			pst6.setDouble(8, Commission5);
			pst6.setDouble(9, wet);
			pst6.executeUpdate();
			
			PreparedStatement pst7=con.prepareStatement("insert into AgentCommissionMasters values(?,?,?,?,?,?,?,?,?)");
			pst7.setString(1, ptype);
			pst7.setString(2, nrm_spcl);
			pst7.setString(3, pduration);
			pst7.setString(4, com_year_from);
			pst7.setString(5, com_year_to);
			pst7.setInt(6, sno5);
			pst7.setString(7, rank5);
			pst7.setDouble(8, Commission5);
			pst7.setDouble(9, wet);
			pst7.executeUpdate();
			
			PreparedStatement pst8=con.prepareStatement("insert into AgentCommissionMasters values(?,?,?,?,?,?,?,?,?)");
			pst8.setString(1, ptype);
			pst8.setString(2, nrm_spcl);
			pst8.setString(3, pduration);
			pst8.setString(4, com_year_from);
			pst8.setString(5, com_year_to);
			pst8.setInt(6, sno5);
			pst8.setString(7, rank5);
			pst8.setDouble(8, Commission5);
			pst8.setDouble(9, wet);
			pst8.executeUpdate();
			
			PreparedStatement pst9=con.prepareStatement("insert into AgentCommissionMasters values(?,?,?,?,?,?,?,?,?)");
			pst9.setString(1, ptype);
			pst9.setString(2, nrm_spcl);
			pst9.setString(3, pduration);
			pst9.setString(4, com_year_from);
			pst9.setString(5, com_year_to);
			pst9.setInt(6, sno5);
			pst9.setString(7, rank5);
			pst9.setDouble(8, Commission5);
			pst9.setDouble(9, wet);
			pst9.executeUpdate();
		
			PreparedStatement pst10=con.prepareStatement("insert into AgentCommissionMasters values(?,?,?,?,?,?,?,?,?)");
			pst10.setString(1, ptype);
			pst10.setString(2, nrm_spcl);
			pst10.setString(3, pduration);
			pst10.setString(4, com_year_from);
			pst10.setString(5, com_year_to);
			pst10.setInt(6, sno5);
			pst10.setString(7, rank5);
			pst10.setDouble(8, Commission5);
			pst10.setDouble(9, wet);
			pst10.executeUpdate();
			
			PreparedStatement pst11=con.prepareStatement("insert into AgentCommissionMasters values(?,?,?,?,?,?,?,?,?)");
			pst11.setString(1, ptype);
			pst11.setString(2, nrm_spcl);
			pst11.setString(3, pduration);
			pst11.setString(4, com_year_from);
			pst11.setString(5, com_year_to);
			pst11.setInt(6, sno5);
			pst11.setString(7, rank5);
			pst11.setDouble(8, Commission5);
			pst11.setDouble(9, wet);
			pst11.executeUpdate();
			
			int x=pst.executeUpdate();
			
			
			if(x>0)
			{
				out.println("Record Succesfully inserted");
				RequestDispatcher rd=request.getRequestDispatcher("AgentMaster.jsp");
				rd.include(request, response);
			}
			else
			{
				out.println("Record no inserted");
				RequestDispatcher rd=request.getRequestDispatcher("AgentMaster.jsp");
				rd.include(request, response);
			}
			
		}
		catch(ClassNotFoundException |SQLException e)
		{
			e.printStackTrace();
		}
			
		
	}

	
	
}
 