package com.project.connectDatabase;

import java.sql.*;
 
public class Connectioning { 
	
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException 
    { 
    	Class.forName("com.mysql.jdbc.Driver");		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javatraining", "root", "root");
		System.out.println("Created DB Connection......");
		return con;		
    } 
} 