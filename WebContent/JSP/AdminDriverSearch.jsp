<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ride</title>
<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/IMAGES/Need.png">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/CSS/AdminDriver.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background: linear-gradient(to right, #efefbb, #d4d3dd);">	
	<div id="loading" style="width: 100%; height: 150%; position: absolute; background-color: black; margin: auto; text-align: center;">
		<img id="loading-image" style="margin-top: 13%; width: 20%;  " src="${pageContext.servletContext.contextPath}/IMAGES/Loader.gif" alt="Loading..." />
		<h2 style="text-align: center; color: white">Fetching driver details from database!</h2>
	</div>
	<div id="Big" style="visibility: hidden">
		<div id="myModal1" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<span class="close">&times;</span>
					<h3 style="text-align: center;">Add new drivers</h3>
				</div>
				<div class="modal-body">
					<form method="post" action="http://localhost:8080/TheDemo/S12" onsubmit="return MasterValidate1()">
						<table>
							<tr>
								<td colspan="3" align="center"><img
									src="${pageContext.servletContext.contextPath}/IMAGES/DriverAV.jpg" width=40% style="border-radius: 50%" /></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-user icon"></i></td><td> <strong>Name</strong></td><td>:&nbsp;&nbsp;&nbsp;<input  onkeyup="return ValidateName1()" id="Name1" type="text" name="Name1" placeholder="Name" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="NameMsg1" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-phone icon"></i></td><td> <strong>Contact Number</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return ValidateContact1()" id="Contact1" type="text" name="Contact1" placeholder="Contact Number" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="ContactMsg1" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-car"></i></td><td> <strong>Car Type</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return ValidateCT1()" id="CT" type="text" name="CarType"	placeholder="Car Type" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="CarType" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-car"></i></td><td> <strong>Car Number</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return ValidateCN1()" id="CN" type="text" name="CarNumber"	placeholder="Car Number" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="CarNumber" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>							
							<tr>
								<td colspan="3" align="center"><input type="submit"	value="Add" name="submit" class="But1" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="myModal2" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<span class="close">&times;</span>
					<h3 style="text-align: center;">Delete drivers</h3>
				</div>
				<div class="modal-body">
					<form method="post" action="http://localhost:8080/TheDemo/S13" onsubmit="return MasterValidate2()">
						<table>
							<tr>
								<td colspan="3" align="center"><img
									src="${pageContext.servletContext.contextPath}/IMAGES/DriverAV.jpg" width=40% style="border-radius: 50%" /></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-user icon"></i></td><td> <strong>Name</strong></td><td>:&nbsp;&nbsp;&nbsp;<input  onkeyup="return ValidateName2()" id="Name2" type="text" name="Name2" placeholder="Name" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="NameMsg2" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-phone icon"></i></td><td> <strong>Contact Number</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return ValidateContact2()" id="Contact2" type="text" name="Contact2" placeholder="Contact Number" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="ContactMsg2" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>														
							<tr>
								<td colspan="3" align="center"><input type="submit"	value="Delete" name="submit" class="But1" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="myModal3" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<span class="close">&times;</span>
					<h3 style="text-align: center;">Delete drivers</h3>
				</div>
				<div class="modal-body">
					<form method="post" action="http://localhost:8080/TheDemo/S14" onsubmit="return MasterValidate3()">
						<table>
							<tr>
								<td colspan="3" align="center"><img
									src="${pageContext.servletContext.contextPath}/IMAGES/DriverAV.jpg" width=40% style="border-radius: 50%" /></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-user icon"></i></td><td> <strong>Name</strong></td><td>:&nbsp;&nbsp;&nbsp;<input  onkeyup="return ValidateName3()" id="Name3" type="text" name="Name3" placeholder="Name" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="NameMsg3" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-phone icon"></i></td><td> <strong>Contact Number</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return ValidateContact3()" id="Contact3" type="text" name="Contact3" placeholder="Contact Number" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="ContactMsg3" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>														
							<tr>
								<td colspan="3" align="center"><input type="submit"	value="Search" name="submit" class="But1" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="myModal4" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<span class="close">&times;</span>
					<h3 style="text-align: center;">Admin Status</h3>
				</div>
				<div class="modal-body">
					<table>
							<tr>
								<td colspan="2" align="center"><img src="${pageContext.servletContext.contextPath}/IMAGES/Avatar.png" width=40% style="border-radius: 50%"/></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><hr></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><h4 style="color: black">${Message}</h4></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><hr></td>
							</tr>						
					</table>							
				</div>			
			</div>
		</div>
		<div id="d2">
			<ul>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminIndexLog.jsp"> Home <i class="fa fa-home"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminCustomer.jsp"> View Customers <i class="fa fa-address-card"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminDriver.jsp"  class="active1"> View And Add Drivers <i class="fa fa-address-card"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminJourney.jsp"> View Journey Details <i class="fa fa-address-card"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminRevenue.jsp"> View Revenue And Sales <i class="fa fa-address-card"></i></a></li>
				
				<li style="float: right;"><a href="${pageContext.servletContext.contextPath}/JSP/IndexOutSuccess.jsp"> Log Out <i class="fa fa-sign-out"></i></a></li>
				<li style="float: right;"><a> Admin <i class="fa fa-user"></i></a></li>
			</ul>
		</div>		
		<div>
			<h1 style="text-align: center; color: black">Driver Details</h1>			
			<div style="text-align: center; margin-top: 2%">			
				<form method="post" action="${pageContext.servletContext.contextPath}/JSP/AdminDriverSort.jsp">
					<label for="Sort">Sort table : </label>
					<select name="Sort" id="Sort">
					  	<option value="ASC">Name in Ascending</option>
					  	<option value="DSC">Name in Descending</option>	
					  	<option value="RAT">By Rating</option>					  	
					</select>
					<input type="submit" name="submit" value="sort" class="But"/>
				</form>
				<div id="Buttons"><div style="margin: 2%"><button class="But" id="B1">Add</button></div><div style="margin: 2%"><button class="But" id="B2">Delete</button></div><div style="margin: 2%"><button class="But" id="B3">Search</button></div></div>
			</div>
			<table id="customers" style="margin-top: 2%">
				<tr id="Head">
					<th>Number</th>
					<th>Name</th>
					<th>Contact Number</th>
					<th>Vehicle Type</th>
					<th>Vehicle Number</th>
					<th>Rating</th>
				</tr>
				<%
					HttpSession sessionAdmin=request.getSession(); 
					request.setAttribute("Driver", (String)sessionAdmin.getAttribute("Dr"));  
					request.setAttribute("DriverPhone", (String)sessionAdmin.getAttribute("PN"));  
					request.setAttribute("CarType", (String)sessionAdmin.getAttribute("CT"));  
					request.setAttribute("CarNumber", (String)sessionAdmin.getAttribute("CN"));  
					request.setAttribute("Rating", (String)sessionAdmin.getAttribute("Rt"));					
				%>					
		   		<tr>
					<td>1</td>
					<td>${Driver}</td>
					<td>${DriverPhone}</td>
					<td>${CarType}</td>
					<td>${CarNumber}</td>
					<td>${Rating}</td>
				</tr>					    	
			</table>			
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/JS/Driver.js"></script>
<script>
	$(document).ready(function() {
		window.setTimeout("FadeOUT();", 3000); 
		window.setTimeout("FadeIN();", 3000);	
		
	})
	
	function FadeOUT() {
		$("#loading").fadeOut('slow');
	}
	
	function FadeIN() {
		$("#Big").css({"visibility":"visible"});
		$("#Big").fadeIn('slow');
		modal4.style.display = "block";
	}
	
	var modal1 = document.getElementById("myModal1");
	
	var modal2 = document.getElementById("myModal2");
	
	var modal3 = document.getElementById("myModal3");
	
	var modal4 = document.getElementById("myModal4");

	var btn1 = document.getElementById("B1");
	
	var btn2 = document.getElementById("B2");
	
	var btn3 = document.getElementById("B3");

	var span = document.getElementsByClassName("close");

	btn1.onclick = function() {
		modal1.style.display = "block";
	}
	btn2.onclick = function() {
		modal2.style.display = "block";
	}
	btn3.onclick = function() {
		modal3.style.display = "block";
	}
	span[0].onclick = function() {
		modal1.style.display = "none";
	}
	span[1].onclick = function() {
		modal2.style.display = "none";
	}
	span[2].onclick = function() {
		modal3.style.display = "none";
	}
	span[3].onclick = function() {
		modal4.style.display = "none";
	}
	window.onclick = function(event) {
		if (event.target == modal1 || event.target == modal2 || event.target == modal3 || event.target == modal4) {
			modal1.style.display = "none";
			modal2.style.display = "none";
			modal3.style.display = "none";
			modal4.style.display = "none";
		}
	}
</script>
</html>