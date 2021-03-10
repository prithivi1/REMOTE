package com.remote.util;


import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static Connection con;
	
		public static Connection getConnection(){
			try {
	            // get connection
	            Class.forName("com.mysql.jdbc.Driver");  
	            System.out.println("DBConnecting....");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/check","root","1234");
	            System.out.println("Database Connected");
	        } catch(SQLException | ClassNotFoundException e) {
	           System.out.println("Error : " + e );
	       }
			return con;
		}
  }

