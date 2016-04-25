<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'successData.jsp' starting page</title>
    
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
   <c:if test="${!empty mov}"> 
   <h1>Movie Details</h1><hr/> 
		<table border="1" cellpadding="8" cellspacing="8" bgcolor="yellow">
		<tr>
		<td>Movie Id</td>
		<td>Movie Title</td>
		<td>Movie Cost</td>
		<td>Category</td>
		<td>Director ID</td>
		<td>Studio ID</td>
		<td>Update</td>
		<td>Delete</td>
		</tr>
		
		<c:forEach items="${mov}" var="mv">  
		<tr>
		<td><c:out value="${mv.mid}"/></td>  
		<td><c:out value="${mv.mtitle}"/></td>  
		<td><c:out value="${mv.mcost}"/></td>  
		<td><c:out value="${mv.category}"/></td>  
		<td><c:out value="${mv.dirid}"/></td>  
		<td><c:out value="${mv.sid}"/></td>
		<td><a href="update.fz?mid=${mv.mid}">Update</a></td>
		<td><a href="delete.fz?mid=${mv.mid}">Delete</a></td>		
		</tr>
		</c:forEach> 
		</table>
</c:if>
		</center>
		<br/>
		<a href="<c:url value="mvFrm.fz"></c:url>">Back To Movie Form</a>	
		
  </body>
</html>
