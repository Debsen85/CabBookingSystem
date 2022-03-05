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

import com.project.bean.SignUserBean;
import com.project.connectDatabase.Connectioning;

@SuppressWarnings("serial")
public class SignUserDao extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();	
		
		try {
			Connection con=Connectioning.initializeDatabase();
			
			String Name=req.getParameter("Name");
			String Age=req.getParameter("Age");
			String Email=req.getParameter("Email");
			String Phone=req.getParameter("Phone");
			String Username=req.getParameter("Username");
			String Password=req.getParameter("Password");
			
			SignUserBean.setName(Name);
			SignUserBean.setAge(Age);
			SignUserBean.setEmail(Email);
			SignUserBean.setPhone(Phone);
			SignUserBean.setUsername(Username);
			SignUserBean.setPassword(Password);
			
			PreparedStatement Ps1=con.prepareStatement("SELECT *FROM Customer WHERE Username=? OR Contact=?");
			PreparedStatement Ps2=con.prepareStatement("INSERT INTO Customer VALUES (?, ?, ?, ?, ?, ?)");
			
			Ps1.setString(1, Username);
			Ps1.setString(2, Phone);
			
			Ps2.setString(1, Name);
			Ps2.setString(2, Age);
			Ps2.setString(3, Email);
			Ps2.setString(4, Phone);
			Ps2.setString(5, Username);
			Ps2.setString(6, Password);
			
			ResultSet Rs = Ps1.executeQuery();
			
			if (Rs.next()) {
				RequestDispatcher rd=req.getRequestDispatcher("/JSP/IndexFailSign.jsp");
				rd.forward(req, resp);
			} else {
			
				Ps2.executeUpdate();
				
				HttpSession sessionLog=req.getSession(); 
	        	sessionLog.setAttribute("Name", Name);  
	            sessionLog.setAttribute("Age", Age);  
	            sessionLog.setAttribute("Email", Email);  
	            sessionLog.setAttribute("Phone", Phone);  
	            sessionLog.setAttribute("User", Username);  
	                    				
				RequestDispatcher rd=req.getRequestDispatcher("/JSP/IndexSignSuccess.jsp");
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
