<%@ page import="com.sun.crypto.provider.RSACipher" %>
<%@ page import = "javax.swing.JOptionPane" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="pink">
<%
ResultSet rs = null;

	try 
	{	
		String Agcd=request.getParameter("Agentcode");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
		PreparedStatement pst=con.prepareStatement("Select * from AgentMaster where AgentCode='"+Agcd+"'");
		rs=pst.executeQuery();
		rs.next();
	}
	catch(Exception e)
	{
		
	}

%>
<form action="AgentUpdate" method="get">
<center>


<h1>Agent Updation  Form </h1>
<table>
<tr>
	<td>Branch Name</td>
	<td><select>
			<option>AlwarCSC</option>
			<option>Indore</option>
			<option>Udaipur</option>
		</select>
	<td>Branch Code</td>
	<td bgcolor="red"><input type="text" name="csccode" size="3" value="001" ></td>
</tr>
<tr>
	<td>MemberShip No.</td>
	<td><input type="text" name="MemCode" value="<%=rs.getString(1)%>" readonly></td>
	<td>Member's Name</td>
	<td><input type="text" name="MemName" value="<%=rs.getString(2)%>" readonly></td>
	<td>Agent Code</td>
	<td bgcolor="red"><input type="text" name="AgentCode" value="<%=rs.getString(3)%>" readonly></td>
</tr>
<tr>
	<td>Agent Rank  :</td>
	<td><select name ="Rank" >
			<option value="<%=rs.getString(4) %>">[1] EXECUTIVE</option>
			<option >[2] SR.EXECUTIVE</option>
			<option >[3] DEVELOPMENT MANAGER</option>
			<option >[4] REGIONAL MANAGER</option>
			<option >[5] ZONAL MANAGER</option>
		</select>
	</td>
</tr>
<tr>
	<td>Registration Date</td>
	<td><input type="text" name="Regndate" value="<%=rs.getString(5)%>"></td>
</tr>
<tr>
	<td>Introducer Code </td>
	<td><input type="text" name="IntroCode" value="Co-1" value="<%=rs.getString(6)%>"></td>
	<td>Intro Name</td>
	<td bgcolor="red"><input type="text" name="IntroName" value="<%=rs.getString(7) %>"></td>
	<td>Intro Rank</td>
	<td bgcolor="red"><input type="text" name="IntroRank" value="<%=Integer.parseInt(rs.getString(8))%>"></td>
	
</tr>
<tr>
	<td>Agency Fee</td>
	<td><input type="text"  name="Agencyfee" value="<%=Integer.parseInt(rs.getString(9)) %>"></td>
</tr>

<tr>
	<td><input type ="submit" name="Save" value="Update"></td>
	<td><input type ="reset" name="reset" value="reset"></td>

</table>

</center>
</form>
</body>
</html>