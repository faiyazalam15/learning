<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'directorForm.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<center>
			<h1>
				Director Registration Form
			</h1>
			<hr />
		</center>
		<form:form action="dirForm.fz" method="post">
		<table>
		<tr>
		<td>Director Id</td>
		<td><input type="text" name="mid"/></td>
		</tr>
		
		<tr>
		<td>Director First Name</td>
		<td><input type="text" name="dfname"/></td>
		</tr>
		<tr>
		<td>Director Last Name</td>
		<td><input type="text" name="dlname"/></td>
		</tr>
		<tr>
		<td>Director City</td>
		<td><input type="text" name="dcity"/></td>
		</tr>
		<tr>
		<td><input type="Submit" value="Register Director"></td>
		<td><input type="reset" name="Clear"/></td>
		</tr>
		</table>
		</form:form>
		
		
		<center>
   <h1>Director Details</h1><hr/>
		<table cellpadding="8" cellspacing="8" bgcolor="yellow">
		<tr>
		<td>Director Id</td>
		<td>Director First Name</td>
		<td>Director Last Name</td>
		<td>City</td>
		<td>Director ID</td>
		<td>Studio ID</td>
		<td>Update</td>
		<td>Delete</td>
		</tr>
		<tr>
		
		<td>${movie.mid}</td>
		<td>${movie.mtitle}</td>
		<td>${movie.mcost}</td>
		<td>${movie.category }</td>
		<td>${movie.dirid }</td>
		<td>${movie.sid }</td>
		<td><a href="delete/${movie.mid }">Update</a></td>
		<td><a href="delete/${movie.mid}">Delete</a></td>
		</tr>
		</table>
		</center>
	</body>
</html>
