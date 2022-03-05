package com.project.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.project.Api.MessageSend;
import com.project.connectDatabase.Connectioning;

@SuppressWarnings("serial")
public class DetailDriverDao extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();	
		
		try {
			Connection con=Connectioning.initializeDatabase();
				
			PreparedStatement Ps=con.prepareStatement("SELECT *FROM driver WHERE CarType=? ORDER BY RAND() LIMIT 1 ");			
			HttpSession sessionCab=req.getSession(); 		
			String Type=(String)sessionCab.getAttribute("Type");			
			String Driver="", DriverPhone="", CarType="", CarNumber="", Rating="";
			Ps.setString(1, Type);
			ResultSet Rs = Ps.executeQuery();
			if (Rs.next()) {
				Driver=Rs.getString("Driver");				
				DriverPhone=Rs.getString("DriverPhone");
				CarType=Rs.getString("CarType");
				CarNumber=Rs.getString("CarNumber");
				Rating=Rs.getString("Rating");			
			
				if (Rating.equals(" ")) {
					Rating="First Service";
				}
			}
			HttpSession sessionLog=req.getSession(); 
			String Phone=(String)sessionLog.getAttribute("Phone");
			Random Rnd = new Random();
		    int number = Rnd.nextInt(999999);
		    String OTP=String.format("%06d", number);
			MessageSend.sendMessage("This+is+your+OTP+"+OTP, Phone);
			
			HttpSession sessionDriver=req.getSession(); 
			sessionDriver.setAttribute("Driver", Driver);  
			sessionDriver.setAttribute("DriverPhone", DriverPhone);  
			sessionDriver.setAttribute("CarType", CarType);  
			sessionDriver.setAttribute("CarNumber", CarNumber);  
			sessionDriver.setAttribute("Rating", Rating);
			sessionDriver.setAttribute("OTP", OTP);
	            
	        RequestDispatcher rd=req.getRequestDispatcher("/JSP/Booked.jsp");
			rd.forward(req, resp);			
		
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		out.close();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
}
