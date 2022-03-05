<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ride</title>
<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/IMAGES/Need.png">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/CSS/Contact.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
		<h2 style="text-align: center; color: white">Loading our contact details!</h2>
	</div>
	<div id="Big" style="visibility: hidden">
		<div id="d2">
			<ul>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/IndexLog.jsp"> Home <i class="fa fa-home"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/About.jsp"> About <i class="fa fa-cloud"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/Contact.jsp"  class="active1"> Contact <i class="fa fa-envelope"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/Service.jsp"> Service <i class="fa fa-edit"></i></a></li>
				
				<li style="float: right;"><a href="${pageContext.servletContext.contextPath}/JSP/IndexOutSuccess.jsp"> Log Out <i class="fa fa-sign-out"></i></a></li>
				<li style="float: right;"><a id="B1"> Feedback <i class="fa fa-thumbs-up" style="color: white;"></i></a></li>
				<li style="float: right;"><a> ${User} <i class="fa fa-user"></i></a></li>
			</ul>
		</div>
		<div class="Back">
			<img src="${pageContext.servletContext.contextPath}/IMAGES/Back5.jpg" style="width: 100%" class="img">
			<div class="main">
				<div class="crazy">
					<div class="text">
						<h1>Keep in Touch</h1>
						<hr>
						<p>Want to keep track of our development program? Welcome onboard, as we will try to enhance customer enthusiasm by explaining our motif and work. This inturn will bring all of us closer, as one and we shall work together with a common goal.</p>
					</div>
					<div class="image">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/contact1.jpg" class="IMG1" style="width: 30%; border-radius: 50%"/>
					</div>
				</div>
				<br>
				<div class="crazy">
					<div class="text">
						<h1>Oopsie's and Mismanagement</h1>
						<hr>
						<p>Want to complain about any wrong-doing or unprofessional behaviour? We are there to support any mal-practices or discriminate behaviour and take strict actions against it. Feel free to raise your voice and opinions about the situation and we shall guide you in the right manner.</p>
					</div>
					<div class="image">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/contact2.jpg" class="IMG1" style="width: 30%; border-radius: 50%" />
					</div>
				</div>		
				<br>
				<div class="crazy">
					<div class="text">
						<h1>Feedback</h1>
						<hr>
						<p>We welcome all kinds of feedback from our user. Negetive or positive we encourage every comment passed onto us. Want to make a change use the feedback option in the navigation bar to write to us!</p>
					</div>
					<div class="image">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/contact3.jpg" class="IMG1" style="width: 30%; border-radius: 50%" />
					</div>	
				</div>				
			</div>		
		</div>
		<div id="myModal1" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<span class="close">&times;</span>
					<h3 style="text-align: center;">Feedback</h3>
				</div>
				<div class="modal-body">
					<form method="post" action="S1">
						<table>
							<tr>
								<td colspan="2" align="center"><img src="${pageContext.servletContext.contextPath}/IMAGES/Avatar2.png" width=40% style="border-radius: 50%"/></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><hr></td>
							</tr>
							<tr>
								<td><strong><i class="fa fa-envelope"></i> E-mail ID </strong></td><td>:&nbsp;&nbsp;&nbsp;<input type="email" name="Email" placeholder="Email" required/></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><hr></td>
							</tr>
							<tr>
								<td><strong><i class="fa fa-file-text"></i> Feedback </strong></td><td>:&nbsp;&nbsp;&nbsp;<input type="text" name="Feedback" placeholder="Your Feedback" required/></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><hr></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="submit" value="Send Feedback" name="submit" id="But1"/></td>
							</tr>
						</table>
					</form>				
				</div>			
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var modal1 = document.getElementById("myModal1");	

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
</script>
</html>