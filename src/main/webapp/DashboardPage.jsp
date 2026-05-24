<%@page import="java.sql.*"%>

<%@page import="com.shubham.dao.DBConnection"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

	String username = (String)session.getAttribute("username");

	if(username == null){
		response.sendRedirect("LoginPage.jsp");
	}

	Connection con = DBConnection.getConnection();

	int totalAssets = 0;
	

	PreparedStatement ps1 =
	con.prepareStatement("select count(*) from assets");
	

	ResultSet rs1 = ps1.executeQuery();

	if(rs1.next()){
		totalAssets = rs1.getInt(1);
	}
	

	int totalCategories = 0;
	

	PreparedStatement ps2 =
	con.prepareStatement("select count(distinct category) from assets");

	ResultSet rs2 = ps2.executeQuery();
	

	if(rs2.next()){
		totalCategories = rs2.getInt(1);
	}

	
	int lowStock = 0;

	PreparedStatement ps3 =
	con.prepareStatement("select count(*) from assets where quantity < 5");

	ResultSet rs3 = ps3.executeQuery();

	if(rs3.next()){
		lowStock = rs3.getInt(1);
	}


	int totalValue = 0;

	PreparedStatement ps4 =
	con.prepareStatement("select sum(price * quantity) from assets");

	ResultSet rs4 = ps4.executeQuery();

	if(rs4.next()){
		totalValue = rs4.getInt(1);
	}

%>

<html>
<head>
	<meta charset="UTF-8">

	<title>Dashboard</title>

	<link rel="stylesheet"

		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

	<link rel="stylesheet" href="CSS/Dashboard.css">

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

			<a href="ViewAsset.jsp">
				<i class="fa-solid fa-eye"></i>
				View Assets
			</a>

			<a href="UpdateAsset.jsp">
				<i class="fa-solid fa-pen"></i>
				Update Asset
			</a>

			<a href="DeleteAsset.jsp">
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

			<h1>Dashboard</h1>

			<div class="profile">
				<i class="fa-solid fa-user"></i>
				
				<%= username %>
				
			</div>

		</div>


		<div class="banner">

			<div class="banner-text">

				<h2>Welcome, <%= username %> 👋</h2>

				<p>
					Manage your company assets efficiently using
					the Asset Management System dashboard.
				</p>

			</div>

			<div class="banner-image">

				<img src="https://cdn-icons-png.flaticon.com/512/4248/4248443.png">

			</div>

		</div>

		
		<div class="cards">

			<div class="card">

				<i class="fa-solid fa-box"></i>

				<h3>Total Assets</h3>

				<p><%= totalAssets %></p>

			</div>

			<div class="card">

				<i class="fa-solid fa-layer-group"></i>

				<h3>Categories</h3>

				<p><%= totalCategories %></p>

			</div>

			<div class="card">

				<i class="fa-solid fa-triangle-exclamation"></i>

				<h3>Low Stock</h3>

				<p><%= lowStock %></p>

			</div>

			<div class="card">

				<i class="fa-solid fa-indian-rupee-sign"></i>

				<h3>Total Value</h3>

				<p>₹<%= totalValue %></p>

			</div>

		</div>


		<div class="table-container">

			<h2>Recent Assets</h2>

			<table>

				<tr>
					<th>Asset Name</th>
					<th>Category</th>
					<th>Quantity</th>
					<th>Price</th>
				</tr>

				<%

					PreparedStatement ps5 =
					con.prepareStatement("select * from assets");

					ResultSet rs5 = ps5.executeQuery();

					while(rs5.next()){

				%>

				<tr>

					<td>
						<%= rs5.getString("assetName") %>
					</td>

					<td>
						<%= rs5.getString("category") %>
					</td>

					<td>
						<%= rs5.getInt("quantity") %>
					</td>

					<td>
						₹<%= rs5.getInt("price") %>
					</td>

				</tr>

				<%
					}
				%>

			</table>

		</div>

	</div>

</div>

</body>
</html>