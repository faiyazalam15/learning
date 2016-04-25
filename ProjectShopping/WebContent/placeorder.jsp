<%@page import="java.beans.Statement"%>
<%@include file="LoginAfterUs.jsp" %>
<html>
<head>
<style type="text/css">
.bord
{
	border: thin;
	border-bottom-color: aqua;
	position:absolute;
	right:340px;
	top:550px;
	font-family: sans-serif;
	color:yellow;
}
</style>
</head>
<body>
<%
String cname,itemid,email,maddress,mobno,itemname;
cname=request.getParameter("cname");
itemid=request.getParameter("itemid");
email=request.getParameter("email");
maddress=request.getParameter("maddress");
mobno=request.getParameter("mobno");
itemname=request.getParameter("itemname");
int ordid=0;
Connection cont = null;
PreparedStatement ppst = null;
try
{
 cont = ConnectionProvider.getConnection();
 // get next order id
 PreparedStatement pstl=cont.prepareStatement("select max(ordid) from orders");
 ResultSet rslt = pstl.executeQuery();
 rslt.next();
 ordid = rslt.getInt(1)+1;
 rslt.close();

 //insert order
 ppst = cont.prepareStatement("insert into orders values (?,?,?,sysdate,'New',?,?,?,?)");
 ppst.setInt(1,ordid);
 ppst.setString(2,cname);
 ppst.setString(3,itemid);
 ppst.setString(4,email);
 ppst.setString(5,maddress);
 ppst.setString(6,mobno);
 ppst.setString(7,itemname);
 if ( ppst.executeUpdate() == 0 )
      throw new Exception("Order cannot be accepted!");
 }
 catch(Exception ex)
 {
  System.out.println(ex.getMessage());
 }
%>
<div class="bord">

<table border="1">
<tr>
<td style="background-color:black;color:white;font:700 14pt arial;text-align:center">
Order Status
</td>
</tr>
<tr>
<td style="text-align:center"> 
<%

    if (ordid > 0 )
         out.println("Order has been accepted. You will get item delivered within next 15 to 20 days. <p> Order Id : " + ordid );
    else
         out.println("Sorry!. Order could not be accepted due to an error. Please try again!");
%>
</tr>
</table>
&nbsp;&nbsp;
<a href="javascript:history.back()">Back</a>
</div>
</body>
</html>
     
    
   
