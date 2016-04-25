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
@WebServlet("/Regist_user")
public class Regist_user extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		String f_name=request.getParameter("f_name");
		String l_name=request.getParameter("l_name");
		String email=request.getParameter("email");
		String addrs=request.getParameter("addrs");
		String country=request.getParameter("country");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String pcode=request.getParameter("pcode");
		String phone=request.getParameter("phone");
		String mob=request.getParameter("mob");
		String uname=request.getParameter("uname");
		String pswd=request.getParameter("pswd");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shopping","shopping");
			PreparedStatement pst=con.prepareStatement("insert into buyer values(?,?,?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1,f_name);
			pst.setString(2,l_name);
			pst.setString(3,email);
			pst.setString(4,addrs);
			pst.setString(5,city);
			pst.setString(6,state);
			pst.setString(7,country);
			pst.setString(8,pcode);
			pst.setString(9,phone);
			pst.setString(10,mob);
			pst.setString(11,uname);
			pst.setString(12,pswd);
			int i=pst.executeUpdate();
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
				rd.forward(request,response);
			}
		}
		catch(ClassNotFoundException | SQLException e)
		{
			out.print(e);
		}
	}

}
