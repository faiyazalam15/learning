<%@ page import="com.sun.crypto.provider.RSACipher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="Mystyle.css">
<script type="text/javascript" src="jquery.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$("document").ready(function(){
	$("#simpledate").click(function(){
		$("#simpledate").fadeOut();
	})
});
		function loadXMLDoc() {
		var xmlhttp;
		var keys = document.vinform.MemCode.value;
		var urls = "http://localhost:8082/Palak/mem_db_fetch.jsp?ok=" + keys;
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
						.getElementsByTagName("empname")[0].childNodes[0].nodeValue;
				document.getElementById("c").value = some
						.getElementsByTagName("empaddr")[0].childNodes[0].nodeValue;
			}
		}
		xmlhttp.open("GET", urls, true);
		xmlhttp.send();
	}

	function loadAssociateCode() {
		var xmlhttp;
		var k = document.vinform.AgentCode.value;
		var urls = "http://localhost:8082/Palak/AgentDB.jsp?ok1=" + k;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				var some = xmlhttp.responseXML.documentElement;
				document.getElementById("d").value = some
						.getElementsByTagName("empaddr")[0].childNodes[0].nodeValue;
				document.getElementById("e").value = some
						.getElementsByTagName("rank")[0].childNodes[0].nodeValue;
				document.getElementById("f").value = some
						.getElementsByTagName("intro")[0].childNodes[0].nodeValue;
				document.getElementById("g").value = some
						.getElementsByTagName("intrnm")[0].childNodes[0].nodeValue;
				document.getElementById("h").value = some
						.getElementsByTagName("intrnk")[0].childNodes[0].nodeValue;
			}
		}
		xmlhttp.open("GET", urls, true);
		xmlhttp.send();
	}
	
		
	function calculation()
	{
		var val = document.vinform.ConsidAmt.value;
		var v = document.vinform.PlanDuration.value;
		var selects = document.getElementById("myselect");
		var selectedText = selects.options[selects.selectedIndex].text;
		if (selectedText == "FD")
		{

			var selects = document.getElementById("pcat");
			var selectedText = selects.options[selects.selectedIndex].text;
			if(selectedText=="Normal")
			{
				if(v==1)
				{
					var res=val*9.5*v/100;
					var rs=res+parseInt(val);
					document.getElementById("fdmt").value=parseInt(rs);
				}
				else
					if(v==2)
					{   
						
						var rs= parseInt(val)*(Math.pow(1+10/100,2));
						document.getElementById("fdmt").value=parseInt(rs);
			
					}//A=P*math.pow(1+r/n)n*t)
					else
						if(v==3)
						{
							var rs= parseInt(val)*(Math.pow(1+10.75/100,3));
							document.getElementById("fdmt").value=parseInt(rs);
						}
						else
							if(v==4)
							{
								var rs= parseInt(val)*(Math.pow(1+11/100,4));
								document.getElementById("fdmt").value=parseInt(rs);
							}
							else
								if(v==5)
								{
									var rs= parseInt(val)*(Math.pow(1+11.25/100,5));
									document.getElementById("fdmt").value=parseInt(rs);
								}
						
			}
			
		
		}
		else 
		if (selectedText == "RD")
		{
				var selects = document.getElementById("mode1");
				var selectedText = selects.options[selects.selectedIndex].text;
					if(selectedText=="Daily")
					{
						var mode = document.vinform.InstallmentMode.value;
						var d=(val/mode)/v;
						if(d<10)
						document.getElementById("ins").value="No accepted";
						else
						if(v>=2&&d<10)
							document.getElementById("ins").value="No accepted";
						else
						document.getElementById("ins").value=parseInt(d);
						
						if(v==1)
						{

							var f1=Math.pow(1+9.5/400,4);
							var f2=1-(Math.pow((1+9.5/400),-1/3));
							var f3=(f1-1)*d*30;
							result=f3/f2;
							document.getElementById("mt").value=parseInt(result);
 						}
						else
						if(v==2)
						{
								var f1=Math.pow(1+10/400,8);
								var f2=1-(Math.pow((1+10/400),-1/3));
								var f3=(f1-1)*d*30;
								result=f3/f2;
								document.getElementById("mt").value=parseInt(result);
						}
						else
						if(v==3)
						{
								var f1=Math.pow(1+10.75/400,12);
								var f2=1-(Math.pow((1+10.75/400),-1/3));
								var f3=(f1-1)*d*30;
								result=f3/f2;
								document.getElementById("mt").value=parseInt(result);
						}
						else							
						if(v==4)
						{
							var f1=Math.pow(1+11/400,16);
							var f2=1-(Math.pow((1+11/400),-1/3));
							var f3=(f1-1)*d*30;
									result=f3/f2;
									document.getElementById("mt").value=parseInt(result);
							
						}
						else							
							if(v==5)
							{
								var f1=Math.pow(1+11.5/400,20);
								var f2=1-(Math.pow((1+11.5/400),-1/3));
								var f3=(f1-1)*d*30;
										result=f3/f2;
										document.getElementById("mt").value=parseInt(result);
								
							}
					}
					else
						if(selectedText=="Monthly")
						{
							var mode = document.vinform.InstallmentMode.value;
							var d=(val/mode)/v;
							if(d<10)
							document.getElementById("ins").value="No accepted";
							else
							if(v>=2&&d<10)
								document.getElementById("ins").value="No accepted";
							else
							document.getElementById("ins").value=d;
							
							if(v==1)
							{

								var f1=Math.pow(1+9.5/400,4);
								var f2=1-(Math.pow((1+9.5/400),-1/3));
								var f3=(f1-1)*d;
								result=f3/f2;
								document.getElementById("mt").value=parseInt(result);
	 						}
							else
							if(v==2)
							{
									var f1=Math.pow(1+10/400,8);
									var f2=1-(Math.pow((1+10/400),-1/3));
									var f3=(f1-1)*d;
									result=f3/f2;
									document.getElementById("mt").value=parseInt(result);
							}
							else
							if(v==3)
							{
									var f1=Math.pow(1+10.75/400,12);
									var f2=1-(Math.pow((1+10.75/400),-1/3));
									var f3=(f1-1)*d;
									result=f3/f2;
									document.getElementById("mt").value=parseInt(result);
							}
							else							
							if(v==4)
							{
								var f1=Math.pow(1+11/400,16);
								var f2=1-(Math.pow((1+11/400),-1/3));
								var f3=(f1-1)*d;
										result=f3/f2;
										document.getElementById("mt").value=parseInt(result);
								
							}
							else							
								if(v==5)
								{
									var f1=Math.pow(1+11.5/400,20);
									var f2=1-(Math.pow((1+11.5/400),-1/3));
									var f3=(f1-1)*d;
											result=f3/f2;
											document.getElementById("mt").value=parseInt(result);
									
								}
						}
						else
							if(selectedText=="Quarterly")
							{
								var mode = document.vinform.InstallmentMode.value;
								var d=(val/mode)/v;
								if(d<10)
								document.getElementById("ins").value="No accepted";
								else
								if(v>=2&&d<10)
									document.getElementById("ins").value="No accepted";
								else
								document.getElementById("ins").value=d;
								
								if(v==1)
								{

									var f1=Math.pow(1+9.5/400,4);
									var f2=1-(Math.pow((1+9.5/400),-1/3));
									var f3=(f1-1)*d/3;
									result=f3/f2;
									document.getElementById("mt").value=parseInt(result);
		 						}
								else
								if(v==2)
								{
										var f1=Math.pow(1+10/400,8);
										var f2=1-(Math.pow((1+10/400),-1/3));
										var f3=(f1-1)*d/3;
										result=f3/f2;
										document.getElementById("mt").value=parseInt(result);
								}
								else
								if(v==3)
								{
										var f1=Math.pow(1+10.75/400,12);
										var f2=1-(Math.pow((1+10.75/400),-1/3));
										var f3=(f1-1)*d/3;
										result=f3/f2;
										document.getElementById("mt").value=parseInt(result);
								}
								else							
								if(v==4)
								{
									var f1=Math.pow(1+11/400,16);
									var f2=1-(Math.pow((1+11/400),-1/3));
									var f3=(f1-1)*d/3;
											result=f3/f2;
											document.getElementById("mt").value=parseInt(result);
									
								}
								else							
									if(v==5)
									{
										var f1=Math.pow(1+11.5/400,20);
										var f2=1-(Math.pow((1+11.5/400),-1/3));
										var f3=(f1-1)*d/3;
												result=f3/f2;
												document.getElementById("mt").value=parseInt(result);
										
									}
							}
							else
								if(selectedText=="Half Yearly")
								{
									var mode = document.vinform.InstallmentMode.value;
									var d=(val/mode)/v;
									if(d<10)
									document.getElementById("ins").value="No accepted";
									else
									if(v>=2&&d<10)
										document.getElementById("ins").value="No accepted";
									else
									document.getElementById("ins").value=d;
									
									if(v==1)
									{

										var f1=Math.pow(1+9.5/400,4);
										var f2=1-(Math.pow((1+9.5/400),-1/3));
										var f3=(f1-1)*d/6;
										result=f3/f2;
										document.getElementById("mt").value=parseInt(result);
			 						}
									else
									if(v==2)
									{
											var f1=Math.pow(1+10/400,8);
											var f2=1-(Math.pow((1+10/400),-1/3));
											var f3=(f1-1)*d/6;
											result=f3/f2;
											document.getElementById("mt").value=parseInt(result);
									}
									else
									if(v==3)
									{
											var f1=Math.pow(1+10.75/400,12);
											var f2=1-(Math.pow((1+10.75/400),-1/3));
											var f3=(f1-1)*d/6;
											result=f3/f2;
											document.getElementById("mt").value=parseInt(result);
									}
									else							
									if(v==4)
									{
										var f1=Math.pow(1+11/400,16);
										var f2=1-(Math.pow((1+11/400),-1/3));
										var f3=(f1-1)*d/6;
												result=f3/f2;
												document.getElementById("mt").value=parseInt(result);
										
									}
									else							
										if(v==5)
										{
											var f1=Math.pow(1+11.5/400,20);
											var f2=1-(Math.pow((1+11.5/400),-1/3));
											var f3=(f1-1)*d/6;
													result=f3/f2;
													document.getElementById("mt").value=parseInt(result);
											
										}
								}
				
								else
									if(selectedText=="Yearly")
									{
										var mode = document.vinform.InstallmentMode.value;
										var d=(val/mode)/v;
										if(d<10)
										document.getElementById("ins").value="No accepted";
										else
										if(v>=2&&d<10)
											document.getElementById("ins").value="No accepted";
										else
										document.getElementById("ins").value=d;
										
										if(v==1)
										{

											var f1=Math.pow(1+9.5/400,4);
											var f2=1-(Math.pow((1+9.5/400),-1/3));
											var f3=(f1-1)*d/12;
											result=f3/f2;
											document.getElementById("mt").value=parseInt(result);
				 						}
										else
										if(v==2)
										{
												var f1=Math.pow(1+10/400,8);
												var f2=1-(Math.pow((1+10/400),-1/3));
												var f3=(f1-1)*d/12;
												result=f3/f2;
												document.getElementById("mt").value=parseInt(result);
										}
										else
										if(v==3)
										{
												var f1=Math.pow(1+10.75/400,12);
												var f2=1-(Math.pow((1+10.75/400),-1/3));
												var f3=(f1-1)*d/12;
												result=f3/f2;
												document.getElementById("mt").value=parseInt(result);
										}
										else							
										if(v==4)
										{
											var f1=Math.pow(1+11/400,16);
											var f2=1-(Math.pow((1+11/400),-1/3));
											var f3=(f1-1)*d/12;
													result=f3/f2;
													document.getElementById("mt").value=parseInt(result);
											
										}
										else							
											if(v==5)
											{
												var f1=Math.pow(1+11.5/400,20);
												var f2=1-(Math.pow((1+11.5/400),-1/3));
												var f3=(f1-1)*d/12;
														result=f3/f2;
														document.getElementById("mt").value=parseInt(result);
												
											}
									}
					
					

				
			}
			
		else
			alert("Selected Plan is not Valid Please Select Valid Plan ");
	}
	
</script>
</head>
<body bgcolor="pink">


	<form action="account" method="get" name="vinform">
		<center>
			<table cellpadding="8" cellspacing="8" bgcolor="pink">
				<tr>
					<td>Member Opening Date</td>
					<td><input type="text" id="b"></td>
					<td><input type="text" id="simpledate"></td>

					<td>Members Code</td>
					<td><input type="text" name="MemCode" onkeyup="loadXMLDoc()"></td>
				</tr>
				<br />
				<tr>
					<td>Members Name</td>
					<td><input type="text" name="Mmname" id="c"></td>
				</tr>
				<br />
			</table>
			<table bgcolor="PINK" class="margin" width="500">
				<tr>
					<td>Select Plan Type :</td>
					<td><select name="PlanType" id="myselect" onchange="call()">
							<option value="DDS">DDS</option>
							<option value="RD">RD</option>
							<option value="FD">FD</option>
							<option value="MIS">MIS</option>
							<option value="CHILD">CHILD</option>
							<option value="Pension">Pension</option>
					</select></td>
					<td>Select Plan Category</td>
					<td><select name="PlanCategory" id="pcat">
							<option>Normal</option>
							<option>Special</option>
					</select>
				</tr>
				<tr>
					<td>Enter Plan Duration</td>
					<td><select name="PlanDuration" onchange="calculation()">
							<option value="6">6 Month</option>
							<option value="1">1 Year</option>
							<option value="2">2 Year</option>
							<option value="3">3 Year</option>
							<option value="4">4 Year</option>
							<option value="5">5 Year</option>
					</select></td>
				</tr>
				<tr>
					<td>Enter Consideration Amount</td>
					<td><input type="text" name="ConsidAmt" onkeyup="calculation()"></td>
				</tr>
			</table>
			<div id="mylocation"></div>
			</table>
			<table cellpadding="8" cellspacing="8" bgcolor="pink">
				<tr>
					<td><input type="submit" name="Continue" value="Save"></td>
					<td><input type="reset" name="reset" value="cancel"></td>
				</tr>
			</table>

		</center>
	</form>

	<script>
		function fdAccount() {
			var frm = "<center><table cellpadding='8' cellspacing='8' bgcolor='pink'><tr><td>Enter Maturity Amount</td><td><input type='text' id='fdmt' name='MatAmt'></td></tr><tr><td>Associate Code </td><td><input type='text' name='AgentCode' onkeyup='loadAssociateCode()'></td></tr><tr><td>Associate Name </td><td><input type='text' name='AgentName' id='d'></td></tr>"
				+ "<tr><td>Associates Rank</td>"
				+ "<td><input type='text' name='Rank' id='e'></td></tr>"
				+ "<td>Introducer Code</td>"
				+ "<td><input type='text' name='intrcd' id='f'></td>"
				+ "<tr><td>Introducer Name</td>"
				+ "<td><input type='text' name='intrname' id='g'></td>"
				+ "<td>Intro Rank</td>"
				+ "<td><input type='text' name='intrornk' id='h'></td>"
			"</table></center>";
			document.getElementById('mylocation').innerHTML = frm;
			var agnm1 = "(select agentname from agentmaster where agentcode=?)";
			
		}

		function RD_DDS() {
			var data = "<center><table cellpadding='8' cellspacing='8' bgcolor='pink'><tr>"
					+ "<td>Select Installment Mode</td>"
					+ "<td><select name='InstallmentMode' id='mode1' onchange='calculation()'>"
					+ "<option value='360'>Daily</option>"
					+ "<option value='12'>Monthly</option>"
					+ "<option value='4'>Quarterly</option>"
					+ "<option value='2'>Half Yearly</option>"
					+ "<option value='1'>Yearly</option>"
					+ "</select>"
					+ "</td>"
					+

					"</tr>"
					+ "<tr>"
					+ "<td>Installment Amount</td>"
					+ "<td><input type='text' name='installmentAmt' id='ins'></td>"
					+ "<td>Enter Maturity Amount</td>"
					+ "<td><input type='text' name='MatAmt' id='mt'></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>Associate Code </td>"
					+ "<td><input type='text' name='AgentCode' onkeyup='loadAssociateCode()'></td>"
					+ "<td>Associate's Name</td>"
					+ "<td><input type='text' name='AgentName' id='d'></td>"
					+ "</tr>"
					+ "<tr><td>Associates Rank</td>"
					+ "<td><input type='text' name='Rank' id='e'></tr>"
					+ "<td>Introducer Code</td>"
					+ "<td><input type='text' name='intrcd' id='f'></td>"
					+ "<tr><td>Introducer Name</td>"
					+ "<td><input type='text' name='intrname' id='g'></td>"
					+ "<td>Intro Rank</td>"
					+ "<td><input type='text' name='intrornk' id='h'></td>"
					+ "</tr></center>"
			document.getElementById('mylocation').innerHTML = data;
		}
		function call() {
			var selects = document.getElementById("myselect");
			/*var selectedValue = selects.options[selects.selectedIndex].value;// will gives u 2*/
			var selectedText = selects.options[selects.selectedIndex].text;// gives u value2
			if (selectedText == "FD")
				fdAccount();
			else if (selectedText == "RD")
				RD_DDS();
			else
				alert("Selected Plan is not Valid Please Select Valid Plan ");
		}
	</script>
</body>
</html>