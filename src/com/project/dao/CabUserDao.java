package com.project.dao;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class CabUserDao extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		HttpSession sessionCab=req.getSession(); 
		
		String Origin=req.getParameter("PickUpLocation");
		String Destination=req.getParameter("DropOffLocation");
		String Landmark=req.getParameter("Landmark");
		String Distance=req.getParameter("Distance");
		String Duration=req.getParameter("Duration");	
		
		sessionCab.setAttribute("Origin", Origin);
		sessionCab.setAttribute("Destination", Destination);
		sessionCab.setAttribute("Landmark", Landmark);
		sessionCab.setAttribute("Distance", Distance);
		sessionCab.setAttribute("Duration", Duration);		
		
		RequestDispatcher rd=req.getRequestDispatcher("/JSP/Book.jsp");
		rd.forward(req, resp);
		
		out.close();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
}
