

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




@WebServlet("/RegnForm")
public class RegnForm extends HttpServlet
{
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out= response.getWriter();
		String name=request.getParameter("usernm");
		String db=request.getParameter("dob");
		String mob=request.getParameter("mobno");
		String password=request.getParameter("pass");
		String password1=request.getParameter("pass1");
	
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
			
			PreparedStatement pst=null;
			
			String sql="insert into RegnForm values(?,?,?,?,?)";
			pst=con.prepareStatement(sql);
			
			pst.setString(1, name);
			pst.setString(2, db);
			pst.setString(3, mob);
			pst.setString(4, password);
			pst.setString(5, password1);
			
			
			int x=pst.executeUpdate();
			if(x>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("LoginForm.jsp");
						rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("RegnForm.jsp");
				rd.forward(request, response);
			}
		}
		catch(ClassNotFoundException | SQLException e)
		{
			out.println(e);
		}
		
	}
	 
	
	

}
