package com.shubham.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shubham.dao.DBConnection;

public class ExportExcelServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {

			response.setContentType("text/csv");

			response.setHeader("Content-Disposition","attachment; filename=AssetData.csv");

			PrintWriter out = response.getWriter();


			out.println("ID,Asset Name,Category,Price,Quantity,Purchase Date");

			Statement stmt = DBConnection.getConnection().createStatement();

			String query ="select * from assets";

			ResultSet rs = stmt.executeQuery(query);

			while(rs.next()) {

				out.println(

				rs.getInt("id") + "," +

				rs.getString("assetName") + "," +

				rs.getString("category") + "," +

				rs.getDouble("price") + "," +

				rs.getInt("quantity") + "," +

				rs.getString("purchaseDate")

				);

			}

			out.close();

			System.out.println("Excel Export Successful!");

		}catch(Exception e) {

			e.printStackTrace();

		}

	}

}