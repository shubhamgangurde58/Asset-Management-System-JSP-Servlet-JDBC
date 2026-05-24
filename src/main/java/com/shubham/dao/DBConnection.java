package com.shubham.dao;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection con;


	public static Connection getConnection() {


		try {
			if (con == null) {
				
				Driver d = new com.mysql.cj.jdbc.Driver();

				DriverManager.registerDriver(d);

				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assetservlet_db", "root", "root");
				
				System.out.println("Get Connection Sucessfully ! ");
				

			}
		} catch (Exception ex) {
			
			System.out.println("ERROR in Connection " + ex.getMessage());
			
		}
		return con;
	}
}
