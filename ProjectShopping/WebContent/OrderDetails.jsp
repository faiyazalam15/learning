<%@include file="LoginAfterUs.jsp" %>
<html>
<head>
<style type="text/css">
.bord
{
	border: thin;
	border-bottom-color: aqua;
	position:absolute;
	right:80px;
	top:500px;
	font-family: sans-serif;
	color:white;
}
</style>
</head>
<body>
<%
int i=0;
session=request.getSession();
String bname=(String)session.getAttribute("name");
Connection cont=ConnectionProvider.getConnection();
PreparedStatement ppstl=cont.prepareStatement("select * from orders where cname='"+bname+"'");
ResultSet rsltl=ppstl.executeQuery();
while(rsltl.next())
i++;
if(i==0)
{
	%>
	<div >
	<h3 style="color:pink;margin-top: 100px;">You Have Not Placed Any Order Yet</h3>
	</div>
	<% 
}
else
{
%>
<div class="bord">
<h3 style="color:pink">Your Orders</h3>
<table cellspacing="5" cellpadding="5">
<tr>
<td>Order Number </td>
<td>Item Name </td>
<td>Mailing Address</td> 
<td>Phone No.</td>
<td>Email Address</td>
<td>Order Date</td>
<td>Order Status</td>
</tr>
<%
PreparedStatement ppst=ConnectionProvider.getConnection().prepareStatement("select * from orders where cname='"+bname+"'");
ResultSet rslt=ppst.executeQuery();
while(rslt.next())
{
%>
<tr>
<td><%=rslt.getInt(1) %></td>
<td><%=rslt.getString(9) %></td>
<td><%=rslt.getString(7) %></td>
<td><%=rslt.getString(8) %></td>
<td><%=rslt.getString(6) %></td>
<td><%=rslt.getString(4) %></td>
<td><%=rslt.getString(5) %></td>
<td>
<%
int ordid=rslt.getInt(1);
session.setAttribute("ordid",ordid);
if(rslt.getString(5).equals("New") || rslt.getString(5).equals("Accepted"))
{
	%>
	<a href="OrdUD.jsp?val=update"><input type="button" value="Update"></a>
	</td>
	<td>
	<a href="OrdUD.jsp?val=delete"><input type="button" value="Cancel"></a>
	<% 
}
%>
</td>
</tr>
<%
}
%>
</table>
</div>
<%} %>
</body>
</html>

