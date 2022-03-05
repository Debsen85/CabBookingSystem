<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ride</title>
<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/IMAGES/Need.png">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/CSS/AdminIndexLog.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>	
	<div id="loading" style="width: 100%; height: 150%; position: absolute; background-color: black; margin: auto; text-align: center;">
		<img id="loading-image" style="margin-top: 13%; width: 20%;  " src="${pageContext.servletContext.contextPath}/IMAGES/Loader.gif" alt="Loading..." />
		<h2 style="text-align: center; color: white">Hello, Admin!</h2>
	</div>
	<div id="Big" style="visibility: hidden">
		<div id="d2">
			<ul>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminIndexLog.jsp" class="active1"> Home <i class="fa fa-home"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminCustomer.jsp"> View Customers <i class="fa fa-address-card"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminDriver.jsp"> View And Add Drivers <i class="fa fa-address-card"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminJourney.jsp"> View Journey Details <i class="fa fa-address-card"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminRevenue.jsp"> View Revenue And Sales <i class="fa fa-address-card"></i></a></li>
				
				<li style="float: right;"><a href="${pageContext.servletContext.contextPath}/JSP/IndexOutSuccess.jsp"> Log Out <i class="fa fa-sign-out"></i></a></li>
				<li style="float: right;"><a> Admin <i class="fa fa-user"></i></a></li>
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
	</div>
</body>
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