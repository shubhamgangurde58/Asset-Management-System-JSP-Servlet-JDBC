
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>

<%@page import="com.shubham.dao.DBConnection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%
	String username = (String)session.getAttribute("username");

	if(username == null){
		response.sendRedirect("LoginPage.jsp");
	}

	String search = request.getParameter("search");

	int pageSize = 10;
	int pageNo = 1;

	if(request.getParameter("page") != null){
		pageNo = Integer.parseInt(request.getParameter("page"));
	}

	int start = (pageNo - 1) * pageSize;
%>

<html>
	<head>
	<meta charset="UTF-8">
	<title>View Assets</title>

	<link rel="stylesheet"
	
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

	<link rel="stylesheet" href="CSS/ViewAssetCSS.css">

</head>

<body>

<div class="container">


	<div class="sidebar">

		<div class="logo">

			<img src="https://cdn-icons-png.flaticon.com/512/2620/2620277.png">

			<h1>AMS</h1>

		</div>

		<div class="menu">

			<a href="DashboardPage.jsp">
				<i class="fa-solid fa-house"></i>
				Dashboard
			</a>

			<a href="AddAsset.jsp">
				<i class="fa-solid fa-plus"></i>
				Add Asset
			</a>

			<a href="ViewAsset.jsp" class="active">
				<i class="fa-solid fa-eye"></i>
				View Assets
			</a>

			<a href="ViewAsset.jsp">
				<i class="fa-solid fa-trash"></i>
				Delete Asset
			</a>

			<a href="LogoutServlet">
				<i class="fa-solid fa-right-from-bracket"></i>
				Logout
			</a>

		</div>

	</div>


	<div class="main">

		<div class="topbar">

			<h1>View Assets</h1>

			<div class="profile">
				<i class="fa-solid fa-user"></i>
				<%= username %>
			</div>

		</div>


		<div class="action-bar">

			<form action="ViewAsset.jsp" method="get">

				<input type="text"
				name="search"
				placeholder="Search by ID or Asset Name"
				value="<%= search != null ? search : "" %>">

				<button type="submit">
					<i class="fa-solid fa-magnifying-glass"></i>
					Search
				</button>

			</form>

			<div class="right-buttons">

				<a href="DashboardPage.jsp" class="back-btn">
					<i class="fa-solid fa-arrow-left"></i>
					Back Dashboard
				</a>

				<a href="ExportExcelServlet" class="export-btn">

					<i class="fa-solid fa-file-excel"></i>

					Export Excel

				</a>

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

					<th>Edit</th>

					<th>Delete</th>

				</tr>

				<%

					try{

						PreparedStatement pstmt;

						if(search != null && !search.trim().isEmpty()){

							boolean isNumber = true;

							try{
								Integer.parseInt(search);
							}catch(Exception e){
								isNumber = false;
							}

							if(isNumber){

								pstmt = DBConnection.getConnection().prepareStatement("select * from assets where id=? limit ?,?");

								pstmt.setInt(1, Integer.parseInt(search));
								pstmt.setInt(2, start);
								pstmt.setInt(3, pageSize);

							}else{

								pstmt = DBConnection.getConnection().prepareStatement("select * from assets where assetName like ? limit ?,?");

								pstmt.setString(1,"%" + search + "%");
								pstmt.setInt(2, start);
								pstmt.setInt(3, pageSize);

							}

						}else{

							pstmt = DBConnection.getConnection().prepareStatement("select * from assets limit ?,?");

							pstmt.setInt(1, start);
							pstmt.setInt(2, pageSize);

						}

						ResultSet rs = pstmt.executeQuery();

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

						<a href="UpdateAsset.jsp?id=<%= rs.getInt("id") %>" class="edit-btn">

							<i class="fa-solid fa-pen"></i>

						</a>

					</td>

					<td>

						<a href="DeleteAsset?id=<%= rs.getInt("id") %>" class="delete-btn"
						
						onclick="return confirm('Are you sure you want to delete this asset?')">

							<i class="fa-solid fa-trash"></i>

						</a>

					</td>

				</tr>

				<%
						}

					}catch(Exception e){

						e.printStackTrace();

					}
				%>

			</table>

		</div>


		<div class="pagination">

			<%
				if(pageNo > 1){
			%>

			<a href="ViewAsset.jsp?page=<%= pageNo-1 %>">
				Previous
			</a>

			<%
				}
			%>

			<span>Page <%= pageNo %></span>

			<a href="ViewAsset.jsp?page=<%= pageNo+1 %>">
				Next
			</a>

		</div>

	</div>

</div>

</body>
</html>