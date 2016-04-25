import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gServlet")
public class gServlet extends HttpServlet 
{
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
		// TODO Auto-generated method stub
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	String data=request.getParameter("gSearch");
	response.sendRedirect("https://www.google.co.in/#q="+data);
	}

}
