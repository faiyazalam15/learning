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
			<option>DDS</option>
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
			<option>6 Month</option>
			<option>1 Year</option>
			<option>2 Year</option>
			<option>3 Year</option>
			<option>4 Year</option>
			<option>5 Year</option>
		</select>
	</td>
	<td>Commission Year From :</td>
	<td><select name="com_year_from">
			<option>6 Month</option>
			<option>1 Year</option>
			<option>2 Year</option>
			<option>3 Year</option>
			<option>4 Year</option>
			<option>5 Year</option>
		</select>
	</td>
	<td>Commission Year To :</td>
	<td><select name="com_year_to">
			<option>6 Month</option>
			<option>1 Year</option>
			<option>2 Year</option>
			<option>3 Year</option>
			<option>4 Year</option>
			<option>5 Year</option>
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
		<td><input type="text" name="Rank1" value="Executive" readOnly></td>
		<td><input type="text" name="wght1"></td>
		<td><input type="text" name="Commission1"></td>
	</tr>
<tr>
		<td><input type="text" name="Sno2" value="2" readOnly></td>
		<td><input type="text" name="Rank2" value="Sr.Executive" readOnly></td>
		<td><input type="text" name="wght2"></td>
		<td><input type="text" name="Commission2"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno3" value="3" readOnly></td>
		<td><input type="text" name="Rank3" value="Development Manager" readOnly></td>
		<td><input type="text" name="wght3"></td>
		<td><input type="text" name="Commission3"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno4" value="4" readOnly></td>
		<td><input type="text" name="Rank4" value="Regional Manager" readOnly></td>
		<td><input type="text" name="wght1"></td>
		<td><input type="text" name="Commission4"></td>
	</tr>
	<tr>
		<td><input type="text" name="Sno5" value="5" readOnly></td>
		<td><input type="text" name="Rank5" value="Zonal Manager" readOnly></td>
		<td><input type="text" name="wght5"></td>
		<td><input type="text" name="Commission5"></td>
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