<%@ page import="java.io.*,java.sql.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
	response.setContentType("text/xml");
	String sn=request.getParameter("ok");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:xe", "pramod", "pramod");
	PreparedStatement ps = con.prepareStatement("select * from AGENTMASTER where AGENTCODE=?");
	ps.setString(1, sn);
	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
		System.out.println(rs.getString(2));
		out.println("<emp>");
		out.println("<empname>"+rs.getString(2)+"</empname>");
		out.println("<empaddr>"+rs.getString(4)+"</empaddr>");
		out.println("</emp>");
 	}

	rs.close();
	con.close();
%>