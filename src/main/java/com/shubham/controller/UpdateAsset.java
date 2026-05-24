package com.shubham.controller;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shubham.dao.DBConnection;

public class UpdateAsset extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");

		String assetName =
		request.getParameter("assetName");

		String category =
		request.getParameter("category");

		String price =
		request.getParameter("price");

		String quantity =
		request.getParameter("quantity");

		String purchaseDate =
		request.getParameter("purchaseDate");

		try {

			String query =
			"update assets set assetName=?, category=?, price=?, quantity=?, purchaseDate=? where id=?";

			PreparedStatement pstmt =
			DBConnection.getConnection()
			.prepareStatement(query);

			pstmt.setString(1, assetName);
			pstmt.setString(2, category);
			pstmt.setDouble(3,Double.parseDouble(price));

			pstmt.setInt(4,Integer.parseInt(quantity));

			pstmt.setString(5, purchaseDate);

			pstmt.setInt(6,Integer.parseInt(id));

			int rows = pstmt.executeUpdate();

			if(rows > 0){

				System.out.println("Asset Updated Successfully!");

			}

			response.sendRedirect("ViewAsset.jsp");

		}catch(Exception e){

			e.printStackTrace();

		}

	}

}