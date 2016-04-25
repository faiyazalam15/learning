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

<body bgcolor="lightblue">
<%
ResultSet rs = null;

	try 
	{	String mcd=request.getParameter("Memcode");
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

<center>
<form action="MemDetailUpdate" method="get">
<h1> Member's Updation Form </h1>
<table>
	<tr>
		<td>Registration Date </td>
		<td><input type="text" name="Memdate" value="<%=rs.getString(1)%>"></td>
		
	</tr>

	<tr> 
		<td>Member Code No.   :</td>
		<td><input Type="text" name="MemCode" value="<%=rs.getString(2) %>" readonly></td>
	</tr>
	<tr>
		<td>Name of Member</td>
		<td><input type="text" name="Memname" value="<%=rs.getString(3)%>"></td>
		<td>Father's/Husband's Name</td>
		<td><input type="text" name="MemFname" value="<%=rs.getString(4) %>"></td>
		<td>Mother's Name</td>
		<td><input type="text" name="Mothername" value="<%=rs.getString(5) %>"></td>
		<td><select name="Gender" >
				<option value="<%=rs.getString(6)%>">Male</option>
				<option>Female</option>
				<option>Other</option>
			</select>
		</td>
		<td><select name="MarritalStatus" >
				<option value="<%=rs.getString(7)%>">Married</option>
				<option>Unmarried</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>Address</td>
		<td><textarea name="MemAddr" rows="5" cols="6"><%=rs.getString(8)%></textarea></td>
		<td>Enter City :</td>
		<td><input type="text" name="MemCity" value="<%=rs.getString(9) %>"></td>
		<td>Enter State  :</td>
		<td><input type="text" name="MemState" value="<%=rs.getString(10) %>"></td>
		<td>country</td>
		<td><input type="text" name="Memcountry" value="<%=rs.getString(11)%>"></td>
	</tr>
	<tr>
		<td>Pin Code No.</td>
		<td><input type="text" name="MemPinno" value="<%=rs.getString(12)%>"></td>
		<td>Age</td>
		<td><input type="text" name="MemAge" value="<%=rs.getString(13)%>"></td>
		<td>Telephone No.</td>
		<td><input type="text" name="MemTelno" value="<%=rs.getString(14) %>"></td>
		<td>Mob.No.</td>
		<td><input type="text" name="MemMobNo" value="<%=rs.getString(15) %>"></td>
	</tr>
	<tr>
		<td>Email Id</td>
		<td><input type="text" name="MemEmailid" value="<%=rs.getString(16) %>"></td>
		<td>PAN No. </td>
		<td><input type="text" name="MemPanno" value="<%=rs.getString(17) %>"></td>
		<td>Residential Proof :</td>
		<td>
			<select name="MemResiProof" >
				<option value="<%=rs.getString(18) %>">Driving License</option>
				<option>Voter Card</option>
				<option>Ration Card</option>
				<option>Electricity Bill</option>
				<option>Govt.Id</option>
				<option>Other</option>
			</select>
		</td>
		<td>Identity Proof :</td>
		<td><select name="MemIdProof">
				<option value="<%=rs.getString(19) %>" ><%=rs.getString(19) %></option>
				<option>Driving Licence</option>
				<option>Voter Card</option>
				<option>Ration Card</option>
				<option>Electricity Bill</option>
				<option>Govt.Id</option>
				<option>PanCard</option>
				<option>PassPort</option>
			</select>
		</td>
	<tr>
	
		<td>Nominee Name</td>
		<td><input type="text" name="MemNomname" value="<%=rs.getString(20)%>"></td>
		<td>S/o,W/O,D/O</td>
		<td><input type="text" name="MemNomfname" value ="<%=rs.getString(21)%>"></td>
		<td>Age</td>
		<td><input type="text" name="MemNomage" value ="<%=rs.getString(22)%>"></td>
		<td>relation</td>
		<td><input type="text" name="MemNomrelation" value ="<%=rs.getString(23)%>"></td>
	</tr>
	<tr>
		<td><input type="submit"  value="Save"></td>
		<td><input type="reset" value="reset"></td>
		<td><input type="button" value="print" onclick="window.print()">
		
	</tr>
</table>

</form>
</center>
</body>
</html>