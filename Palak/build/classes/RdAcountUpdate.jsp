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
		String rdno=request.getParameter("RdNo");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
		PreparedStatement pst=con.prepareStatement("Select * from Account where RDNO='"+rdno+"'");
		rs=pst.executeQuery();
		rs.next();
	}
	catch(Exception e)
	{
		
	}

%>
<form action="RdAccountUpdate" method="post">
<center>

<h1>RD Account Updation Form </h1>
<table bgcolor="lightblue">
<tr>
	<td>RD A/c No.</td>
	<td><input type="text" name="RdNo" value="<%=rs.getString(13) %>" readonly></td>
	<td>RD Account Holder's Name</td>
	<td><input type="text" name="Memname" value="<%=rs.getString(3) %>" readonly></td>
</tr>	
</table> 

<table bgcolor="lightblue" class="margin">
<tr>
	<td>Select Plan Type :</td>
	<td><select name="PlanType" >
			<option value="<%=rs.getString(4) %>">DDS</option>
			<option>RD</option>
			<option>FD</option>
			<option>MIS</option>
			<option>Child</option>
			<option>Pension</option>
			</select>
	</td> 
	<td>Select Plan Category</td>
	<td><select name="PlanCategory" >
			<option value="<%=rs.getString(5) %>">Normal</option>
			<option>Special</option>
		</select>
</tr>
<tr>
	<td>Enter Plan Duration</td>
	<td><select name="PlanDuration" >
			<option value="<%=rs.getString(6) %>">6 Month</option>
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
	<td><input type="text" name="ConsidAmt" value="<%=rs.getString(7) %>"></td>
</tr>
<tr>
	<td>Select Installment Mode</td>
	<td><select name="InstallmentMode" >
			<option value="<%=rs.getString(8) %>">Monthly</option>
			<option>Quarterly</option>
			<option>Half Yearly</option>
			<option>Yearly</option>
		</select>
	</td>
	
</tr>
<tr>
	<td>Installment Amount</td>
	<td><input type="text" name="InstallmentAmt" value="<%=rs.getString(9) %>"></td>
	<td>Enter Maturity Amount</td>
	<td><input type="text" name="MatAmt" value="<%=rs.getString(10) %>"></td>
</tr>
<tr>
	<td>Associate Code </td>
	<td><input type="text" name="AgentCode" value="<%=rs.getString(11) %>" ></td>
	<td>Associate's Name</td>
	<td><input type="text" name="AgentName" value="<%=rs.getString(12) %>"></td>
</tr>
<tr>
	<td><input type="submit" name="Continue" value="UPDATE"></td>
	<td><input type="reset" name="reset" value="cancel"></td>
</tr>
</table>

</center>
</form>

</body>
</html>