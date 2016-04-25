package p1;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@WebServlet("/AddProOffer")
@MultipartConfig(maxFileSize = 16177215)
public class AddProOffer extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		out.print("<html><head><style>.bor{	border: thin;border-bottom-color: aqua;position:absolute;right:370px;top:440px;font-family: sans-serif;color:yellow;}</style></head>");
		String pid,pname,pcat,cname,pinfo,pcost,pncost;
		pcost=request.getParameter("pcost");
		pid=request.getParameter("pid");
		pname=request.getParameter("pname");
		pcat=request.getParameter("pcat");
		cname=request.getParameter("cname");
		pinfo=request.getParameter("pinfo");
		pncost=request.getParameter("pncost");
		
		System.out.println(pcost);
		System.out.println(pid);
		System.out.println(pname);
		System.out.println(pcat);
		System.out.println(cname);
		System.out.println(pinfo);

		InputStream inputStream =null;
		Part filePart = request.getPart("photo");
		if(filePart !=null)
		 {
			 System.out.println(filePart.getName());
		     System.out.println(filePart.getSize());
		     System.out.println(filePart.getContentType());
			 inputStream = filePart.getInputStream();	
		 }


		try {
			
			Connection con=ConnectionProvider.getConnection();
			PreparedStatement pst=con.prepareStatement("insert into offers values(?,?,?,?,?,?,?,?)");
			pst.setString(1,pid);
			pst.setString(2,pinfo);
			pst.setString(3,cname);
			pst.setString(4,pname);
			if(inputStream !=null)
			{
			            pst.setBinaryStream(5,inputStream,inputStream.available());
			}
			pst.setString(6,pcat);
			pst.setString(7,pcost);
			pst.setString(8,pncost);
			int i=pst.executeUpdate();
			if(i>0)
			{
				out.print("<div class='bor'><h2>Product Added Successfully</h2></div>");
				RequestDispatcher rd=request.getRequestDispatcher("LoginAfterC.jsp");
				rd.include(request, response);
			}
			else
			{
				out.print("<div class='bor'><h2>Product Not Added Successfully</h2></div>");
				RequestDispatcher rd=request.getRequestDispatcher("AddproOff.jsp");
				rd.include(request, response);
			}
			
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

}