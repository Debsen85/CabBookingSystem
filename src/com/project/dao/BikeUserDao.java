package com.project.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class BikeUserDao extends HttpServlet{
	
	private static DecimalFormat df = new DecimalFormat("0.00");

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		HttpSession sessionCab=req.getSession(); 
		
		String Distance=(String) sessionCab.getAttribute("Distance");		
		String Dist="";	
		for(int i=0; i<Distance.length(); i++) {
			if (Distance.charAt(i)==' ') {
				break;
			} else {
				Dist+=Distance.charAt(i);
			}
		}
		String Cost="Rs."+df.format(Double.parseDouble(Dist)*6.0);	
			
		sessionCab.setAttribute("Cost", Cost);	
		sessionCab.setAttribute("Type", "Bike");
		
		resp.sendRedirect("S9");
		
		out.close();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
}
