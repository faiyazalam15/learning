<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="pink">
<center>
<form action="AgentCommissionMaster" method="post">

<h1>Agent Commission Master</h1>

<table>

<tr>
	<td>Select Plan Type :</td>
	<td><select name="plantype">
			<option>Select Plan Type</option>
			<option>RD</option>
			<option>FD</option>
			<option>MIS</option>
			<option>Child</option>
			<option>Pension</option>
			</select>
	</td>
	<td>Select Plan Category</td>
	<td><select name="nrm_spcl">
			<option>Normal</option>
			<option>Special</option>
		</select>
</tr>
<tr>
	<td>Enter Plan Duration</td>
	<td><select name="Duration">
			<option>Select Duration</option>
			<option>1 </option>
			<option>2 </option>
			<option>3</option>
			<option>4 </option>
			<option>5 </option>
			<option>6 </option>
		</select>
	</td>
	<td>Commission Year From :</td>
	<td><select name="com_year_from">
			<option>Select Commission Year</option>
			<option>1</option>
			<option>2 </option>
			<option>3 </option>
			<option>4 </option>
			<option>5</option>
			<option>6</option>
		</select>
	</td>
	<td>Commission Year To :</td>
	<td><select name="com_year_to">
			<option>Select Commission Year </option>
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
			<option>6</option>
		</select>
	</td>
</tr>
</table>
<table>
	<tr bgcolor="gray">
		<td>S.No.</td>
		<td>Rank</td>
		<td>Weightage (%)</td>
		<td>Commission (%)</td>
	</tr>
	
	<tr>
		<td><input type="text" name="Sno1" value="1" readOnly></td>
		<td><input type="text" name="Rank1" value="Advisor" readOnly></td>
		<td><input type="text" name="wght1"></td>
		<td><input type="text" name="Commission1"></td>
	</tr>
<tr>
		<td><input type="text" name="Sno2" value="2" readOnly></td>
		<td><input type="text" name="Rank2" value="Sales Executive" readOnly></td>
		<td><input type="text" name="wght2"></td>
		<td><input type="text" name="Commission2"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno3" value="3" readOnly></td>
		<td><input type="text" name="Rank3" value="Sales Officer" readOnly></td>
		<td><input type="text" name="wght3"></td>
		<td><input type="text" name="Commission3"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno4" value="4" readOnly></td>
		<td><input type="text" name="Rank4" value="Sr.Sales Officer" readOnly></td>
		<td><input type="text" name="wght4"></td>
		<td><input type="text" name="Commission4"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno5" value="5" readOnly></td>
		<td><input type="text" name="Rank5" value="Assistant Sales Manager" readOnly></td>
		<td><input type="text" name="wght5"></td>
		<td><input type="text" name="Commission5"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno6" value="6" readOnly></td>
		<td><input type="text" name="Rank6" value=" Sales Manager" readOnly></td>
		<td><input type="text" name="wght6"></td>
		<td><input type="text" name="Commission6"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno7" value="7" readOnly></td>
		<td><input type="text" name="Rank7" value="Sr. Sales Manager" readOnly></td>
		<td><input type="text" name="wght7"></td>
		<td><input type="text" name="Commission7"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno8" value="8" readOnly></td>
		<td><input type="text" name="Rank8" value="Business Manager" readOnly></td>
		<td><input type="text" name="wght8"></td>
		<td><input type="text" name="Commission8"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno9" value="9" readOnly></td>
		<td><input type="text" name="Rank9" value="Development Manager" readOnly></td>
		<td><input type="text" name="wght9"></td>
		<td><input type="text" name="Commission9"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno10" value="10" readOnly></td>
		<td><input type="text" name="Rank10" value="Territory Manager" readOnly></td>
		<td><input type="text" name="wght10"></td>
		<td><input type="text" name="Commission10"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno11" value="11" readOnly></td>
		<td><input type="text" name="Rank11" value="Area Manager" readOnly></td>
		<td><input type="text" name="wght11"></td>
		<td><input type="text" name="Commission11"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno12" value="12" readOnly></td>
		<td><input type="text" name="Rank12" value="Regional Manager" readOnly></td>
		<td><input type="text" name="wght12"></td>
		<td><input type="text" name="Commission12"></td>
	</tr>
</table>
<table>
	<tr>
		<td><input type="submit" name="AgntMstSave" value="Save"></td>
		<td><input type="button" name="AgntMstUpdt" value="Update"></td>
		<td><input type="button" name="AgntMstDelete" value="Delete"></td>
		<td><input type="reset" name="AgntMstReset" value="Reset"></td>
	</tr>
</table>
</form>	
</center>
</body>
</html>