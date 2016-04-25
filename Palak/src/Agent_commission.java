import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Agent_commission")
public class Agent_commission extends HttpServlet
{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int sno1,sno2,sno3,sno4,sno5;
		String rank,ptype,pcat,pduration,com_year_from,com_year_to,nrm_spcl,rank1,rank2,rank3,rank4,rank5;
		double Commission1,Commission2,Commission3,Commission4,Commission5;
		
		ptype=request.getParameter("plantype"); 
		nrm_spcl=request.getParameter("nrm_spcl");
		pduration=request.getParameter("Duration");
		com_year_from=request.getParameter("com_year_from");
		com_year_to=request.getParameter("com_year_to");
		sno1=Integer.parseInt(request.getParameter("Sno1"));
		rank1=request.getParameter("Rank1");
		Commission1=Double.parseDouble(request.getParameter("Commission1"));
		
		sno2=Integer.parseInt(request.getParameter("Sno2"));
		rank2=request.getParameter("Rank2");
		Commission2=Double.parseDouble(request.getParameter("Commission2"));
		
		sno3=Integer.parseInt(request.getParameter("Sno3"));
		rank3=request.getParameter("Rank3");
		Commission3=Double.parseDouble(request.getParameter("Commission3"));
		
		sno4=Integer.parseInt(request.getParameter("Sno4"));
		rank4=request.getParameter("Rank4");
		Commission4=Double.parseDouble(request.getParameter("Commission4"));
		
		sno5=Integer.parseInt(request.getParameter("Sno5"));
		rank5=request.getParameter("Rank5");
		Commission5=Double.parseDouble(request.getParameter("Commission5"));
		out.print("<html>" +
				"<body>" +
				"<center>" +
				"<table border='1px solid'cellspacinng='8' cellpadding='8'>" +
				"<tr bgcolor='gray'>" +
				"<td>Serial Number</td> <td>Rank</td>	<td>Plan Type</td>	<td>Plan Category</td><td>Plan Duration</td><td>Commission Yr. From </td><td>CommissionYr. To</td><td>Commission(%)</td></tr>" +
				"<tr><td>"+sno1+"</td>><td>"+rank1+"</td>><td>"+ptype+"</td>><td>"+nrm_spcl+"</td>><td>"+pduration+"</td>><td>"+com_year_from+"</td>><td>"+com_year_to+"</td><td>"+Commission1+"</td></tr>" +
				"<tr><td>"+sno2+"</td>><td>"+rank2+"</td>><td>"+ptype+"</td>><td>"+nrm_spcl+"</td>><td>"+pduration+"</td>><td>"+com_year_from+"</td>><td>"+com_year_to+"</td><td>"+Commission2+"</td></tr>"+
				"<tr><td>"+sno3+"</td>><td>"+rank3+"</td>><td>"+ptype+"</td>><td>"+nrm_spcl+"</td>><td>"+pduration+"</td>><td>"+com_year_from+"</td>><td>"+com_year_to+"</td><td>"+Commission3+"</td></tr>"+
				"<tr><td>"+sno4+"</td>><td>"+rank4+"</td>><td>"+ptype+"</td>><td>"+nrm_spcl+"</td>><td>"+pduration+"</td>><td>"+com_year_from+"</td>><td>"+com_year_to+"</td><td>"+Commission4+"</td></tr>"+
				"<tr><td>"+sno5+"</td>><td>"+rank5+"</td>><td>"+ptype+"</td>><td>"+nrm_spcl+"</td>><td>"+pduration+"</td>><td>"+com_year_from+"</td>><td>"+com_year_to+"</td><td>"+Commission5+"</td></tr>");
				
	}

}
 