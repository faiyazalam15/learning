<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'studioForm.jsp' starting page</title>
    
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
  <h1>Add Studio Form</h1><hr/>
  
   <form:form action="stdSub.fz" method="post" commandName="command">
   <table>
   <tr>
   <td><form:label path="sid">Studio ID:</form:label></td>
   <td><form:input path="sid" value="${st.sid}"/> </td>
   <td><font color=red size=5><form:errors path="sid"/></font></td>
   </tr>
   
   <tr>
   <td><form:label path="sname">Studio Name</form:label> </td>
   <td><form:input path="sname" /> </td>
   <td><font color=red size=5><form:errors path="sname"/></font></td>
   </tr>
   
   <tr>
   <td><form:label path="scity">Studio City</form:label> </td>
   <td><form:input path="scity" /> </td>
   <td><font color=red size=5><form:errors path="scity"/></font></td>
   </tr>
   
   <tr>
   <td><input type="Submit" value="Submit"/></td>
   <td><input type="reset" value="Reset"></td>
   </tr>
   </table>
   </form:form>
   </center>
   
   <c:if test="${!empty stu}">  
  <h2>List Studio</h2>  
 <table border="1">  
  <tr>  
   <th>Studio ID</th>  
   <th>Studio Name</th>  
   <th>Studio City</th>  
   <th>Actions on Row</th>  
  </tr>  
  
  <c:forEach items="${stu}" var="st">  
   <tr>  
    <td><c:out value="${st.sid}"/></td>  
    <td><c:out value="${st.sname}"/></td>  
    <td><c:out value="${st.scity}"/></td>
    <td align="center">
    <a href="edit.fz?sid=${st.sid}">Edit</a> | 
    <a href="delete.fz?sid=${st.sid}">Delete</a>
    </td>  
   </tr>  
  </c:forEach>  
 </table>  
</c:if>
  </body>
</html>
