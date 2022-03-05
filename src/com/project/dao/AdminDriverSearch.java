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
import javax.servlet.http.HttpSession;

import com.project.connectDatabase.Connectioning;

@SuppressWarnings("serial")
public class AdminDriverSearch extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();	
		
		try {
			Connection con=Connectioning.initializeDatabase();
			
			String Name=req.getParameter("Name3");
			String Phone=req.getParameter("Contact3");
						
			PreparedStatement Ps1=con.prepareStatement("SELECT *FROM driver WHERE DriverPhone=? AND Driver=?");			
			
			Ps1.setString(1, Phone);
			Ps1.setString(2, Name);
			
			ResultSet Rs = Ps1.executeQuery();
			
			if (Rs.next()) {
				HttpSession sessionAdmin=req.getSession(); 
				sessionAdmin.setAttribute("Dr", Rs.getString(1));  
				sessionAdmin.setAttribute("PN", Rs.getString(2));  
				sessionAdmin.setAttribute("CT", Rs.getString(3));  
				sessionAdmin.setAttribute("CN", Rs.getString(4));  
				sessionAdmin.setAttribute("Rt", Rs.getString(5));
				req.setAttribute("Message", "Match found!");
				RequestDispatcher rd=req.getRequestDispatcher("/JSP/AdminDriverSearch.jsp");
				rd.forward(req, resp);
			} else {				
				req.setAttribute("Message", "No match found!");       				
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
