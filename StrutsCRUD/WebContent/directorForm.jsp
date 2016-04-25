<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
		body,input
		{
			font-family: Calibri, Arial;
		}
		table#contact 
		{
			border-collapse: collapse;
			width:550px;
		}
		th 
		{
			height: 40px;
			background-color: #ffee55;
		}
	</style>
</head>
<body>
<center>
<h1>Director Registration Form</h1>
<s:form action="regController" method="get">
<s:textfield name="director.did" label="Director ID"></s:textfield>
<s:textfield name="director.dfname" label="Director First Name" ></s:textfield>
<s:textfield name="director.dlname" label="Director Last Name"></s:textfield>
<s:textfield name="director.dcity" label="Director City"></s:textfield>
<s:submit value="Register"></s:submit>
<s:reset value="Clear"></s:reset>
</s:form>
</center>
<h2>Director Records</h2>
<table id="contact" border="1">
<tr>
	<th>ID</th>
	<th>First Name</th>
	<th>Last Name</th>
	<th>City</th>
	<th>Update</th>
	<th>Delete</th>
</tr>
<s:iterator value="directorList" var="director">
	<tr>
		<td><s:property value="did"/>
		<td><s:property value="dfname"/> </td>
		<td><s:property value="dlname"/></td>
		<td><s:property value="dcity"/></td>
		<td><a href="update?did=<s:property value="did"/>">Update</a></td>
		<td><a href="delete?did=<s:property value="did"/>">delete</a></td>
	</tr>	
</s:iterator>
</table>
</body>
</html>