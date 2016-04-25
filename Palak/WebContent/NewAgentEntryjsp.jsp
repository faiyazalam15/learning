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
<script>
function loadXMLDoc()
{

	var xmlhttp;
	var keys = document.myform.IntroCode.value;
	
	if(keys=="Co-1")
	{
		document.getElementById("b").value ="Company";
		document.getElementById("c").value ="6";
		//document.getElementById("e").value ="5";
	}
	else 
	{
	
	var urls = "http://localhost:8082/Palak/introDB.jsp?ok=" + keys;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() 
	{
		if (xmlhttp.readyState == 4) {
			var some = xmlhttp.responseXML.documentElement;
			//alert(some.getElementsByTagName("empname")[0].childNodes[0].nodeValue);
			//document.getElementById("a").value=some.getElementsByTagName("empno")[0].childNodes[0].nodeValue;
			 document.getElementById("b").value = some.getElementsByTagName("empname")[0].childNodes[0].nodeValue;
			document.getElementById("c").value = some.getElementsByTagName("empaddr")[0].childNodes[0].nodeValue;
 		}
	}
	xmlhttp.open("GET", urls, true);
	xmlhttp.send();
}
}
</script>

</head>
<body ID="body3">
<%

String mcd=request.getParameter("agId");

ResultSet rs = null;

	try
	{
		ServletContext context=getServletContext();
		context.removeAttribute("info");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pramod","pramod");
		PreparedStatement pst=con.prepareStatement("Select * from MemDetail where MemCode='"+mcd+"'");
		rs=pst.executeQuery();
		rs.next();
		
		
		PreparedStatement ps = con.prepareStatement("select AGENTCODE,AGENTNAME from AGENTMASTER where MEMCODE=?");
		ps.setString(1,mcd);
		ResultSet rs1 = ps.executeQuery();
		if(rs1.next())
		{
			System.out.print(rs1.getString(1));
			
			context.setAttribute("info",rs1.getString(2) +" is Already Agent : "+rs1.getString(1));
		 	RequestDispatcher rd= request.getRequestDispatcher("Enter_AgentID.jsp");
			rd.forward(request, response);
	   
		}

	}
	catch(Exception e)
	{
		
	}
%>
<form action="NewAgentEntry" name="myform" method="get" id="body1">
<center>


<h1>New Associates Entry Form </h1>
<table>
<tr>
	<td>Branch Name</td>
	<td><select>
			<option>AlwarCSC</option>
			<option>Indore</option>
			<option>Udaipur</option>
		</select>
	<td>Branch Code</td>
	<td bgcolor="red"><input type="text" name="csccode" size="3" value="001"></td>
</tr>
<tr>
	<td>Registration Date</td>
	<td><input type="text" name="Regndate" value="<%=rs.getString(1)%>"></td>
	<td>MemberShip No.</td>
	<td><input type="text" name="MemCode" value="<%=rs.getString(2)%>"></td>
	<td>Member's Name</td>
	<td><input type="text" name="MemName" value="<%=rs.getString(3)%>"></td>
</tr>
<tr>
	<td>Agent Rank  :</td>
	<td><select name ="Rank">
			<option value="1">[1] ADVISOR</option>
			<option value="2">[2] SALES EXECUTIVE</option>
			<option value="3">[3] SALES OFFICER</option>
			<option value="4">[4] SR. SALES OFFICER</option>
			<option value="5">[5] ASSISTANT SALES MANAGER</option>
			<option value="6">[6] SALES MANAGER</option>
			<option value="7">[7] SR.SALES MANAGER</option>
			<option value="8">[8] BUSINESS MANAGER</option>
			<option value="9">[9] DEVELOPMENT MANAGER</option>
			<option value="10">[10]TERRITORY MANAGER</option>
			<option value="11">[11]AREA MANAGER</option>
			<option value="12">[12]REGIONAL MANAGER</option>
			
			
		</select>
	</td>
</tr>
<tr>
	<td>Introducer Code </td>
	<td><input type="text" name="IntroCode" onkeyup="loadXMLDoc()"></td>
	<td>Intro Name</td>
	<td bgcolor="red"><input type="text" name="IntroName" id="b"></td>
	<td>Intro Rank</td>
	<td bgcolor="red"><input type="text" name="IntroRank" id="c"></td>
	
</tr>
<tr>
	<td>Agency Fee</td>
	<td><input type="text"  name="Agencyfee"></td>
</tr>

<tr>
	<td><input type ="submit" name="Save" value="Save"></td>
	<td><input type ="reset" name="reset" value="reset"></td>

</table>

</center>
</form>
</body>
</html>