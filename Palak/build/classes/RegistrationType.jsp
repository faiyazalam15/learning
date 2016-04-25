<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function call() 
{
			var selects = document.getElementById("myselect");
			/*var selectedValue = selects.options[selects.selectedIndex].value;// will gives u 2*/
			var selectedText = selects.options[selects.selectedIndex].text;// gives u value2
			confirm(selectedText);
			if (selectedText == "Members")
			window.location = "MemDetail.jsp";
			else if (selectedText == "Associates")
				window.location = "Enter_AgentID.jsp";
			else if (selectedText == "Accounts")
				window.location = "RdAccount.jsp";
			else if (selectedText == "Renewal")
				window.location = "RenewalEntry.jsp";
			else if (selectedText == "ReceiptVoucher")
				window.location = "Recpt_vr.jsp";
			else
				
				confirm("Selected Plan is not Valid Please Select Valid Plan ");
}
</script>	
</head>
<body>
<form action="MemberEntry.jsp" method="get">
<center>
<h1>Combine Registration</h1>
<table>
<tr>
	<td>Enter The Registration Type</td>
	<td><select id="myselect" onchange="call()">
	<option id="me" >Select...</option>
			<option id="me" >Members</option>
			<option value="AssociatesEntry">Associates</option>
			<option value ="Account Entry">Accounts</option>
			<option value="Renewal Entry">Renewal</option>
			<option value="Renewal Voucher">ReceiptVoucher</option>
			<option value ="SavingAccountEntry">Saving Account</option>
			<option value ="EmployeeEntry">Employee</option>
		</select>
</tr>

</table>

</center>
</form>
</body>
</html>