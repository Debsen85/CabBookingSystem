<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cab Service</title>
	<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/IMAGES/Need.png">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/CSS/Arrived.css">
	<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		HttpSession sessionLog=request.getSession(); 
	
		String Name=(String)sessionLog.getAttribute("Name");
		String Age=(String)sessionLog.getAttribute("Age");
		String Email=(String)sessionLog.getAttribute("Email");
		String Username=(String)sessionLog.getAttribute("User");
		String Number=(String)sessionLog.getAttribute("Phone");
		
		HttpSession sessionDriver=request.getSession();
		
		String OTP=(String)sessionDriver.getAttribute("OTP");
		request.setAttribute("OTP", OTP);	
		
		request.setAttribute("User", Name);	
		request.setAttribute("Name", Name);	
		request.setAttribute("Age", Age);	
		request.setAttribute("Email", Email);	
		request.setAttribute("Phone", Number);	
		request.setAttribute("Username", Username);	
	%>
	<div id="loading">
		<img id="loading-image" src="<%=request.getContextPath()%>/IMAGES/Loader.gif" alt="Loading..." />
		<h2 style="text-align: center; color: white">Authenticating Process!</h2>
	</div>
	<div id="Big" style="visibility: hidden">
		<div id="d2">
			<ul>
				<li><a id="B1"> Profile <i class="fa fa-bars"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/IndexLog.jsp"> Home <i class="fa fa-home"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/About.jsp"> About <i class="fa fa-cloud"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/Contact.jsp"> Contact <i class="fa fa-envelope"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/Service.jsp"  class="active1"> Service <i class="fa fa-edit"></i></a></li>

				<li style="float: right;"><a href="<%=request.getContextPath()%>/JSP/IndexOutSuccess.jsp"> Log Out <i class="fa fa-sign-out"></i></a></li>
				<li style="float: right;"><label> ${User} <i class="fa fa-user"></i></label></li>
			</ul>
		</div>
		<div class="Back">
			<img src="<%=request.getContextPath()%>/IMAGES/Back10.jpg" style="width: 100%" class="img" id="Im1">			
			<div class="main">
				<h1 style="text-align: center">Thank you for using our cab services.</h1>
				<hr>	
					<div class="card" id="Hello1">
						<img src="https://media.giphy.com/media/tf9jjMcO77YzV4YPwE/giphy.gif" style="width:90%; border-radius: 15px"/>
						<h3>Journey Status</h3>
						<hr>					
						<p style="text-align: center;">Verification</p>	
						<p><input style="display:none" id="Main" type="text" value="${OTP}" />
						<p><input type="text" style="text-align:center; background-color: lightblue" id="Ver" placeholder="OTP" required/></p>	
						<p style="text-align: center; color: red;"><span id="Error"></span></p>
						<p><input type="submit" id="sub" value="Verify" onclick="Verify()"/></p>			
					</div>				
				<br>
				<h4 style="text-align: center" id="Timer"></h4>				
			</div>
		</div>
		<div id="myModal2" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<span class="close">&times;</span>
					<h3 style="text-align: center;">Profile</h3>
				</div>
				<div class="modal-body">
					<form method="post" action="S1">
						<table>
							<tr>
								<td colspan="3" align="center"><img	src="<%=request.getContextPath()%>/IMAGES/Avatar3.png" width=40% style="border-radius: 50%" /></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-user icon"></i></td><td> <strong>Name</strong></td><td>:&nbsp;&nbsp;&nbsp;${Name}</td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-user icon"></i></td><td> <strong>Age</strong></td><td>:&nbsp;&nbsp;&nbsp;${Age}</td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-envelope icon"></i></td><td> <strong>E-mail ID</strong></td><td>:&nbsp;&nbsp;&nbsp;${Email}</td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-phone icon"></i></td><td> <strong>Phone Number</strong></td><td>:&nbsp;&nbsp;&nbsp;${Phone}</td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-user icon"></i></td><td> <strong>Username</strong></td><td>:&nbsp;&nbsp;&nbsp;${Username}</td>
							</tr>	
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>						
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
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
		}
		
		var modal1 = document.getElementById("myModal2");	

		var btn1 = document.getElementById("B1");
		
		var span = document.getElementsByClassName("close");

		btn1.onclick = function() {
			modal1.style.display = "block";
		}
		
		span[0].onclick = function() {
			modal1.style.display = "none";
		}
		
		window.onclick = function(event) {
			if (event.target == modal1) {
				modal1.style.display = "none";
			}
		}
		
		function Verify() {
			if (document.getElementById("Main").value===document.getElementById("Ver").value) {
				window.location.href="Travel.jsp";
			}
			else {
				document.getElementById("Error").innerHTML="OTP does not match!"
			}
		}
	</script>
</body>
</html>