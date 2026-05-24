package com.shubham.controller;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shubham.dao.DBConnection;

public class DeleteAsset extends HttpServlet{

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");

		try {

			PreparedStatement pstmt =
			DBConnection.getConnection().prepareStatement(
			"delete from assets where id=?");

			pstmt.setInt(1, Integer.parseInt(id));

			int i = pstmt.executeUpdate();

			if(i > 0){

				System.out.println("Asset Deleted Successfully");

				response.sendRedirect("DashboardPage.jsp");

			}else{

				System.out.println("Delete Failed");

			}

		}catch(Exception e){

			e.printStackTrace();

		}

	}

}