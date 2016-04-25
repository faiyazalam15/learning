package p1;
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
@WebServlet("/Regist_emp")
public class Regist_emp extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		String emp_no=request.getParameter("emp_no");
		String e_name=request.getParameter("e_name");
		String email=request.getParameter("email");
		String addrs=request.getParameter("addrs");
		String country=request.getParameter("country");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String pcode=request.getParameter("pcode");
		String phone=request.getParameter("phone");
		String mob=request.getParameter("mob");
		String pswd=request.getParameter("pswd");
		try
		{
			Connection con=ConnectionProvider.getConnection();
			PreparedStatement pst=con.prepareStatement("insert into empl values(?,?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1,emp_no);
			pst.setString(2,e_name);
			pst.setString(3,email);
			pst.setString(4,addrs);
			pst.setString(5,country);
			pst.setString(6,state);
			pst.setString(7,city);
			pst.setString(8,pcode);
			pst.setString(9,phone);
			pst.setString(10,mob);
			pst.setString(11,pswd);
			int i=pst.executeUpdate();
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
				rd.forward(request,response);
			}
		}
		catch(SQLException e)
		{
			out.print(e);
		}
	}

}
