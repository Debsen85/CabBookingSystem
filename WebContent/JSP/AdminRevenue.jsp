<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %> 
<%@ page import="com.google.gson.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ride</title>
<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/IMAGES/Need.png">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/CSS/AdminMoney.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body style="background: linear-gradient(to right, #efefbb, #d4d3dd);">	
	<div id="loading" style="width: 100%; height: 180%; position: absolute; background-color: black; margin: auto; text-align: center;">
		<img id="loading-image" style="margin-top: 13%; width: 20%;  " src="${pageContext.servletContext.contextPath}/IMAGES/Loader.gif" alt="Loading..." />
		<h2 style="text-align: center; color: white">Fetching revenue details!</h2>
	</div>
	<div id="Big" style="visibility: hidden">
		<div id="d2">
			<ul>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminIndexLog.jsp"> Home <i class="fa fa-home"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminCustomer.jsp"> View Customers <i class="fa fa-address-card"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminDriver.jsp"> View And Add Drivers <i class="fa fa-address-card"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminJourney.jsp"> View Journey Details <i class="fa fa-address-card"></i></a></li>
				<li><a href="${pageContext.servletContext.contextPath}/JSP/AdminRevenue.jsp" class="active1"> View Revenue And Sales <i class="fa fa-address-card"></i></a></li>
				
				<li style="float: right;"><a href="${pageContext.servletContext.contextPath}/JSP/IndexOutSuccess.jsp"> Log Out <i class="fa fa-sign-out"></i></a></li>
				<li style="float: right;"><a> Admin <i class="fa fa-user"></i></a></li>
			</ul>
		</div>
		<h1 style="text-align: center; margin-top: 4%">Revenue</h1>
		<div id="Rev1">
			<%
					Gson gsonObj = new Gson();
					Map<Object,Object> map = null;
					List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
					String dataPoints = null;
					
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
					    
					    PreparedStatement Ps1=Con.prepareStatement("SELECT Cost FROM journey WHERE JStatus='Successful'");					
					    ResultSet Rs1=Ps1.executeQuery();
					    
					   	if (Rs1==null) {
					   		%>
					   		<h1>Total Revenue Accumulated : Rs. 0.0</h1>
					   		<%					   		
					   	} else {
					   		double sum=0.0;
					   		while(Rs1.next()) {
					   			sum+=Double.parseDouble(Rs1.getString("Cost").substring(3));
					   		}
					   		%>
					   		<h1>Total Revenue Accumulated : Rs. <%=sum%></h1><%
					   	}
					   	
					   	PreparedStatement Ps2=Con.prepareStatement("SELECT Cost FROM journey WHERE JStatus='Successful'");					
					    ResultSet Rs2=Ps2.executeQuery();
					    
					   	if (Rs2==null) {
					   		%>
					   		<h1>Average Revenue per Ride : Rs. 0.0</h1>
					   		<%					   		
					   	} else {
					   		double sum=0.0;
					   		int num=0;
					   		while(Rs2.next()) {
					   			sum+=Double.parseDouble(Rs2.getString("Cost").substring(3));
					   			num++;
					   		}
					   		double avg=sum/(double)num;
					   		%><h1>Average Revenue per Ride : Rs. <%=avg%></h1><%
					   	}
					   	PreparedStatement Ps3=Con.prepareStatement("SELECT *FROM journey");					
					    ResultSet Rs3=Ps3.executeQuery();
					    
					   	if (Rs3==null) {
					   		%>
					   		<h1>Service used : 0 Times.</h1>
					   		<%					   		
					   	} else {
					   		int c=0;
					   		while(Rs3.next()) {
					   			c++;
					   		}
					   		%><h1>Service Used : <%=c%> Times.</h1><%
					   	}
					   	PreparedStatement Ps4=Con.prepareStatement("SELECT *FROM journey WHERE JStatus='Successful'");					
					    ResultSet Rs4=Ps4.executeQuery();
					    
					   	if (Rs4==null) {
					   		%>
					   		<h1>Service Used Successfully : 0 Times.</h1>
					   		<%					   		
					   	} else {
					   		int c=0;
					   		while(Rs4.next()) {
					   			c++;
					   		}
					   		%><h1>Service Used Successfully : <%=c%> Times.</h1><%
					   	}
					   	PreparedStatement Ps5=Con.prepareStatement("SELECT *FROM journey WHERE JStatus='Cancelled'");					
					    ResultSet Rs5=Ps5.executeQuery();
					    
					   	if (Rs5==null) {
					   		%>
					   		<h1>Service Cancelled : 0 Times.</h1>
					   		<%					   		
					   	} else {
					   		int c=0;
					   		while(Rs5.next()) {
					   			c++;
					   		}
					   		%><h1>Service Cancelled : <%=c%> Times.</h1><%
					   	}
					   	PreparedStatement P=Con.prepareStatement("SELECT Cost FROM journey");
					   	String xVal, yVal;
					   	ResultSet R=P.executeQuery();
					   	int x=1;
					   	while(R.next()){
							yVal = R.getString("Cost").substring(3);
							xVal = Integer.toString(x);
							x++;
							map = new HashMap<Object,Object>(); 
							map.put("x", Double.parseDouble(xVal)); 
							map.put("y", Double.parseDouble(yVal)); 
							list.add(map);
							dataPoints = gsonObj.toJson(list);
						}
					   	PreparedStatement Pe=Con.prepareStatement("SELECT CType FROM journey");
					   	ResultSet Re=Pe.executeQuery();
					   	int Bi=0, Mi=0, Se=0, Pr=0;
					   	while(Re.next()){
							if (Re.getString("CType").equals("Bike")) {
								Bi++;
							} else if (Re.getString("CType").equals("Mini")) {
								Mi++;
							} else if (Re.getString("CType").equals("Sedan")) {
								Se++;
							} else {
								Pr++;
							}
						}
					   	request.setAttribute("Type1", Bi);
					   	request.setAttribute("Type2", Mi);
					   	request.setAttribute("Type3", Se);
					   	request.setAttribute("Type4", Pr);					   	
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
		</div>
		<input type="text" id="Val1" class="Inp" value="${Type1}"/>
		<input type="text" id="Val2" class="Inp" value="${Type2}"/>
		<input type="text" id="Val3" class="Inp" value="${Type3}"/>
		<input type="text" id="Val4" class="Inp" value="${Type4}"/>
		<h1 style="text-align: center; margin-top: 4%">Statistical Analysis</h1>
		<div id="Graphs" style="background: lightgreen;">			
			<div id="chartContainer" style="height: 348px; width: 49%; padding: 10px"></div>
			<div id="pieContainer" style="margin-left:2%; height: 185px; width: 40%; padding: 10px;"></div>	
		</div>
	</div>
</body>
<script>
	window.onload = function() { 
	 
	<% if(dataPoints != null) { %>
	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		exportEnabled: true,
		title: {
			text: "Line graph for every ride cost."
		},
		axisX: {
	      	interval: 1,
	      	title: "Rides"
	      },
	    axisY: {
	      	title: "Cost in Rupees"
	      },
		data: [{
			type: "line", 
			dataPoints: <%out.print(dataPoints);%>
		}]
	});
	chart.render();
	<% } %> 
	 
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
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
	  var data = google.visualization.arrayToDataTable([
	  ['Type', 'Times booked'],
	  ['Bike', parseInt(document.getElementById("Val1").value)],
	  ['Mini', parseInt(document.getElementById("Val2").value)],
	  ['Sedan', parseInt(document.getElementById("Val3").value)],
	  ['Premium', parseInt(document.getElementById("Val4").value)]
	  ]);

	  var options = {'title':'Type of vehicles mostly used', 'width': 640, 'height': 348};

	  var chart = new google.visualization.PieChart(document.getElementById('pieContainer'));
	  chart.draw(data, options);
	}

</script>
</html>