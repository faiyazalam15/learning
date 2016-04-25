<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="Mystyle.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body bgcolor="cyan">
<h1> Navigation Menu</h1>
<ul id="navmenu">
	<li><a href="#">Directors</a>
		<ul class="sub1">
			<li><a href="Dir_Entry.jsp">Director-Entry</a></li>
			<li><a href="Dir_Update.jsp">Director-update</a></li>
			<li><a href="Dir_Delete.jsp">Director-delete</a></li>
			<li><a href="Dir_Search.jsp">Director-search</a></li>
		</ul>
	</li>
	<li><a href="#">Studios</a>
		<ul class="sub1">
			<li><a href="StEntry.jsp">Studio Entry</a></li>
			<li><a href="StUpdate.jsp">Studio Update</a></li>
			<li><a href="StDelete.jsp">Studio Delete</a></li>
			<li><a href="StSearch.jsp">Studio Search</a></li>
		</ul>
	</li>	
	<li><a href="MovEntry">Movies Entry</a>
			<ul class="sub1">
			<li><a href="MovEntry.jsp">Movie Entry</a></li>
			<li><a href="MovUpdate.jsp">Movie Update</a></li>
			<li><a href="MovDelete.jsp">Movie Delete</a></li>
			<li><a href="MovSearch.jsp">Movie Search</a></li>
		</ul>
	</li>
	<li><a href="#">Theatre</a>
		<ul class="sub1">
			<li><a href="ThEntry.jsp">Theatre Entry</a></li>
			<li><a href="ThUpdate.jsp">Theatre Update</a></li>
			<li><a href="ThDelete.jsp">Theatre Delete</a></li>
			<li><a href="ThSearch.jsp">Theatre Search</a>
				<ul class="sub2">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a>
				</ul>
			</li>	
		</ul>
	</li>	
	<li><a href="#">Sale</a></li>
	</ul>

</body>
</html>