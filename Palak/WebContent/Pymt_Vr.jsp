<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="Mystyle.css">
<title>Insert title here</title>
</head>
<body>
<center>
<h2>Company Name</h2>
<h3> Payment Voucher Entry Form </h3>
<form id="Pymtvr">
<table><br/><br/><br/>
	<tr>
		<td>Date</td>
		<td><input type="date" name="date"></td>
		<td>Account Group</td>
		<td><select>
				<option>Assets</option>
				<option>Liabilities</option>
				<option>Debtors</option>
				<option>Creditors</option>
				<option>Direct Income</option>
				<option>Indirect Income</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>Ledger</td>
		<td><select>
		   		<option>Fixed Assets</option>
		   		<option>Current Assets</option>
		   		<option>Sale of Stationary</option>
		   		<option>Loan Installment Received</option>
		   		<option>Salary Advance</option>
		   </select>
		 </td>
		 <td>Sub Ledger</td>
		 <td><select>
		 		<option>Building</option>
		 		<option>Furniture & Fixture</option>
		 		<option>Pramod Nawle</option>
		 		<option>Bhupendra Singh Chouhan</option>
		 		<option>Palak Nawle</option>
		 		<option>Deeksha Nawle</option>
		 	</select>
		 </td>
	</tr>
	</tr>
	<tr>
			<td>Discription</td>
		 <td><textarea rows="10" cols="75" ></textarea>
	</tr>
	
	<tr>
	  	<td>Amount Paid</td>
		<td><input type="text" name="amount"></td>
	</tr>
</table>
	<input type="submit" name="submit" value="save & Print Voucher">
	<input type="reset" name="reset" value="Cancel Voucher">
</form>
	
</center>

</body>
</html>