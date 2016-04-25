<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="Back.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="login.css" />
<title>Login Page</title>

</head>
<body>
<jsp:include page="Main.jsp"></jsp:include>
        	 <div class="main"  style="margin-left: 120px;margin-top:60px;">
          <div style="color:olive;font-family: Jokerman" class="heading">Sign in to your Account</div>
				<form class="form-1" action="LoginCheck.jsp" method="post" style="margin-top: 20px;margin-left: 500px;">
				
				<p class="field">
						<input type="text" name="utype" placeholder="Company/Employee/User/Admin">
						<i class="icon-user icon-large"></i>
					</p>
				
					<p class="field">
						<input type="text" name="uname" placeholder="Username">
						<i class="icon-user icon-large"></i>
					</p>
						<p class="field">
							<input type="password" name="password" placeholder="Password">
							<i class="icon-lock icon-large"></i>
					</p>
					<p class="submit">
						<button type="submit" name="submit">
						<i class="icon-arrow-right icon-large"></i></button>
					</p>
				</form>
			</div>
    
</body>
</html>