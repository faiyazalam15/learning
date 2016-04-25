<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.text.SimpleDateFormat,java.util.Calendar,java.util.GregorianCalendar;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript">

function loadXMLDoc() 
{
	
	var xmlhttp;
	var keys = document.vinform.RdNo.value;
	var urls = "http://localhost:8082/Palak/renewalDB.jsp?ok=" + keys;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() 
	{
		if (xmlhttp.readyState == 4) {
			var some = xmlhttp.responseXML.documentElement;
			//document.getElementById("a").value=some.getElementsByTagName("empno")[0].childNodes[0].nodeValue;
			document.getElementById("b").value = some
					.getElementsByTagName("mem")[0].childNodes[0].nodeValue;
			document.getElementById("c").value = some
					.getElementsByTagName("ptype")[0].childNodes[0].nodeValue;
			document.getElementById("d").value = some
					.getElementsByTagName("pcat")[0].childNodes[0].nodeValue;
			document.getElementById("e").value = some
					.getElementsByTagName("pdur")[0].childNodes[0].nodeValue;
			document.getElementById("f").value = some
					.getElementsByTagName("camt")[0].childNodes[0].nodeValue;
			document.getElementById("g").value = some
					.getElementsByTagName("insmode")[0].childNodes[0].nodeValue;
			document.getElementById("h").value = some
					.getElementsByTagName("insamt")[0].childNodes[0].nodeValue;
			document.getElementById("i").value = some
			.getElementsByTagName("matdtd")[0].childNodes[0].nodeValue;
			document.getElementById("j").value = some
			.getElementsByTagName("rddue")[0].childNodes[0].nodeValue;
			document.getElementById("k").value = some
			.getElementsByTagName("nextdue")[0].childNodes[0].nodeValue;
			document.getElementById("ll").value = some
			.getElementsByTagName("instno")[0].childNodes[0].nodeValue;
			document.getElementById("m").value = some
			.getElementsByTagName("agcod")[0].childNodes[0].nodeValue;
			document.getElementById("n").value = some
			.getElementsByTagName("agnam")[0].childNodes[0].nodeValue;
			document.getElementById("o").value = some
			.getElementsByTagName("agrnk")[0].childNodes[0].nodeValue;
			document.getElementById("p").value = some
			.getElementsByTagName("intrcd")[0].childNodes[0].nodeValue;
			document.getElementById("q").value = some
			.getElementsByTagName("intrnm")[0].childNodes[0].nodeValue;
			document.getElementById("r").value = some
			.getElementsByTagName("intrornk")[0].childNodes[0].nodeValue;
		}
	}
	xmlhttp.open("GET", urls, true);
	xmlhttp.send();
}

</script>
<body>
<%
Calendar calendar = new GregorianCalendar();
SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
String currentDate = sdf.format(calendar.getTime());
%>
<center>
<form name="vinform" action="Renewal">
<h1>Renewal Entry Form</h1>
<table>
	<tr>
		<td>Current Date</td>
		<td><input type="text" name="currentdate" value="<%=currentDate%>"></td>
	</tr>
	
	<tr>
		<td>Rd A/c Number</td>
		<td><input type="text" name="RdNo" onkeyup="loadXMLDoc()"></td>
		<td>Rd A/c Holder's Name</td>
		<td><input type="text" name="Memname" id="b" readonly="readonly"></td>
	</tr>
	<tr>
		<td>Plan Type</td>
		<td><input type="text"name="PlanType" id="c" readonly="readonly"></td>
		<td>Plan Category</td>
		<td><input type="text" name="PlanCategory" id="d" readonly="readonly"></td>
	</tr>
	<tr>
		<td>Plan Duration</td>
		<td><input type="text" name="PlanDuration" id="e" readonly="readonly">
		<td>Consideration Amount</td>
		<td><input type="text" name="ConsidAmt" id="f" readonly="readonly"></td>
	</tr>
	<tr>
		<td>Installment Mode</td>
		<td><input type="text" name="InstallmentMode" id="g" readonly="readonly"></td>
		<td>Installment Amount</td>
		<td><input type="text" name="installmentAmt" id="h" readonly="readonly"></td>
	</tr>
	<tr>
		<td>Installment Number</td>
		<td><input type="text" name="InstallmentNo" id="ll"></td>
		<td>Due Date</td>
		<td><input type="text" name="DueDate" id="j"></td>
	</tr>
	<tr>
		<td>Next Due Date</td>
		<td><input type="text" name="NextDueDate" id="k">
		<td>Maturity Date</td>
		<td><input type="text" name="MatDate" ID="i" readonly="readonly"></td>
	</tr>
	<tr>
		<td>Agent Code</td>
		<td><input type="text" name="AentCode" id="m" readonly="readonly">
		<td>Agent Name</td>
		<td><input type="text" name="AgentName" id="n" readonly="readonly"></td>
	</tr>
	<tr>
		<td>Agent Rank</td>
		<td><input type="text" name="rank" id="o" readonly="readonly"></td>
		<td>Intro code</td>
		<td><input type="text" name="Introcd" id="p" readonly="readonly"></td>
	</tr>
	<tr>
		<td>Intro Name</td>
		<td><input type="text" name="intronm" id="q" readonly="readonly"></td>
		<td>Intro Rank</td>
		<td><input type="text" name="intrornk" id="r" readonly="readonly"></td>
	</tr>
		
	<!-- <tr>
		<td>no. of Installment Deposited</td>
		<td><input type="text" name="noidep"></td>
	</tr>
 -->	<tr>
	<td><input type="submit" value="Submit"></td>
	<td><input type="reset" value="Clear"></td>
	</tr>
</table>
</form>
</center>
</body>