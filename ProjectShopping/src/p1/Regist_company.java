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
@WebServlet("/Regist_company")
@MultipartConfig(maxFileSize = 16177215)
public class Regist_company extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		out.print("<html>" +
				"<head>" +
				"<style type='text/css'>.bord{border: thin;border-bottom-color: aqua;position:absolute;right:350px;top:450px;font-family: sans-serif;color:yellow;}</style>" +
				"</head>" +
				"<body>");
		String c_name=request.getParameter("c_name");
		String f_name=request.getParameter("f_name");
		String l_name=request.getParameter("l_name");
		String email=request.getParameter("email");
		String s_email=request.getParameter("s_email");
		String addrs=request.getParameter("addrs");
		String country=request.getParameter("country");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String pcode=request.getParameter("pcode");
		String phone=request.getParameter("phone");
		String mob=request.getParameter("mob");
		InputStream inputStream =null;
		Part filePart = request.getPart("photo");
		if(filePart !=null)
		 {
				inputStream = filePart.getInputStream();	
		 }
		try
		{
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement pst=null;
			pst=con.prepareStatement("insert into approval values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1,c_name);
			pst.setString(4,email);
			pst.setString(5,s_email);
			pst.setString(6,addrs);
			pst.setString(13,city);
			pst.setString(7,state);
			pst.setString(8,country);
			pst.setString(9,pcode);
			pst.setString(10,phone);
			pst.setString(11,mob);
			pst.setString(2,f_name);
			pst.setString(3,l_name);
			if(inputStream !=null)
			{
			            pst.setBinaryStream(12,inputStream,inputStream.available());
			}
			int i=pst.executeUpdate();
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("Main.jsp");
				rd.include(request,response);
				out.print("<div class='bord'><h2>Your Request is sent to Admin <br/>You Receive an email if admin approved your application</h3></div>");
				
			}
		}
		catch( SQLException e)
		{
			out.print(e);
		}
	}

}
