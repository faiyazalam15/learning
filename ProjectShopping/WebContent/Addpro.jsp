<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="Back.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<style type= "text/css"> 
       .mid 
       { 
       border: thin; 
        border-bottom-color: aqua; 
        position:absolute; 
        right:550px; 
        top:450px; 
       } 
</style>
</head>
<body>
<jsp:include page="LoginComp.jsp"></jsp:include>
        	<% 
            	session=request.getSession();
        		String name=(String)session.getAttribute("name");
            	%>
        	<div class="mid">
            	
            	<h1 style="color:lime;font-size:30px">Welcome <%=name %></h1>
                <div id="regist_user" class="col_2 left">
                    <form method="post" action="RegAddPro"  enctype="multipart/form-data">  
        <table cellpadding="5" cellspacing="8" bgcolor="gray" style="color:yellow">  
        <tr>
              <td>Product Id</td>  
                <td><input type="text" name="pid" required="required" /></td>  
              <td>Product Name</td>  
                <td><input type="text" name="pname" required="required" /></td>  
            </tr>
            <tr>
              <td>Company Name</td>  
                <td><input type="text" name="cname" required="required" /></td>  
             <td>Product Category</td>  
                <td><select name="pcat">
                <option value="Mobiles">Mobiles</option>
                <option value="Laptops">Laptops</option>
                <option value="Tablets">Tablets</option>
                <option value="LCD">LCD</option>
                <option value="Cameras">Cameras</option>
                <option value="Headphones">Headphones</option>
                <option value="Mobile Cases & Covers">Mobile Cases & Covers</option>
                </select></td>  
            </tr>  
            <tr>
              <td>Product Cost</td>  
                <td><input type="text" name="pcost" required="required" /></td>  
              <td>Product Info</td>  
                <td><textarea name="pinfo"></textarea></td>  
            </tr>  
            <tr>  
                <td>Choose Image:</td>  
                <td><input type="file" name="photo" required="required" /></td>  
            </tr>  
            <tr> 
            	<td></td> 
                <td><input type="submit" value="Add"></td>  
                <td><input type="reset" value="Clear" /></td>  
            </tr>  
        </table>  
    </form>  
				</div>
			</div>
   </body>
</html>