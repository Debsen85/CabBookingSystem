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
public class AdminDriverDelete extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();	
		
		try {
			Connection con=Connectioning.initializeDatabase();
			
			String Name=req.getParameter("Name2");
			String Phone=req.getParameter("Contact2");
						
			PreparedStatement Ps1=con.prepareStatement("SELECT *FROM driver WHERE DriverPhone=?");
			PreparedStatement Ps2=con.prepareStatement("DELETE FROM driver WHERE DriverPhone=? AND Driver=?");
			
			Ps1.setString(1, Phone);
			
			Ps2.setString(1, Phone);
			Ps2.setString(2, Name);			
					
			ResultSet Rs = Ps1.executeQuery();
			
			if (Rs.next()) {
				Ps2.executeUpdate();	
				req.setAttribute("Message", "Successfully deleted!");
				RequestDispatcher rd=req.getRequestDispatcher("/JSP/AdminDriverUpdate.jsp");
				rd.forward(req, resp);
			} else {				
				req.setAttribute("Message", "Driver is not present in the database!");       				
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
