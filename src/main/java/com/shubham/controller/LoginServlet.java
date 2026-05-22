package com.shubham.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.shubham.dao.DBConnection;

public class LoginServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException , IOException {
		
		
		String email = request.getParameter("email");
		
		String password = request.getParameter("password");
		
		try {
			
			String query = "select * from user where email=? and password=?";
			
			PreparedStatement pstmt = DBConnection.getConnection().prepareStatement(query);
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
		
		
			if(rs.next()) {
				
					String username = rs.getString("name");
					
					HttpSession session = request.getSession();
					
					session.setAttribute("username", username);
					
				
					System.out.println("Login Successfully ! ");
					
					response.getWriter().println(
							"<script>alert('Login Successfully!');"
							+ "window.location='DashboardPage.jsp';</script>");
						
			}else {
			
					System.out.println("Invalid Email & Password");
					
					response.getWriter().println(
							"<script>alert('Invalid Email or Password');"
							+ "window.location='LoginPage.jsp';</script>");
					
			}
			
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	

}
