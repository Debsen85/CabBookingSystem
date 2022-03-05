package com.project.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.project.connectDatabase.Connectioning;

@SuppressWarnings("serial")
public class AdminDriverAdd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();	
		
		try {
			Connection con=Connectioning.initializeDatabase();
			
			String Name=req.getParameter("Name1");
			String Phone=req.getParameter("Contact1");
			String CarType=req.getParameter("CarType");
			String CarNumber=req.getParameter("CarNumber");			
			
			PreparedStatement Ps1=con.prepareStatement("SELECT *FROM driver WHERE DriverPhone=?");
			PreparedStatement Ps2=con.prepareStatement("INSERT INTO driver VALUES (?, ?, ?, ?, ?)");
			
			Ps1.setString(1, Phone);
			
			Ps2.setString(1, Name);
			Ps2.setString(2, Phone);
			Ps2.setString(3, CarType);
			Ps2.setString(4, CarNumber);
			Ps2.setString(5, " ");			
			
			ResultSet Rs = Ps1.executeQuery();
			
			if (Rs.next()) {
				req.setAttribute("Message", "Data already present with same number!");
				RequestDispatcher rd=req.getRequestDispatcher("/JSP/AdminDriverUpdate.jsp");
				rd.forward(req, resp);
			} else {
			
				Ps2.executeUpdate();		
				req.setAttribute("Message", "Successfully added!");       				
				RequestDispatcher rd=req.getRequestDispatcher("/JSP/AdminDriverUpdate.jsp");
				rd.forward(req, resp);				
			}			
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
