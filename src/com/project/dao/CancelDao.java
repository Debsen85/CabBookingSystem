package com.project.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.project.connectDatabase.Connectioning;

@SuppressWarnings("serial")
public class CancelDao extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();	
		
		try {
			Connection con=Connectioning.initializeDatabase();
			
			PreparedStatement Ps=con.prepareStatement("INSERT INTO journey VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			HttpSession sessionLog=req.getSession(); 
			
			String Name=(String)sessionLog.getAttribute("Name");
			String Number=(String)sessionLog.getAttribute("Phone");
			
			HttpSession sessionCab=req.getSession();
			
			String Origin=(String)sessionCab.getAttribute("Origin");	
			String Destination=(String)sessionCab.getAttribute("Destination");	
			String Duration=(String)sessionCab.getAttribute("Duration");	
			String Distance=(String)sessionCab.getAttribute("Distance");
			String Cost=(String)sessionCab.getAttribute("Cost");	
			
			HttpSession sessionDriver=req.getSession();
			
			String Driver=(String)sessionDriver.getAttribute("Driver");
			String DriverPhone=(String)sessionDriver.getAttribute("DriverPhone");
			String CarType=(String)sessionDriver.getAttribute("CarType");
			String CarNumber=(String)sessionDriver.getAttribute("CarNumber");
						
			Ps.setString(1, Name);
			Ps.setString(2, Number);
			Ps.setString(3, Origin);
			Ps.setString(4, Destination);
			Ps.setString(5, Distance);
			Ps.setString(6, Duration);
			Ps.setString(7, Cost);
			Ps.setString(8, Driver);
			Ps.setString(9, DriverPhone);
			Ps.setString(10, CarType);
			Ps.setString(11, CarNumber);
			Ps.setString(12, "N/A");
			Ps.setString(13, "Cancelled");
			
			Ps.executeUpdate();
			
			RequestDispatcher rd=req.getRequestDispatcher("/JSP/CabBookFail.jsp");
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
