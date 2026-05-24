package com.shubham.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shubham.dao.DBConnection;

public class ViewAsset extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession(false);

		if(session == null || session.getAttribute("username") == null){

			response.sendRedirect("LoginPage.jsp");

			return;
		}


		String search = request.getParameter("search");

		try {

			String query;

			PreparedStatement pstmt;


			if(search != null && !search.trim().isEmpty()) {

				query = "select * from assets where "
						+ "id LIKE ? OR "
						+ "assetName LIKE ? OR "
						+ "category LIKE ?";

				pstmt = DBConnection.getConnection()
						.prepareStatement(query);

				String keyword = "%" + search + "%";

				pstmt.setString(1, keyword);
				pstmt.setString(2, keyword);
				pstmt.setString(3, keyword);

			}else {

				query = "select * from assets";

				pstmt = DBConnection.getConnection()
						.prepareStatement(query);
			}

			ResultSet rs = pstmt.executeQuery();


			request.setAttribute("assetData", rs);


			request.getRequestDispatcher("ViewAsset.jsp")
			.forward(request, response);

		}catch(Exception e) {

			e.printStackTrace();
		}
	}
}