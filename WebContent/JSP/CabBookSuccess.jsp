<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Ride</title>
	<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/IMAGES/Need.png">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/CSS/CabBookSuccess.css">
	<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		HttpSession sessionLog=request.getSession(); 
		String Name=(String)sessionLog.getAttribute("Name");
		request.setAttribute("User", Name);	
	%>
	<div id="loading" style="width: 100%; height: 150%; position: absolute; background-color: black; margin: auto; text-align: center;">
		<img id="loading-image" style="margin-top: 13%; width: 20%;  " src="${pageContext.servletContext.contextPath}/IMAGES/Loader.gif" alt="Loading..." />
		<h2 style="text-align: center; color: white">Loading all our services!</h2>
	</div>
	<div id="Big" style="visibility: hidden">
		<div id="d2">
			<ul>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/IndexLog.jsp"> Home <i class="fa fa-home"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/About.jsp"> About <i class="fa fa-cloud"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/Contact.jsp"> Contact <i class="fa fa-envelope"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/Service.jsp"  class="active1"> Service <i class="fa fa-edit"></i></a></li>
				
				<li style="float: right;"><a href="${pageContext.servletContext.contextPath}/JSP/IndexOutSuccess.jsp"> Log Out <i class="fa fa-sign-out"></i></a></li>
				<li style="float: right;"><a> ${User} <i class="fa fa-user"></i></a></li>
			</ul>
		</div>
		<div class="Back">
			<img src="${pageContext.servletContext.contextPath}/IMAGES/Back6.jpg" style="width: 100%" class="img" id="Im1">
			<div class="main">
				<h1 style="text-align: center">Our Services</h1>
				<hr>
				<div class="service">
					<div class="card">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/Service1.jpg" alt="Denim Jeans" style="width:80%">
						<h3>Cab Services</h3>
						<hr>					
						<p style="text-align: justify;">Use this service to book cabs for travelling from your location to your selected destination. Quick and very easy to use, with no extra charges.</p>
						<p><button onclick="window.location.href='Cab.jsp'">Book a Cab!</button></p>
					</div>
					<div class="card">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/Service2.jpg" alt="Denim Jeans" style="width:80%">
						<h3>Food Delivery</h3>	
						<hr>				
						<p  style="text-align: justify;">Use this service to order food from the restaurants/fast food centres that are registered with us and get it delivered at your doorsteps.</p>
						<p><button>Order Food!</button></p>
					</div>
					<div class="card">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/Service3.jpg" alt="Denim Jeans" style="width:80%">
						<h3>Lifestyle Products</h3>	
						<hr>				
						<p  style="text-align: justify;">Use this service to shop with just the click of a button. Choose your desired product from a variety of stores available on our appliation.</p>
						<p><button>Go Shopping!</button></p>
					</div>
				</div>			
			</div>
		</div>
		<div id="myModal3" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<span class="close">&times;</span>
					<h3 style="text-align: center;">Profile Status</h3>
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
								<td colspan="2" align="center"><h4 style="color: green">We are very happy to provide you, with our services!</h4></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><hr></td>
							</tr>						
					</table>							
				</div>			
			</div>
		</div>
	</div>
</body>
<script>
	var modal3 = document.getElementById("myModal3");
	
	var span = document.getElementsByClassName("close");
	
	span[0].onclick = function() {
		modal3.style.display = "none";
	}
	
	window.onclick = function(event) {
		if (event.target == modal3) {
			modal1.style.display = "none";			
		}
	}

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
		modal3.style.display = "block";
	}
</script>
</html>