<html>
<head>
<title>Login Page</title>

<link rel="stylesheet"

href="<%=request.getContextPath()%>/CSS/loginCSS.css">

</head>

<body>

	<div class="container">


		<div class="left-panel">


			<img src="https://cdn-icons-png.flaticon.com/512/2620/2620277.png"
			     alt="Asset Image">

			<h1>ASSET MANAGEMENT SYSTEM</h1>
			

			<p>
				Manage and track all your company assets
				in one smart digital platform.
			</p>

		</div>

		<div class="right-panel">

			<form action="LoginServlet" method="post">

				<h2>LoginPage</h2>


				<div class="input-box">

					<i class="fa-solid fa-envelope"></i>

					<input type="email" name="email"  placeholder="Enter Email"  required>

				</div>

				<div class="input-box">

					<i class="fa-solid fa-lock"></i>

					<input type="password" name="password"  placeholder="Enter Password" required>

				</div>
				

				<button type="submit"> Login </button>

				<p class="signup-text">

					Don't have an account ?

					<a href="SignUpPage.jsp">
						Sign Up
					</a>

				</p>

			</form>

		</div>

	</div>

</body>
</html>