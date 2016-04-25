<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="LoginAfterUs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type= "text/css"> 
       .md
       { 
       border: thin; 
        border-bottom-color: aqua; 
        position:relative; 
        left:60px; 
        top:80px; 
       } 
       </style> 
</head>
<body>
<%
  String itemid = request.getParameter("itemid");
  String itemname = request.getParameter("itemname");
  session=request.getSession();
	String bname=(String)session.getAttribute("name");
	Connection cont=ConnectionProvider.getConnection();
	PreparedStatement ppst=cont.prepareStatement("select * from buyer where bf_name='"+bname+"'");
	ResultSet rslt=ppst.executeQuery();
	if(rslt.next())
	{
%>
<div class="md">
<h2 style="color: purple;">Place Order </h2>
<form action="placeorder.jsp" method="post">
<table cellpadding="5" cellspacing="5">
<tr>
<td>
Item Name 
<td>
<input type=text  readonly value="<%=itemname%>" name="itemname">
<input type=hidden value="<%=itemid%>" name="itemid">
</tr>



<tr>
<td>Customer Name
<td><input type=text  name=cname size=30 value="<%=rslt.getString(1)%>">
</tr>

<tr>
<td>Mailing Address 
<td><textarea name=maddress rows=5 cols=30><%=rslt.getString(4)%></textarea>
</tr>


<tr>
<td>Mob No.
<td><input type=text name=mobno size=30 value="<%=rslt.getString(10)%>">
</tr>


<tr>
<td>Email Address
<td><input type=text name=email size=40 value="<%=rslt.getString(3)%>">
</tr>


</table>

<input type=submit value="Place Order">
<input type=button value="Cancel Order" onClick="javascript:history.back()">

</form>
</div>
<%
	}
%>
</body>
</html>