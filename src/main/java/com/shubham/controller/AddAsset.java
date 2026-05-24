package com.shubham.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shubham.dao.DBConnection;

public class AddAsset  extends HttpServlet {
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException , IOException {
		
		
		String assetName = request.getParameter("assetName");
		
		String category = request.getParameter("category");
		
		double price = Double.parseDouble(request.getParameter("price"));
		
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		String purchaseDate = request.getParameter("purchaseDate");
		
		
		
		try {
			
				String query = "insert into assets(assetName, category , price , quantity , purchaseDate) values(?,?,?,?,?)";
				
				PreparedStatement  pstmt  = DBConnection.getConnection().prepareStatement(query);
				
				pstmt.setString(1,assetName);
				pstmt.setString(2,category);
				pstmt.setDouble(3,price);
				pstmt.setInt(4, quantity);
				pstmt.setString(5,purchaseDate);
				
				int i = pstmt.executeUpdate();
				
				if(i > 0) {
					
					response.setContentType("text/html");

					PrintWriter out = response.getWriter();

					out.println("<script type='text/javascript'>");
					out.println("alert('Asset Added Successfully!');");
					out.println("location='DashboardPage.jsp';");
					out.println("</script>");
					System.out.println("Asset Added Successfully ! ");
					
				}else {
					
					System.out.println("Asset Not Added");
					
				}
						
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("ERROR in Connection "+e.getMessage());
		}	
		
	}

}
