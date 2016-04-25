<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="p1.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.*"%>  
<%@page import="javax.mail.internet.*"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.border
{
	border: thin;
	border-bottom-color: aqua;
	position:absolute;
	right:270px;
	top:420px;
	font-family: sans-serif;
	color:yellow;
}
</style>
</head>
<body>
<%
session=request.getSession();
String value=request.getParameter("disa");
String cname=(String)session.getAttribute("cname");
Connection con=ConnectionProvider.getConnection();
if(value.equals("Yes"))
{
	String to=null;
	PreparedStatement ppst=con.prepareStatement("select c_email from approval where c_name='"+cname+"'");
	ResultSet rst=ppst.executeQuery();
	if(rst.next())
	to=rst.getString(1); 
	  
	  //Get the session object  
	  Properties props = new Properties();  
	  props.put("mail.smtp.host", "smtp.gmail.com");  
	  props.put("mail.smtp.socketFactory.port", "465");  
	  props.put("mail.smtp.socketFactory.class",  
	            "javax.net.ssl.SSLSocketFactory");  
	  props.put("mail.smtp.auth", "true");  
	  props.put("mail.smtp.port", "465");  
	   
	  Session session1 = Session.getDefaultInstance(props,new javax.mail.Authenticator() 
	  {  
	   protected PasswordAuthentication getPasswordAuthentication() {  
	   return new PasswordAuthentication("meenalvijay12@gmail.com","12meenalvijay");//change accordingly  
	   }  
	  });  
	   
	  //compose message  
	  try 
	  {  
	   MimeMessage message = new MimeMessage(session1);  
	   message.setFrom(new InternetAddress("meenalvijay12@gmail.com"));//change accordingly  
	   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	   message.setSubject("Register");  
	   message.setText("Your Registration is Disapproved By Shopify due to some reasons");  
	     
	   //send message  
	   Transport.send(message);  
	  
	   System.out.println("message sent successfully");  
	   
	  } catch (MessagingException e) {throw new RuntimeException(e);}  
	   
PreparedStatement ppstl=con.prepareStatement("delete from approval where c_name='"+cname+"'");
ppstl.executeUpdate();
%>
<div class="border">
<h2>Company Disapproved Sucessfully</h2>
</div>
<%
RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
rd.include(request,response);
}
else
{
%>
<div class="border">
<h2>Some Internal Error Occured</h2>
</div>
<%
RequestDispatcher rd=request.getRequestDispatcher("DisApp.jsp");
rd.include(request,response);
}
%>
</body>
</html>