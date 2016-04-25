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
<body>
<%
ResultSet rs = null;

	try 
	{
		String mcd=request.getParameter("MemCode");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
		PreparedStatement pst=con.prepareStatement("Select * from MemDetail where MemCode='"+mcd+"'");
		rs=pst.executeQuery();
		rs.next();
	}
	catch(Exception e)
	{
		
	}

%>

<form action="FdAccount" method="get">
<center>

<table bgcolor="gray">
	<tr>
		<td>Members Code</td>
		<td><input type="text" name="MemCode" value="<%=rs.getString(2) %>"></td>
	</tr>
	<tr>
		<td>Members Name</td>
		<td><input type="text" name="Mmname" value="<%=rs.getString(3) %>" ></td>
	</tr>
</table> 

<table bgcolor="lightblue" class="margin">
<tr>
	<td>Select Plan Type :</td>
	<td><select name="PlanType">
			<option>Daily Deposit Plan</option>
			<option>Recurring Deposit Plan</option>
			<option>Fixed Deposit Plan</option>
			<option>MIS (Monthly Income Plan)</option>
			<option>Child Scholarship Plan</option>
			<option>Pension Plan</option>
			</select>
	</td> 
	<td>Select Plan Category</td>
	<td><select name="PlanCategory">
			<option>Normal</option>
			<option>Special</option>
		</select>
</tr>
<tr>
	<td>Enter Plan Duration</td>
	<td><select name="PlanDuration">
			<option>6 Month</option>
			<option>1 Year</option>
			<option>2 Year</option>
			<option>3 Year</option>
			<option>4 Year</option>
			<option>5 Year</option>
		</select>
	</td>
</tr>
<tr>
	<td>Enter Consideration Amount</td>
	<td><input type="text" name="ConsidAmt"></td>
</tr>

<tr>
	<td>Enter Maturity Amount</td>
	<td><input type="text" name="MatAmt"></td>
</tr>
<tr>
	<td>Associate Code </td>
	<td><input type="text" name="AgentCode" ></td>
	<td>Associate's Name</td>
	<td><input type="text" name="AgentName"></td>
</tr>
<tr>
	<td>FD A/c No.</td>
	<td><input type="text" name="FDNo" ></td>

<tr>
	<td><input type="submit" name="Continue" value="Save"></td>
	<td><input type="reset" name="reset" value="cancel"></td>
</tr></br>
</table>

</center>

</form>
</body>
</html>