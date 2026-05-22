package com.shubham.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shubham.dao.DBConnection;


public class SignUpServlet extends HttpServlet{
	
	
	public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException ,IOException {
		
			String name = request.getParameter("name");
			
			String email = request.getParameter("email");
			
			String password = request.getParameter("password");
			
			
			try {
				
					Statement stmt = DBConnection.getConnection().createStatement();
					
					String query = "insert into user(name,email,password) " + "values('"+name+"','"+email+"','"+password+"')";
					
					int i = stmt.executeUpdate(query);
					
					if(i > 0) {
						
						System.out.println("Registration Successful !");
						response.getWriter().println(
								"<script>alert('SignUp Successfully!');"
								+ "window.location='LoginPage.jsp';</script>");

						
					}else {
						
						System.out.println("Registration Failed !");
					}
					
					System.out.println("Registration Successfully ");
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		
	}
	

}
