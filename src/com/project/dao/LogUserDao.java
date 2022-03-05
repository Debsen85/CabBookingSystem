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
public class LogUserDao extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();	
		
		try {
			Connection con=Connectioning.initializeDatabase();
			
			String Username=req.getParameter("Username");
			String Password=req.getParameter("Password");
			
			if (Username.equals("Admin123") && Password.equals("Admin@123")) {
				
				 RequestDispatcher rd=req.getRequestDispatcher("/JSP/AdminIndexSuccess.jsp");
				 rd.forward(req, resp);
				 
			} else {
				
				PreparedStatement Ps=con.prepareStatement("SELECT *FROM customer WHERE Username=? AND Password=?");
				
				Ps.setString(1, Username);
				Ps.setString(2, Password);
				ResultSet Rs = Ps.executeQuery();
				String Name, Age, Email, Phone;
				
				if (Rs.next()) {
					Name=Rs.getString("Name");				
					Age=Rs.getString("Age");
					Email=Rs.getString("Email");
					Phone=Rs.getString("Contact");
					Username=Rs.getString("Username");
					
					HttpSession sessionLog=req.getSession(); 
		        	sessionLog.setAttribute("Name", Name);  
		            sessionLog.setAttribute("Age", Age);  
		            sessionLog.setAttribute("Email", Email);  
		            sessionLog.setAttribute("Phone", Phone);  
		            sessionLog.setAttribute("User", Username); 	            
		            
		            RequestDispatcher rd=req.getRequestDispatcher("/JSP/IndexLogSuccess.jsp");
					rd.forward(req, resp);
				} else {
					RequestDispatcher rd=req.getRequestDispatcher("/JSP/IndexFail.jsp");
					rd.forward(req, resp);
				}
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
