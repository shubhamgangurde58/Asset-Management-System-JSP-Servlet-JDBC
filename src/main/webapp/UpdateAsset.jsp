
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>

<%@page import="com.shubham.dao.DBConnection"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String id = request.getParameter("id");


	if(id == null){

		response.sendRedirect("ViewAsset.jsp");

		return;
	}

	PreparedStatement pstmt = DBConnection.getConnection().prepareStatement("select * from assets where id=?");

	pstmt.setInt(1, Integer.parseInt(id));

	ResultSet rs = pstmt.executeQuery();

	if(!rs.next()){

		response.sendRedirect("ViewAsset.jsp");

		return;
	}

%>

<html>

<head>

	<meta charset="UTF-8">

		<title>Update Asset</title>

		<link rel="stylesheet"
		href="CSS/UpdateAssetCSS.css">
	
</head>

<body>

<div class="container">

	<h1>Update Asset</h1>

	<form action="UpdateAsset" method="post">


		<input type="hidden"
		name="id"
		value="<%= rs.getInt("id") %>">


		<label>Asset Name</label>

		<input type="text"
		name="assetName"
		value="<%= rs.getString("assetName") %>"
		required>


		<label>Category</label>

		<input type="text"
		name="category"
		value="<%= rs.getString("category") %>"
		required>

		<label>Price</label>

		<input type="number"
		step="0.01"
		name="price"
		value="<%= rs.getDouble("price") %>"
		required>



		<label>Quantity</label>

		<input type="number"
		name="quantity"
		value="<%= rs.getInt("quantity") %>"
		required>


		<label>Purchase Date</label>

		<input type="date"
		name="purchaseDate"
		value="<%= rs.getString("purchaseDate") %>"
		required>

	
		<button type="submit">

			Update Asset

		</button>

	</form>

</div>

</body>
</html>