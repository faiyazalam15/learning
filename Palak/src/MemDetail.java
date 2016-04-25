import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/MemDetail")
public class MemDetail extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		String str="";
		int ctr;
		ResultSet rs;
		PrintWriter out=response.getWriter();
		
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
		String memmobno=request.getParameter("MemMobno");
		String mememailid=request.getParameter("MemEmailid");
		String mempanno=request.getParameter("MemPanno");
		String memresiproof=request.getParameter("MemResiProof");
		String memidproof=request.getParameter("MemIdProof");
		String memnomname=request.getParameter("MemNomname");
		String memnomfname=request.getParameter("MemNomfname");
		String memnomage=request.getParameter("MemNomage");
		String memnomrelation=request.getParameter("MemNomrelation"); 
		
		
		Calendar calendar = new GregorianCalendar();
	    SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
	    String currentDate = sdf.format(calendar.getTime());		
	
		
		 /* HttpSession session=request.getSession();  
	      session.setAttribute("uname",nm);
		*/
			try
			{
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
				PreparedStatement pst =null;
				
				pst=conn.prepareStatement("select * from KEYDETAIL");
				rs=pst.executeQuery();
				rs.next();
				ctr=rs.getInt(1);
				if(ctr>=1&&ctr<=9)
					str="M00000000";
				else
				if(ctr>9&&ctr<=99)
					str="M0000000";
				else
					if(ctr>99&&ctr<=999)
						str="M000000";
					else
						if(ctr>999&&ctr<=9999)
							str="M000000";
				pst=conn.prepareStatement("update KEYDETAIL set memcode=?");
				pst.setInt(1,ctr+1);
				pst.executeUpdate();
				pst.close();
				
				pst=conn.prepareStatement("insert into MEMDETAIL values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				pst.setString(1, currentDate);
				pst.setString(2 ,str.concat(String.valueOf(ctr))); 
				pst.setString(3 ,nm); 
				pst.setString(4, fnm);
				pst.setString(5, mothernm);
				pst.setString(6, gender);
				pst.setString(7, maritalstatus);
				pst.setString(8, memaddr);
				pst.setString(9, memcity);
				pst.setString(10, memstate);
				pst.setString(11, memcountry);
				pst.setString(12, mempinno);
				pst.setString(13, memage);
				pst.setString(14, memtelno);
				pst.setString(15, memmobno);
				pst.setString(16, mememailid);
				pst.setString(17, mempanno);
				pst.setString(18, memresiproof);
				pst.setString(19, memidproof);
				pst.setString(20, memnomname);
				pst.setString(21, memnomfname);
				pst.setString(22, memnomage);
				pst.setString(23, memnomrelation);
				int x=pst.executeUpdate();
				pst.close();
				
				if (x>0)
				{
					
					out.println(" Record Success inserted(Membership No.  : "+str.concat(String.valueOf(ctr)));
					out.print("    Name of Customer    :"+nm);
					RequestDispatcher rd=request.getRequestDispatcher("MemDetail.jsp");
					rd.include(request,response);
					
				}
				else
				{
					RequestDispatcher rd=request.getRequestDispatcher("RegistrationType.jsp");
					rd.forward(request, response);
					
				}
				
			}
			catch(ClassNotFoundException |SQLException  e)
			{
				out.println(e);
				e.printStackTrace();
			}
		
	}

	
}
