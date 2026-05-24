<%@page import="java.sql.ResultSet"%>


<%@page import="java.sql.Statement"%>


<%@page import="com.shubham.dao.DBConnection"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String username = (String)session.getAttribute("username");

	if(username == null){
		response.sendRedirect("LoginPage.jsp");
	}

	Statement stmt = DBConnection.getConnection().createStatement();

	ResultSet rs = stmt.executeQuery("select * from assets");
%>


<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">

		<title>Delete Assets</title>

	<link rel="stylesheet" href="CSS/DeletePageCSS.css">

	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

	</head>

	<body>

	<div class="container">

		<div class="topbar">

			<h1>Delete Assets</h1>

				<div class="profile">
					<i class="fa-solid fa-user"></i>
				<%= username %>
		</div>

	</div>

	<div class="table-container">

		<table>

			<tr>
				<th>ID</th>
				<th>Asset Name</th>
				<th>Category</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Purchase Date</th>
				<th>Action</th>
			</tr>

			<%
				while(rs.next()){
			%>

			<tr>

				<td><%= rs.getInt("id") %></td>

				<td><%= rs.getString("assetName") %></td>

				<td><%= rs.getString("category") %></td>

				<td>₹ <%= rs.getDouble("price") %></td>

				<td><%= rs.getInt("quantity") %></td>

				<td><%= rs.getString("purchaseDate") %></td>

				<td>

					<a class="delete-btn"
					href="DeleteAsset?id=<%= rs.getInt("id") %>"
					onclick="return confirm('Are you sure you want to delete this asset?')">

						<i class="fa-solid fa-trash"></i>
						Delete

					</a>

				</td>

			</tr>

			<%
				}
			%>

		</table>

	</div>

</div>

</body>
</html>