<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>Simple Form</center>
<s:form action="myAction">
<s:textfield label="Enter The Name" name="name"></s:textfield>
<s:textarea label="Eneter The Assress" name="addrs"></s:textarea>
<s:submit value="Submit Here"></s:submit>
</s:form>
</body>
</html>