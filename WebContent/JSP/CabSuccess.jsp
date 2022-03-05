<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/png"
	href="${pageContext.servletContext.contextPath}/IMAGES/Need.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/CSS/Cab.css">
<script src='https://api.mapbox.com/mapbox-gl-js/v2.1.1/mapbox-gl.js'></script>
<link href='https://api.mapbox.com/mapbox-gl-js/v2.1.1/mapbox-gl.css'
	rel='stylesheet' />
<script
	src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.0/mapbox-gl-directions.js"></script>
<link rel="stylesheet"
	href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.0/mapbox-gl-directions.css"
	type="text/css" />
<title>Cab Service</title>
<script src="${pageContext.servletContext.contextPath}/JS/Cab.js" defer></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	HttpSession sessionLog = request.getSession();

	String Name = (String) sessionLog.getAttribute("Name");
	String Age = (String) sessionLog.getAttribute("Age");
	String Email = (String) sessionLog.getAttribute("Email");
	String Username = (String) sessionLog.getAttribute("User");
	String Number = (String) sessionLog.getAttribute("Phone");

	request.setAttribute("User", Name);
	request.setAttribute("Name", Name);
	request.setAttribute("Age", Age);
	request.setAttribute("Email", Email);
	request.setAttribute("Phone", Number);
	request.setAttribute("Username", Username);
	%>
	<div id="loading"
		style="width: 100%; height: 150%; position: absolute; background-color: black; margin: auto; text-align: center;">
		<img id="loading-image" style="margin-top: 13%; width: 20%;"
			src="${pageContext.servletContext.contextPath}/IMAGES/Loader.gif"
			alt="Loading..." />
		<h2 style="text-align: center; color: white">Password is being verified, be patient!</h2>
	</div>
	<div id="Big" style="visibility: hidden">
		<div id="d2">
			<ul>
				<li><a id="B1"> Profile <i class="fa fa-bars"></i></a></li>
				<li><a
					href="${pageContext.servletContext.contextPath}/JSP/IndexLog.jsp">
						Home <i class="fa fa-home"></i>
				</a></li>
				<li><a
					href="${pageContext.servletContext.contextPath}/JSP/About.jsp">
						About <i class="fa fa-cloud"></i>
				</a></li>
				<li><a
					href="${pageContext.servletContext.contextPath}/JSP/Contact.jsp">
						Contact <i class="fa fa-envelope"></i>
				</a></li>
				<li><a
					href="${pageContext.servletContext.contextPath}/JSP/Service.jsp"
					class="active1"> Service <i class="fa fa-edit"></i></a></li>

				<li style="float: right;"><a
					href="${pageContext.servletContext.contextPath}/JSP/IndexOutSuccess.jsp">
						Log Out <i class="fa fa-sign-out"></i>
				</a></li>
				<li style="float: right;"><a> ${User} <i class="fa fa-user"></i></a></li>
			</ul>
		</div>
		<div class="Back">
			<img src="${pageContext.servletContext.contextPath}/IMAGES/Back7.jpg"
				style="width: 100%" class="img">
			<div class="main">
				<div class="crazy">
					<div class="text">
						<h1>Book your cab!</h1>
						<hr>
						<br>
						<form method="post" action="booking.html"
							style="text-align: center;">
							<table>
								<tr>
									<td colspan="3" align="center"><img
										src="${pageContext.servletContext.contextPath}/IMAGES/Cab.jpg"
										width=40% style="border-radius: 50%; text-align: center;" /></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><hr></td>
								</tr>
								<tr>
									<td><i class="fa fa-user icon"></i></td>
									<td><strong>Name</strong></td>
									<td>:&nbsp;&nbsp;&nbsp;<input type="text" name="Name"
										placeholder="Name" id="inp1" required /></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><hr></td>
								</tr>
								<tr>
									<td><i class="fa fa-map-marker"></i></td>
									<td><strong>Pick-up Location</strong></td>
									<td>:&nbsp;&nbsp;&nbsp;<input type="text"
										name="Pick-up Location" placeholder="Pick-up Location"
										id="inp2" required /></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><hr></td>
								</tr>
								<tr>
									<td><i class="fa fa-map-marker"></i></td>
									<td><strong>Drop-off Location</strong></td>
									<td>:&nbsp;&nbsp;&nbsp;<input type="text"
										name="Drop-off Location" placeholder="Drop-off Location"
										id="inp3" required /></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><hr></td>
								</tr>
								<tr>
									<td><i class="fa fa-tag"></i></td>
									<td><strong>Landmark</strong></td>
									<td>:&nbsp;&nbsp;&nbsp;<input type="text" name="Landmark"
										placeholder="Landmark" id="inp4" required /></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><hr></td>
								</tr>
								<tr>
									<td><i class="fa fa-map"></i></td>
									<td><strong>Distance</strong></td>
									<td>:&nbsp;&nbsp;&nbsp;<input type="text" name="Distance"
										placeholder="Distance" id="inp5" required /></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><hr></td>
								</tr>
								<tr>
									<td><i class="fa fa-clock-o"></i></td>
									<td><strong>Duration</strong></td>
									<td>:&nbsp;&nbsp;&nbsp;<input type="text" name="Duration"
										placeholder="Duration" id="inp6" required /></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><hr></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><input type="submit"
										value="Search" name="submit" id="But1" /></td>
								</tr>
							</table>
						</form>
					</div>
					<div class="image">
						<h1>Map your location!</h1>
						<hr>
						<br>
						<div id="map"></div>
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
					<form method="post" action="http://localhost:8080/TheDemo/S3"
						onsubmit="return MasterValidate()">
						<table>
							<tr>
								<td colspan="3" align="center"><img
									src="${pageContext.servletContext.contextPath}/IMAGES/Avatar3.png"
									width=40% style="border-radius: 50%" /></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-user icon"></i></td>
								<td><strong>Name</strong></td>
								<td>:&nbsp;&nbsp;&nbsp;${Name}</td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-user icon"></i></td>
								<td><strong>Age</strong></td>
								<td>:&nbsp;&nbsp;&nbsp;${Age}</td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-envelope icon"></i></td>
								<td><strong>E-mail ID</strong></td>
								<td>:&nbsp;&nbsp;&nbsp;${Email}</td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-phone icon"></i></td>
								<td><strong>Phone Number</strong></td>
								<td>:&nbsp;&nbsp;&nbsp;${Phone}</td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td><i class="fa fa-user icon"></i></td>
								<td><strong>Username</strong></td>
								<td>:&nbsp;&nbsp;&nbsp;${Username}</td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr class="Adios">
								<td colspan="3" align="center"><button
										name="PasswordChange" id="But1" onclick="Appear()">Change
										Password</button></td>
							</tr>
							<tr class="Adios">
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr class="Bonjour" style="visibility: hidden">
								<td><i class="fa fa-key icon"></i></td>
								<td><strong>Create Password</strong></td>
								<td>:&nbsp;&nbsp;&nbsp;<input
									onkeyup="return ValidatePassword()" id="Pass1" type="password"
									name="Password" placeholder="Password" required /></td>
							</tr>
							<tr class="Bonjour" style="visibility: hidden">
								<td colspan="2"></td>
								<td><span id="Pass1Msg"
									class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr class="Bonjour" style="visibility: hidden">
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr class="Bonjour" style="visibility: hidden">
								<td><i class="fa fa-key icon"></i></td>
								<td><strong>Re-Type Password</strong></td>
								<td>:&nbsp;&nbsp;&nbsp;<input
									onkeyup="return CheckPassword()" id="Pass2" type="password"
									name="Password" placeholder="Password" required /></td>
							</tr>
							<tr class="Bonjour" style="visibility: hidden">
								<td colspan="2"></td>
								<td><span id="Pass2Msg"
									class="text-danger font-weight-bold"></span></td>
							</tr>
							<tr class="Bonjour" style="visibility: hidden">
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr class="Bonjour" style="visibility: hidden">
								<td colspan="3" align="center"><input type="submit"
									value="Confirm Changes" name="submit" id="But2" /></td>
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
					<h3 style="text-align: center;">Password change status</h3>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<td colspan="2" align="center"><img
								src="${pageContext.servletContext.contextPath}/IMAGES/Avatar.png"
								width=40% style="border-radius: 50%" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><hr></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><h4 style="color: green">Password successfully changed!</h4></td>
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
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/JS/Password.js"></script>
<script type="text/javascript">
	var modal1 = document.getElementById("myModal2");
	
	var modal2 = document.getElementById("myModal3");

	var btn1 = document.getElementById("B1");

	var span = document.getElementsByClassName("close");

	btn1.onclick = function() {
		modal1.style.display = "block";
	}

	span[0].onclick = function() {
		modal1.style.display = "none";
	}
	
	span[1].onclick = function() {
		modal2.style.display = "none";
	}

	window.onclick = function(event) {
		if (event.target == modal1 || event.target == modal2) {
			modal1.style.display = "none";
			modal2.style.display = "none";
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
		$("#Big").css({
			"visibility" : "visible"
		});
		$("#Big").fadeIn('slow');
		modal2.style.display = "block";
	}

	function Appear() {
		$(".Adios").css({
			"visibility" : "hidden"
		}).fadeOut('slow');
		$(".Bonjour").css({
			"visibility" : "visible"
		}).fadeIn('slow');
	}
</script>
</html>