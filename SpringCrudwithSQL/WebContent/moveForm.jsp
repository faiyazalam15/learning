<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>Director Registration Form</title>

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
	<form:errors path="movie.*"/>
		<center>
			<h1>
				Movie Registration Form
			</h1>
			<form method="post" action="addContact.fz">
				<table>
					<tr>
						<td>
							Movie Id
						</td>
						<td>
							<input type="text" name="mid" />
						</td>
					</tr>
					<tr>
						<td>
							Movie Title
						</td>
						<td>
							<input type="text" name="mtitle" />
						</td>
					</tr>
					<tr>
						<td>
							Movie Cost
						</td>
						<td>
							<input type="text" name="mcost"/>
						</td>
					</tr>
					<tr>
						<td>
							Category
						</td>
						<td>
							<input type="text" name="category" />
						</td>
					</tr>
					<tr>
						<td>
							Director ID
						</td>
						<td>
							<input type="text" name="dirid" />
						</td>
					</tr>
					<tr>
						<td>
							Studio ID
						</td>
						<td>
							<input type="text" name="sid" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="Add Contact" />
						</td>
					</tr>
				</table>

			</form>
		</center>
		
		
	</body>
</html>
