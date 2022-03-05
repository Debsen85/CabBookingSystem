<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cab Service</title>
	<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/IMAGES/Need.png">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/CSS/Booked.css">
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
		
		HttpSession sessionCab=request.getSession();
		
		String Origin=(String)sessionCab.getAttribute("Origin");	
		String Destination=(String)sessionCab.getAttribute("Destination");	
		String Duration=(String)sessionCab.getAttribute("Duration");	
		String Distance=(String)sessionCab.getAttribute("Distance");
		String Cost=(String)sessionCab.getAttribute("Cost");	
		
		HttpSession sessionDriver=request.getSession();
		
		String Driver=(String)sessionDriver.getAttribute("Driver");
		String DriverPhone=(String)sessionDriver.getAttribute("DriverPhone");
		String CarType=(String)sessionDriver.getAttribute("CarType");
		String CarNumber=(String)sessionDriver.getAttribute("CarNumber");
		String Rating=(String)sessionDriver.getAttribute("Rating");
		String OTP=(String)sessionDriver.getAttribute("OTP");
		
		request.setAttribute("User", Name);	
		request.setAttribute("Name", Name);	
		request.setAttribute("Age", Age);	
		request.setAttribute("Email", Email);	
		request.setAttribute("Phone", Number);	
		request.setAttribute("Username", Username);	
		request.setAttribute("Driver", Driver);	
		request.setAttribute("DriverPhone", DriverPhone);	
		request.setAttribute("CarType", CarType);	
		request.setAttribute("CarNumber", CarNumber);	
		request.setAttribute("Rating", Rating);	
		request.setAttribute("Cost", Cost);
		request.setAttribute("Origin", Origin);
		request.setAttribute("Destination", Destination);
		request.setAttribute("Distance", Distance);
		request.setAttribute("Duration", Duration);
		request.setAttribute("OTP", OTP);
	%>
	<div id="loading">
		<img id="loading-image" src="${pageContext.servletContext.contextPath}/IMAGES/Loader.gif" alt="Loading..." />
		<h2 style="text-align: center; color: white">Cab booked, waiting for driver details!</h2>
	</div>
	<div id="Big" style="visibility: hidden">
		<div id="d2">
			<ul>
				<li><a id="B1"> Profile <i class="fa fa-bars"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/IndexLog.jsp"> Home <i class="fa fa-home"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/About.jsp"> About <i class="fa fa-cloud"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/Contact.jsp"> Contact <i class="fa fa-envelope"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/Service.jsp"  class="active1"> Service <i class="fa fa-edit"></i></a></li>

				<li style="float: right;"><a href="${pageContext.servletContext.contextPath}/JSP/IndexOutSuccess.jsp"> Log Out <i class="fa fa-sign-out"></i></a></li>
				<li style="float: right;"><a> ${User} <i class="fa fa-user"></i></a></li>
			</ul>
		</div>
		<div class="Back">
			<img src="${pageContext.servletContext.contextPath}/IMAGES/Back8.jpg" style="width: 100%" class="img" id="Im1">			
			<div class="main">
				<h1 style="text-align: center">Finalize Trip</h1>
				<hr>
				<div class="service">
					<div class="card">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/Avatar3.png" style="width:50%; border-radius: 50%">
						<h3>Passenger Details</h3>	
						<hr>	
						<table style="border-collapse: separate; border-spacing: 0 1em; text-align:left;">
							<tr>
	              				<td><i class="fa fa-user icon"></i></td><td> <strong>Name </strong></td><td> &nbsp;:&nbsp;${Name}</td>
	            			</tr>
	            			
	            			<tr>
	              				<td><i class="fa fa-map-marker"></i></td><td> <strong>Origin </strong></td><td> &nbsp;:&nbsp;${Origin}</td>
	            			</tr>
	            			
	            			<tr>
	              				<td><i class="fa fa-map-marker"></i></td><td> <strong>Destination </strong></td><td> &nbsp;:&nbsp;${Destination}</td>
	            			</tr>
	            			
	            			<tr>
	              				<td><i class="fa fa-map"></i></td><td> <strong>Distance </strong></td><td> &nbsp;:&nbsp;${Distance}</td>
	            			</tr>
	            			
	            			<tr>
	              				<td><i class="fa fa-clock-o"></i></td><td> <strong>Duration </strong></td><td> &nbsp;:&nbsp;${Duration}</td>
	            			</tr>
	            			
	            			<tr>
	              				<td><i class="fa fa-money"></i></td><td> <strong>Total Cost </strong></td><td> &nbsp;:&nbsp;${Cost}</td>
	            			</tr>
						</table>												
					</div>
					<div class="card">
						<form method="post" action="${pageContext.servletContext.contextPath}/JSP/Arrive.jsp">
							<img src="${pageContext.servletContext.contextPath}/IMAGES/Avatar5.png" style="width:50%; border-radius: 50%">
							<h3>Payment Details</h3>	
							<hr>				
							<p><b>Cost</b> : ${Cost}</p>	
							<p>
								<select name="Payment" style="outline: none; width: 150px;">
									<option value="Cash">Cash</option>
									<option value="Card">Card</option>
									<option value="Wallet">Wallet</option>
								</select>
							</p>
							<p><input type="submit" id="Button1" value="Book" /></p>
						</form>							
					</div>
					<div class="card">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/Avatar4.png" style="width:50%; border-radius: 50%">
						<h3>Driver Details</h3>	
						<hr>	
						<table style="border-collapse: separate; border-spacing: 0 1em; text-align:left;">
							<tr>
	              				<td><i class="fa fa-user icon"></i></td><td> <strong>Name </strong></td><td> &nbsp;:&nbsp;${Driver}</td>
	            			</tr>
	            			
	            			<tr>
	              				<td><i class="fa fa-phone icon"></i></td><td> <strong>Contact </strong></td><td> &nbsp;:&nbsp;${DriverPhone}</td>
	            			</tr>
	            			
	            			<tr>
	              				<td><i class="fa fa-car"></i></td><td> <strong>Car Type </strong></td><td> &nbsp;:&nbsp;${CarType}</td>
	            			</tr>
	            			
	            			<tr>
	              				<td><i class="fa fa-cab"></i></td><td> <strong>Car Number </strong></td><td> &nbsp;:&nbsp;${CarNumber}</td>
	            			</tr>
	            			
	            			<tr>
	              				<td><i class="fa fa-star"></i></td><td> <strong>Rating </strong></td><td> &nbsp;:&nbsp;${Rating}</td>
	            			</tr>
	            			
	            			<tr>
	              				<td><i class="fa fa-comment"></i></td><td> <strong>OTP </strong></td><td> &nbsp;:&nbsp;${OTP}</td>
	            			</tr>
						</table>												
					</div>					
				</div>					
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
								<td colspan="3" align="center"><img	src="${pageContext.servletContext.contextPath}/IMAGES/Avatar3.png" width=40% style="border-radius: 50%" /></td>
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
			if (event.target == modal1 || event.target == modal2) {
				modal1.style.display = "none";
			}
		}		
	</script>
</body>
</html>