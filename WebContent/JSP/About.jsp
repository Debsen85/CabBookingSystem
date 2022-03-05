<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ride</title>
<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/IMAGES/Need.png">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/CSS/About.css">
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
		<h2 style="text-align: center; color: white">Loading contents about our website!</h2>
	</div>
	<div id="Big" style="visibility: hidden">
		<div id="d2">
			<ul>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/IndexLog.jsp"> Home <i class="fa fa-home"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/About.jsp" class="active1"> About <i class="fa fa-cloud"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/Contact.jsp"> Contact <i class="fa fa-envelope"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/Service.jsp"> Service <i class="fa fa-edit"></i></a></li>
				
				<li style="float: right;"><a href="${pageContext.servletContext.contextPath}/JSP/IndexOutSuccess.jsp"> Log Out <i class="fa fa-sign-out"></i></a></li>
				<li style="float: right;"><a> ${User} <i class="fa fa-user"></i></a></li>
			</ul>
		</div>
		<div class="Back">
			<img src="${pageContext.servletContext.contextPath}/IMAGES/Back4.jpg" style="width: 100%" class="img">
			<div class="main">
				<div class="crazy">
					<div class="text">
						<h1>Why Ride?</h1>
						<hr>
						<p>So, why to use this application, right? There are many reasons, firstly it is user-friendly, secondly it provides great offers for various services and lastly not the list we take back the feedback of our customers into account and deliver our products and services in a respectful manner.</p>
					</div>
					<div class="image">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/about1.jpg" class="IMG1" style="width: 40%; border-radius: 50%"/>
					</div>
				</div>
				<br>
				<div class="crazy">
					<div class="text">
						<h1>Motif</h1>
						<hr>
						<p>Our prime target is to stand apart from the other applications/competitors which will provide the results without taking extra charges while maintaining hygenic and healthy relationship with our customer. It will remain usable through various platform which again makes it easily recommendable to any user using any particular devices. Finally, we are a team for a change!</p>
					</div>
					<div class="image">
						<img src="${pageContext.servletContext.contextPath}/IMAGES/about2.jpg" class="IMG1" style="width: 40%; border-radius: 50%" />
					</div>
				</div>		
				<br>
				<div class="crazy">
					<div class="text">
						<h1>Meet the creators!</h1>
						<hr>
						<p>Greetings! We are a team of hungry developers. We work hard and favour working as a team than an individual. Our togetherness shall create a path forward with greater things to come. Feedback from customers is a vital part of our system.</p>
					</div>
					<div class="image">
						<table>
							<tr>
								<td><img src="${pageContext.servletContext.contextPath}/IMAGES/about1.jpg" class="IMG2" style="width: 80%; border-radius: 50%" /></td>	
								<td><img src="${pageContext.servletContext.contextPath}/IMAGES/about1.jpg" class="IMG2" style="width: 80%; border-radius: 50%" /></td>
								<td><img src="${pageContext.servletContext.contextPath}/IMAGES/about1.jpg" class="IMG2" style="width: 80%; border-radius: 50%" /></td>
								<td><img src="${pageContext.servletContext.contextPath}/IMAGES/about1.jpg" class="IMG2" style="width: 80%; border-radius: 50%" /></td>
								<td><img src="${pageContext.servletContext.contextPath}/IMAGES/about1.jpg" class="IMG2" style="width: 80%; border-radius: 50%" /></td>						
							</tr>						
						</table>
					</div>	
				</div>				
			</div>	
		</div>
	</div>
</body>
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
</script>
</html>