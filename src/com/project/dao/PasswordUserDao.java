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
public class PasswordUserDao extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();	
		
		try {
			Connection con=Connectioning.initializeDatabase();
			
			String Password=req.getParameter("Password");
			
			HttpSession sessionLog=req.getSession();
			
			String Username=(String)sessionLog.getAttribute("User");
			String Number=(String)sessionLog.getAttribute("Phone");			
						
			PreparedStatement Ps1=con.prepareStatement("SELECT Password FROM customer WHERE Username=? AND Contact=?");
			PreparedStatement Ps2=con.prepareStatement("UPDATE customer SET Password=? WHERE Username=? AND Contact=?");
			
			Ps1.setString(1, Username);
			Ps1.setString(2, Number);
			
			Ps2.setString(1, Password);
			Ps2.setString(2, Username);
			Ps2.setString(3, Number);
			
			ResultSet Rs = Ps1.executeQuery();
			String OldPassword="";
			
			if (Rs.next()) {
				OldPassword=Rs.getString("Password");
			}
			
			if (OldPassword.equals(Password)) {
				RequestDispatcher rd=req.getRequestDispatcher("/JSP/CabFail.jsp");
				rd.forward(req, resp);
			} else {
				Ps2.executeUpdate();
				RequestDispatcher rd=req.getRequestDispatcher("/JSP/CabSuccess.jsp");
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
