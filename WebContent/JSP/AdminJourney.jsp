<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ride</title>
<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/IMAGES/Need.png">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/CSS/AdminTravel.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background: linear-gradient(to right, #efefbb, #d4d3dd);">	
	<div id="loading" style="width: 100%; height: 150%; position: absolute; background-color: black; margin: auto; text-align: center;">
		<img id="loading-image" style="margin-top: 13%; width: 20%;  " src="${pageContext.servletContext.contextPath}/IMAGES/Loader.gif" alt="Loading..." />
		<h2 style="text-align: center; color: white">Sorting journey details!</h2>
	</div>
	<div id="Big" style="visibility: hidden">
		<div id="d2">
			<ul>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminIndexLog.jsp"> Home <i class="fa fa-home"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminCustomer.jsp"> View Customers <i class="fa fa-address-card"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminDriver.jsp"> View And Add Drivers <i class="fa fa-address-card"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminJourney.jsp"   class="active1"> View Journey Details <i class="fa fa-address-card"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminRevenue.jsp"> View Revenue And Sales <i class="fa fa-address-card"></i></a></li>
				
				<li style="float: right;"><a href="${pageContext.servletContext.contextPath}/JSP/IndexOutSuccess.jsp"> Log Out <i class="fa fa-sign-out"></i></a></li>
				<li style="float: right;"><a> Admin <i class="fa fa-user"></i></a></li>
			</ul>
		</div>	
		<h1 style="text-align: center; color: black">Journey Details</h1>	
		<div style="text-align: center; margin-top: 2%">			
			<form method="post" action="${pageContext.servletContext.contextPath}/JSP/AdminTravelSort.jsp">
				<label for="Sort">Sort table : </label>
				<select name="Sort" id="Sort">
				  	<option value="PN">Passenger Name</option>
				  	<option value="DN">Driver Name</option>
				  	<option value="Dist">Distance</option>
				  	<option value="Rate">Rating</option>
				</select>
				<input type="submit" name="submit" value="sort" class="But"/>
			</form>
		</div>
		<div style="overflow: scroll; margin: 0% 10% 0% 10%;">			
			<table id="customers">
				<tr id="Head">
					<th>Number</th>
					<th>Passenger Name</th>
					<th>Passenger Contact Number</th>
					<th>Origin</th>
					<th>Destination</th>
					<th>Distance</th>
					<th>Duration</th>
					<th>Cost</th>
					<th>Driver Name</th>
					<th>Driver Contact Number</th>
					<th>Car Type</th>
					<th>Car Number</th>
					<th>Rating</th>
					<th>Journey Status</th>
				</tr>
				<%
					String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
					String DB_URL = "jdbc:mysql://localhost:3306/javatraining";
					String USER = "root";
					String pass = "root";
					Connection Con = null;
					PreparedStatement st = null;
					try
					{     
					    
					    Class.forName(JDBC_DRIVER);    
					    Con = DriverManager.getConnection(DB_URL, USER, pass);    
					    System.out.println("Connected to the Database. . ."); 
					    
					    PreparedStatement Ps=Con.prepareStatement("SELECT *FROM journey");					
					    ResultSet Rs=Ps.executeQuery();
					    
					    if (Rs==null) {
				        	%><tr><td colspan='14' align='center'>No customers yet!<td></tr><%  
						} else {
							int num=1;
					    	while(Rs.next()) {
					    		%><tr>
					    			<td><%=num%></td>
					    			<td><%=Rs.getString(1)%></td>
					    			<td><%=Rs.getString(2)%></td>
					    			<td><%=Rs.getString(3)%></td>
					    			<td><%=Rs.getString(4)%></td>
					    			<td><%=Rs.getString(5)%></td>	
					    			<td><%=Rs.getString(6)%></td>
					    			<td><%=Rs.getString(7)%></td>
					    			<td><%=Rs.getString(8)%></td>
					    			<td><%=Rs.getString(9)%></td>
					    			<td><%=Rs.getString(10)%></td>	
					    			<td><%=Rs.getString(11)%></td>
					    			<td><%=Rs.getString(12)%></td>
					    			<td><%=Rs.getString(13)%></td>					    				
					    		</tr><%
					    		num++;
					    	}
					    }
					}
					catch (SQLException e) 
					{
					    e.printStackTrace();
					}
					finally 
					{   
					    try
					    {           
					        Con.close();
					    }
					    catch(SQLException e)
					    {
					        out.println(e.getMessage());
					    }       
					}	
				%>
			</table>			
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