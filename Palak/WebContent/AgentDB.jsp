<%@page import="javax.swing.JOptionPane"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
	response.setContentType("text/xml");
	String sn=request.getParameter("ok1");
	System.out.print("Agent DB::"+sn);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "pramod", "pramod");
	PreparedStatement ps = con.prepareStatement("select * from AGENTMASTER where AGENTCODE=?");
	ps.setString(1,sn);
	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
		System.out.println("Agent::"+rs.getString(2));
		out.println("<emp>");
		out.println("<empaddr>"+rs.getString(2)+"</empaddr>");
		out.println("<rank>"+rs.getString(4)+"</rank>");
		out.println("<intro>"+rs.getString(6)+"</intro>");
		out.println("<intrnm>"+rs.getString(7)+"</intrnm>");
		out.println("<intrnk>"+rs.getString(8)+"</intrnk>");
		out.println("</emp>");
 	}
	rs.close();
	con.close();
%>