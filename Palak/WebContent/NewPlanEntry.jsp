<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Plan Entry</title>
</head>
<body bgcolor="pink">
<form action="NewPlanEntry" method="Get">
<Center>
<h1 bgcolor="red"><u> New Plan Entry Form </u></h1>
<table>
<tr>
	<td>Select Plan Type :</td>
	<td><select name="PlanType">
			<option value="DDS">Daily Deposit Plan</option>
			<option value="RD">Recurring Deposit Plan</option>
			<option value="FD">Fixed Deposit Plan</option>
			<option value="MIS">MIS (Monthly Income Plan)</option>
			<optionvalue="Child">Child Scho Plan<option>
			<option value="Pension">Pension Plan</option>
			</select>
	</td>
	<td>Select Plan Category</td>
	<td><select name="PlanCategory">
			<option>Normal</option>
			<option>Special</option>
		</select>
</tr>
<tr>
	<td>Enter Plan Duration</td>
	<td><select name="PlanDuration">
			<option value="0.5">6 Month</option>
			<option value="1">1 Year</option>
			<option value="2">2 Year</option>
			<option value="3">3 Year</option>
			<option value="4">4 Year</option>
			<option value="5">5 Year</option>
		</select>
	</td>
</tr>
<tr>
	<td>Enter Consideration Amount</td>
	<td><input type="text" name="ConsidAmt"></td>
</tr>
<tr>
	<td>Enter Monthly Installment Amount</td>
	<td><input type="text" name="MonthAmt"></td>
	<td>Enter Quarterly Installment Amount</td>
	<td><input type="text" name="QtrlyAmt"></td>
</tr>
<tr>
	<td>Enter Half Yearly Installment Amount</td>
	<td><input type="text" name="HyrlyAmt"></td>
	<td>Enter Yearly Installment Amount</td>
	<td><input type="text" name="YrlyAmt"></td>
</tr>
<tr>
	<td>Enter Maturity Amount</td>
	<td><input type="text" name="MatAmt"></td>
	<td>Enter Promotive Quota %</td>
	<td><input type="text" name="QuotaPercent">
	
</tr>
<tr>
	<td>Interest Percentage (%)</td>
	<td><input type="text" name="InterestPercent">
	
</tr>
</table>
<table>
<tr>
	<td><input type="submit" name="SavePlan" value="save"></td>
	<td><input type="submit" name="EditPlan" value="Edit"></td>
	<td><input type="submit" name="DisplayPlan" value="Display"></td>
	<td><input type="submit" name="PrintPlan" value="PrintPlan"></td>
	<td bgcolor="red"><input type="submit" name="DeletePlan" value="DeletePlan"></td>
	<td><input type="submit" name="AllPlanReport" value="Print All Plan"></td>
</tr>
</table>

</Center>
</form>
</body>
</html>