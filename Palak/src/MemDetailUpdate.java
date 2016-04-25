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


@WebServlet("/MemDetailUpdate")
public class MemDetailUpdate extends HttpServlet 
{
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
	
		
		String memdtd=request.getParameter("Memdate");
		String nm=request.getParameter("Memname");
		String fnm=request.getParameter("MemFname");
		String mothernm=request.getParameter("Mothername");
		String gender=request.getParameter("Gender");
		String maritalstatus=request.getParameter("MarritalStatus");
		String memaddr=request.getParameter("MemAddr");
		String memcity=request.getParameter("MemCity");
		String memstate=request.getParameter("MemState");
		String memcountry=request.getParameter("Memcountry");
		String mempinno=request.getParameter("MemPinno");
		String memage=request.getParameter("MemAge");
		String memtelno=request.getParameter("MemTelno");
		String memmobno=request.getParameter("MemMobNo");
		String mememailid=request.getParameter("MemEmailid");
		String mempanno=request.getParameter("MemPanno");
		String memresiproof=request.getParameter("MemResiProof");
		String memidproof=request.getParameter("MemIdProof");
		String memnomname=request.getParameter("MemNomname");
		String memnomfname=request.getParameter("MemNomfname");
		String memnomage=request.getParameter("MemNomage");
		String memnomrelation=request.getParameter("MemNomrelation"); 
		String memcode=request.getParameter("MemCode");
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection Con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
					 
			/*String sql= "update MEMDETAIL set Memname='"+nm+"',Memfname='"+fnm+"', Mothername='"+mothernm+"',Gender='"+gender+"',Marritalstatus='"+maritalstatus+"'," +
			" Memaddr='"+memaddr+"',MemCity='"+memcity+"',MemState='"+memstate+"',MemCountry='"+memcountry+"',MemPinno='"+mempinno+"', MemAge='"+memage+"'," +
			"MemTelno='"+memtelno+"',MemMobno='"+memmobno+"',MemEmailid='"+mememailid+"',MemPanno='"+mempanno+"',MemResiproof='"+memresiproof+"'," +
			" MemIdproof='"+memidproof+"',Memnomname='"+memnomname+"',Memnomfname='"+memnomfname+"',Memnomage='"+memnomage+"',Memnomrelation='"+memnomrelation+"'" +
			" where MemCode='"+Memcode+"'";*/
			PreparedStatement pst=Con.prepareStatement("update MEMDETAIL set MEMDATE =?, MEMNAME=?,MEMFNAME=?,MOTHERNAME=?,GENDER=?," +
					"MARRITALSTATUS=?,MEMADDR=?,MEMCITY=?,MEMSTATE=?,MEMCOUNTRY=?,MEMPINNO=?,MEMAGE=?,MEMTELNO=?,MEMMOBNO=?,MEMEMAILID=?," +
					"MEMPANNO=?,MEMRESIPROOF=?,MEMIDPROOF=?,MEMNOMNAME=?,MEMNOMFNAME=?,MEMNOMAGE=?,MEMNOMRELATION=? where MemCode='"+memcode+"'");
				
			
			pst.setString(1, memdtd);
			pst.setString(2,nm);
			pst.setString(3,fnm);
			pst.setString(4,mothernm);
			pst.setString(5, gender);
			pst.setString(6, maritalstatus);
			pst.setString(7, memaddr);
			pst.setString(8, memcity);
			pst.setString(9, memstate);
			pst.setString(10,memcountry);
			pst.setString(11,mempinno);
			pst.setString(12,memage);
			pst.setString(13,memtelno );
			pst.setString(14,memmobno);
			pst.setString(15,mememailid);
			pst.setString(16,mempanno );
			pst.setString(17,memresiproof );
			pst.setString(18,memidproof );
			pst.setString(19,memnomname );
			pst.setString(20,memnomfname );
			pst.setString(21,memnomage );
			pst.setString(22,memnomrelation );
			/*pst.setString(23, memcode);*/
			
			int x =pst.executeUpdate();
																		
			/*PreparedStatement pst=Con.prepareStatement("update MEMDETAIL set MEMDATE =?, MEMNAME=?,MEMFNAME=?,MOTHERNAME=?,GENDER=?," +
			"MARRITALSTATUS=?,MEMADDR=?,MEMCITY=?,MEMSTATE=?,MEMCOUNTRY=?,MEMPINNO=?,MEMAGE=?,MEMTELNO=?,MEMMOBNO=?,MEMEMAILID=?," +
			"MEMPANNO=?,MEMRESIPROOF=?,MEMIDPROOF=?,MEMNOMNAME=?,MEMNOMFNAME=?,MEMNOMAGE=?,MEMNOMRELATION=? where MemCode='"+memcode+"'");*/
			
			/*PreparedStatement pst=Con.prepareStatement("update memdetail set MEMDATE =?, MEMNAME=?,MEMFNAME=?,MOTHERNAME=?,GENDER=?," +
			"MARRITALSTATUS=?,MEMADDR=?,MEMCITY=?,MEMSTATE=?,MEMCOUNTRY=?,MEMPINNO=?,MEMAGE=?,MEMTELNO=?,MEMMOBNO=?,MEMEMAILID=?," +
			"MEMPANNO=?,MEMRESIPROOF=?,MEMIDPROOF=?,MEMNOMNAME=?,MEMNOMFNAME=?,MEMNOMAGE=?,MEMNOMRELATION=? where MemCode=?");*/
			
			
			if(x>0)
			{
				out.print("Record Successfully Updated");
				RequestDispatcher rd=request.getRequestDispatcher("Memcode.jsp");
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
