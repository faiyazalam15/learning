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
	top:450px;
	font-family: sans-serif;
	color:yellow;
}
</style>

</head>
<body>
<%
String uname=request.getParameter("uname");
String pswd=request.getParameter("pswd");
session=request.getSession();
String cname=(String)session.getAttribute("cname");
Connection con=ConnectionProvider.getConnection();
PreparedStatement pst=con.prepareStatement("insert into company(c_name,cf_name,cl_name,c_email,cs_email,cs_add,c_state,c_country,c_postcode,c_phone,c_mob,photo,c_city,uname,pswd) select c_name,cf_name,cl_name,c_email,cs_email,cs_add,c_state,c_country,c_postcode,c_phone,c_mob,photo,c_city,'"+uname+"','"+pswd+"' from approval where approval.c_name='"+cname+"'");
int i=pst.executeUpdate();
if(i>0)
{
	String to=null;
	PreparedStatement ppst=con.prepareStatement("select c_email from company where c_name='"+cname+"'");
	ResultSet rst=ppst.executeQuery();
	if(rst.next())
	to=rst.getString(1);//change accordingly 
	System.out.println(to);
	  
	  //Get the session object  
	  Properties props = new Properties();  
	  props.put("mail.smtp.host", "smtp.gmail.com");  
	  props.put("mail.smtp.socketFactory.port", "465");  
	  props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
	  props.put("mail.smtp.auth", "true");  
	  props.put("mail.smtp.port", "465");  
	   
	  Session session1 = Session.getDefaultInstance(props,new javax.mail.Authenticator() 
	  {  
		  protected PasswordAuthentication getPasswordAuthentication() 
		  {  
		   return new PasswordAuthentication("gupta.sonal1808@gmail.com","gmail1808");  
	   }  
	  });  
	   
	  //compose message  
	  try 
	  {  
	   MimeMessage message = new MimeMessage(session1);  
	   message.setFrom(new InternetAddress("gupta.sonal1808@gmail.com"));//change accordingly  
	   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	   message.setSubject("Register");  
	   message.setText("Your username is "+uname+"\n Your Password is "+pswd);  
	     
	   //send message  
	   Transport.send(message);  
	  
	   System.out.println("message sent successfully");  
	   
	  } catch (MessagingException e)
	  {
		e.printStackTrace();
		out.print("Generated Exception is"+e);
	  }  
	    
	PreparedStatement ppstl=con.prepareStatement("delete from approval where c_name='"+cname+"'");
	ppstl.executeUpdate();
	%>
	<div class="border">
	<h2>Company Added Sucessfully</h2>
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
	RequestDispatcher rd=request.getRequestDispatcher("AfterApprove.jsp");
	rd.include(request,response);
}
%>
</body>
</html>