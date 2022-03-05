<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ride</title>
<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/IMAGES/Need.png">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/CSS/Index.css">
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
		<h2 style="text-align: center; color: white">Goodbye ${User}, see you soon!</h2>
	</div>
	<div id="Big" style="visibility: hidden">
		<div id="d2">
			<ul>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/Index.jsp" class="active1"> Home <i class="fa fa-home"></i></a></li>			
				
				<li style="float: right;"><a id="B2"> Log In <i class="fa fa-sign-in"></i></a></li>
				<li style="float: right;"><a id="B1"> Sign Up <i class="fa fa-user"></i></a></li>			
			</ul>
		</div>
		<div class="slideshow-container">
			<div class="mySlides fade">			
				<img src="${pageContext.servletContext.contextPath}/IMAGES/Back0.jpg" style="width: 100%" class="img">
				<div class="text">
					<div>
						<h1>Welcome to Ride!</h1>
						<hr>
						<p>Welcome to Ride. This is a web-application where you can book a cab, order food online and buy products online. Since this application is web-based you don't require to download it on your mobile device. It's an all-in-one application where one can utilize it's benefits.</p>
					</div>			
				</div>
			</div>
			<div class="mySlides fade">			
				<img src="${pageContext.servletContext.contextPath}/IMAGES/Back1.jpg" style="width: 100%" class="img">
				<div class="text">
					<div>
						<h1>Cab Service</h1>
						<hr>
						<p>This application provides first class cab services, where you can book a cab, use live-tracking to see your ride, choose your ride and enjoy your hassle free journey! It's safe and secure to use. Cars such as Toyota Etios, Maruti Omni, Mahindra Logan, Tata Indica and Tata Indigo are fairly popular among taxicab operators. The livery of the taxicabs in India varies from state to state. In Delhi and Maharashtra, most taxicabs have yellow-black livery, while in West Bengal, taxis have yellow livery. Private taxicab operators are not required to have a specific livery. However, they are required by law to be registered as commercial vehicles.</p>
					</div>
				</div>
			</div>
			<div class="mySlides fade">			
				<img src="${pageContext.servletContext.contextPath}/IMAGES/Back2.jpg" style="width: 100%" class="img">
				<div class="text">
					<div>
						<h1>Food Delivery</h1>
						<hr>
						<p>This application provides first class appetizers than can be ordered online. The orders are delivered very swiftly and delicately, so that our customers can enjoy the great taste without any delay or distortion. Retail food delivery is a courier service in which a restaurant, store, or independent food-delivery company delivers food to a customer. An order is typically made either through a restaurant or grocer's website or mobile app, or through a food ordering company. The delivered items can include entrees, sides, drinks, desserts, or grocery items and are typically delivered in boxes or bags. The delivery person will normally drive a car, but in bigger cities where homes and restaurants are closer together, they may use bikes or motorized scooters.</p>
					</div>
				</div>
			</div>
			<div class="mySlides fade">			
				<img src="${pageContext.servletContext.contextPath}/IMAGES/Back3.jpg" style="width: 100%" class="img">
				<div class="text">
					<div>
						<h1>Lifestyle Products</h1>
						<hr>
						<p>This application provide us to buy our choice of products and get them delivered right at your door steps without any discrepency. A lifestyle typically reflects an individual's attitudes, way of life, values, or world view. Therefore, a lifestyle is a means of forging a sense of self and to create cultural symbols that resonate with personal identity. Not all aspects of a lifestyle are voluntary. Surrounding social and technical systems can constrain the lifestyle choices available to the individual and the symbols she/he is able to project to others and the self.</p>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div style="text-align: center; position: relative">
			<span class="dot"></span><span class="dot"></span><span class="dot"></span><span class="dot"></span>
		</div>
		<div id="myModal1" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<span class="close">&times;</span>
					<h3 style="text-align: center;">Log In</h3>
				</div>
				<div class="modal-body">
					<form method="post" action="http://localhost:8080/TheDemo/S1" onsubmit="return MasterValidateLog()">
						<table>
							<tr>
								<td colspan="2" align="center"><img src="${pageContext.servletContext.contextPath}/IMAGES/Avatar.png" width=40% style="border-radius: 50%"/></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><hr></td>
							</tr>
							<tr>
								<td><strong><i class="fa fa-user icon"></i> Username</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return ValidateUsernameLog()" id="UserLog" type="text" name="Username" placeholder="Username" required/></td>
							</tr>
							<tr>
								<td colspan="1"></td><td><span id="UserMsgLog" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><hr></td>
							</tr>
							<tr>
								<td><strong><i class="fa fa-key icon"></i> Password</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return ValidatePasswordLog()" id="PassLog" type="password" name="Password" placeholder="Password" required/></td>
							</tr>
							<tr>
								<td colspan="1"></td><td><span id="Pass1MsgLog" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><hr></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="submit" value="Log In" name="submit" id="But1"/></td>
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
					<h3 style="text-align: center;">Sign Up</h3>
				</div>
				<div class="modal-body">
					<form method="post" action="http://localhost:8080/TheDemo/S2" onsubmit="return MasterValidate()">
						<table>
							<tr>
								<td colspan="3" align="center"><img
									src="${pageContext.servletContext.contextPath}/IMAGES/Avatar.png" width=40% style="border-radius: 50%" /></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-user icon"></i></td><td> <strong>Name</strong></td><td>:&nbsp;&nbsp;&nbsp;<input  onkeyup="return ValidateName()" id="Name" type="text" name="Name" placeholder="Name" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="NameMsg" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-user icon"></i></td><td> <strong>Age</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return ValidateAge()" id="Age" type="text" name="Age" placeholder="Age" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="AgeMsg" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-envelope icon"></i></td><td> <strong>E-mail ID</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return ValidateEmail()" id="Email" type="email" name="Email"	placeholder="E-mail" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="EmailMsg" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-phone icon"></i></td><td> <strong>Phone Number</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return ValidatePhone()" id="Phone" type="text" name="Phone"	placeholder="Phone Number" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="PhoneMsg" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-user icon"></i></td><td> <strong>Create Username</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return ValidateUsername()" id="Username" type="text" name="Username"	placeholder="Username" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="UserMsg" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-key icon"></i></td><td> <strong>Create Password</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return ValidatePassword()" id="Pass1" type="password"	name="Password" placeholder="Password" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="Pass1Msg" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-key icon"></i></td><td> <strong>Re-Type Password</strong></td><td>:&nbsp;&nbsp;&nbsp;<input onkeyup="return CheckPassword()" id="Pass2" type="password"	name="Password" placeholder="Password" required /></td>
							</tr>
							<tr>
								<td colspan="2"></td><td><span id="Pass2Msg" class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><input type="submit"	value="Sign Up" name="submit" id="But2" /></td>
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
								<td colspan="2" align="center"><h4 style="color: green">Logged out successfully!</h4></td>
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
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/JS/Sign.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/JS/Log.js"></script>
<script>
	var slideIndex = 0;
	showSlides();

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
		setTimeout(showSlides, 5000);
	}

	var modal1 = document.getElementById("myModal1");
	
	var modal2 = document.getElementById("myModal2");
	
	var modal3 = document.getElementById("myModal3");

	var btn1 = document.getElementById("B2");
	
	var btn2 = document.getElementById("B1");

	var span = document.getElementsByClassName("close");

	btn1.onclick = function() {
		modal1.style.display = "block";
	}
	btn2.onclick = function() {
		modal2.style.display = "block";
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
	window.onclick = function(event) {
		if (event.target == modal1 || event.target == modal2 || event.target == modal3) {
			modal1.style.display = "none";
			modal2.style.display = "none";
			modal3.style.display = "none";
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