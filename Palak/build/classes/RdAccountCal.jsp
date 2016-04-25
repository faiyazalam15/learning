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

String ptype,pcat,imode;
double camt,instd,instm,instq,insth,mamt,duration,intrest;
ptype=request.getParameter("PlanType");
pcat=request.getParameter("PlanCategory");
duration=Double.parseDouble(request.getParameter("PlanDuration"));
camt=Double.parseDouble(request.getParameter("ConsidAmt"));
imode=request.getParameter("InstallmentMode");

instd=camt/360;
instm=camt/12;
instq=camt/3;
insth=camt/2;
 
ResultSet rs=null;
	try 
	{
		String mcd=request.getParameter("MemCode");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
		PreparedStatement pst=con.prepareStatement("Select * from MemDetail where MemCode='"+mcd+"'");
		rs=pst.executeQuery();
		rs.next();
		
		PreparedStatement ps=con.prepareStatement("select INTERESTPERCENT from plan where plantype='"+ptype+"' and PLANCATEGORY='"+pcat+"' and PLANDURATION='"+duration+"'");
		ResultSet rst=ps.executeQuery();
		if(rst.next())
		{
			intrest=rst.getDouble(1);
		}
		else
			System.out.println("Not Get Data");

	}
	catch(Exception e)
	{
		
	}
		

%>

<form action="account" method="get">
<center>

<table bgcolor="lightgray">
	<tr>
		<td> Rd A/c Opening Date </td>
		<td><input type="text" name="Rddate" value=<%=rs.getString(1) %>> </td>
		<td>Members Code</td>
		<td><input type="text" name="MemCode" value="<%=rs.getString(2)%>"></td>
	</tr><br/>
	<tr>
		<td>Members Name</td>
		<td><input type="text" name="Mmname" value="<%=rs.getString(3) %>"></td>
	</tr><br/>
</table> 

<table bgcolor="PINK" class="margin">
<tr>
	<td>Select Plan Type :</td>
	<td><select name="PlanType">
			<option> DDS</option>
			<option>RD</option>
			<option>FD</option>
			<option>MIS</option>
			<option>CHILD</option>
			<option>Pension</option>
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
	<td>Select Installment Mode</td>
	<td><select name="InstallmentMode">
			<option >Daily</option>
			<option>Monthly</option>
			<option>Quarterly</option>
			<option>Half Yearly</option>
			<option>Yearly</option>
		</select>
	</td>
	
</tr>
<tr>
	<td>Installment Amount</td>
	<td><input type="text" name="installmentAmt" value="instd"></td>
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
	<td>RD A/c No.</td>
	<td><input type="text" name="RdNo" ></td>

<tr>
	<td><input type="submit" name="Continue" value="Save"></td>
	<td><input type="reset" name="reset" value="cancel"></td>
</tr></br>
</table>

</center>
</form>
</body> 
</html>