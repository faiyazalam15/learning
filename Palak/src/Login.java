
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet
{

   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   	{
   		{
   			PrintWriter out=response.getWriter();
   			String uname=request.getParameter("uname");
   			String password=request.getParameter("pwd");
   			System.out.println(uname);
   			System.out.println(password);
   			try
   			{
   				Class.forName("oracle.jdbc.driver.OracleDriver");
   				Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
   				Statement st=con.createStatement();
   				String sql= "select * from RegnForm where usernm= '"+uname+"' and pass='"+password+"' ";
   				ResultSet rs=st.executeQuery(sql);
   				if(rs.next())
   				{
   					RequestDispatcher rd=request.getRequestDispatcher("NidhiFrontPage.jsp");
   					rd.forward(request, response);	
   				}
   				else
   				{
   					RequestDispatcher rd=request.getRequestDispatcher("fail.jsp");
   					rd.forward(request, response);
   				}	
   			

   			}
   			catch (ClassNotFoundException | SQLException e)
   			{
   				out.println(e);
   			}
  		   		
   		}
   	}
		
}	

	


