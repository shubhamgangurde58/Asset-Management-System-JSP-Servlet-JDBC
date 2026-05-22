<html>
<head>
<meta charset="UTF-8">

<title> Dashboard </title>

<link rel="stylesheet"

href="<%=request.getContextPath()%>/CSS/dashboardCSS.css">


<link rel="stylesheet"

href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

</head>

<body>


	<div class="sidebar">

		<div class="logo-section">

			<img src="https://cdn-icons-png.flaticon.com/512/2620/2620277.png">

			<h2>AMS</h2>

		</div>

		<ul>

			<li>
				<a href="#">
					<i class="fa-solid fa-house"></i>
					Dashboard
				</a>
			</li>

			<li>
				<a href="addAsset.jsp">
					<i class="fa-solid fa-plus"></i>
					Add Asset
				</a>
			</li>

			<li>
				<a href="viewAsset.jsp">
					<i class="fa-solid fa-eye"></i>
					View Assets
				</a>
			</li>

			<li>
				<a href="updateAsset.jsp">
					<i class="fa-solid fa-pen"></i>
					Update Asset
				</a>
			</li>

			<li>
				<a href="#">
					<i class="fa-solid fa-trash"></i>
					Delete Asset
				</a>
			</li>

			<li>
				<a href="login.jsp">
					<i class="fa-solid fa-right-from-bracket"></i>
					Logout
				</a>
			</li>

		</ul>

	</div>

	<div class="main-content">


		<div class="topbar">

			<h1>Dashboard</h1>

			<div class="admin">

				<i class="fa-solid fa-user"></i>

				<span>Admin</span>

			</div>

		</div>


		<div class="welcome-card">

			<div class="welcome-text">
			
				<%@ page session="true" %>

				<h2>Welcome, <%= session.getAttribute("username") %> </h2>

				<p>
					Manage all your assets efficiently using
					the Asset Management System dashboard.
				</p>

			</div>

			<img src="https://cdn-icons-png.flaticon.com/512/1055/1055687.png">

		</div>


		<div class="card-container">

			<div class="card">

				<i class="fa-solid fa-plus"></i>

				<h3>Add Asset</h3>

				<p>Add new assets into the system.</p>

			</div>

			<div class="card">

				<i class="fa-solid fa-eye"></i>

				<h3>View Assets</h3>

				<p>View all available asset records.</p>

			</div>

			<div class="card">

				<i class="fa-solid fa-pen"></i>

				<h3>Update Asset</h3>

				<p>Edit and manage existing assets.</p>

			</div>

			<div class="card">

				<i class="fa-solid fa-trash"></i>

				<h3>Delete Asset</h3>

				<p>Remove unwanted assets from system.</p>

			</div>

		</div>

	</div>

</body>
</html>