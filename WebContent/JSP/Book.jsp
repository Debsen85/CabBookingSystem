<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cab Service</title>
	<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/IMAGES/Need.png">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/CSS/BookTransport.css">
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
		
		String Distance=(String)sessionCab.getAttribute("Distance");
		
		String Dist="";
		for(int i=0; i<Distance.length(); i++) {
			if (Distance.charAt(i)==' ') {
				break;
			} else {
				Dist+=Distance.charAt(i);
			}
		}
		
		request.setAttribute("User", Name);	
		request.setAttribute("Name", Name);	
		request.setAttribute("Age", Age);	
		request.setAttribute("Email", Email);	
		request.setAttribute("Phone", Number);	
		request.setAttribute("Username", Username);	
		request.setAttribute("Distance", Dist);
	%>
	<div id="loading">
		<img id="loading-image" src="${pageContext.servletContext.contextPath}/IMAGES/Loader.gif" alt="Loading..." />
		<h2 style="text-align: center; color: white">Displaying available transportation mode!</h2>
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
			<img src="${pageContext.servletContext.contextPath}/IMAGES/Back9.jpg" style="width: 100%" class="img" id="Im1">			
			<div class="main">
				<h1 style="text-align: center">Choose Your Transport Mode</h1>
				<hr>
				<input type="text" id="Dist" value="${Distance}" style="display: none"/>
				<div class="service">
					<div class="card" id="Bike">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/Book1.jpg" alt="Denim Jeans" style="width:80%">
						<h3>Bike</h3>
						<hr>					
						<p style="text-align: justify;">Cost is Rs. 6 per Kilometer. Can be used to travel short distances, to get to your destinations quickly.</p>
						<form method="post" action="http://localhost:8080/TheDemo/S5"><p><input type="submit" id="Button1" value="Book" /></p></form>
					</div>
					<div class="card">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/Book2.jpg" alt="Denim Jeans" style="width:80%">
						<h3>Mini Cab</h3>	
						<hr>				
						<p style="text-align: justify;">Cost is Rs. 10 per Kilometer. Can be used to travel alone over longer distance.</p>
						<form method="post" action="http://localhost:8080/TheDemo/S6"><p><input type="submit" id="Button2" value="Book" /></p></form>
					</div>
					<div class="card">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/Book3.jpg" alt="Denim Jeans" style="width:80%">
						<h3>Sedan Cab</h3>	
						<hr>				
						<p  style="text-align: justify;">Cost is Rs. 12 per Kilometer. Can be used to travel longer distances with friends and family.</p>
						<form method="post" action="http://localhost:8080/TheDemo/S7"><p><input type="submit" id="Button3" value="Book" /></p></form>
					</div>
					<div class="card">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/Book4.jpg" alt="Denim Jeans" style="width:80%">
						<h3>Premium Cab</h3>	
						<hr>				
						<p  style="text-align: justify;">Cost is Rs. 14 per Kilometer. Can be used to travel longer distances with friends and family, in luxurious cars.</p>
						<form method="post" action="http://localhost:8080/TheDemo/S8"><p><input type="submit" id="Button4" value="Book" /></p></form>
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
   			if (parseFloat(document.getElementById("Dist").value)>=25.0) {
   				$("#Bike").fadeOut("fast");
   			} 
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
	</script>
</body>	
</html>