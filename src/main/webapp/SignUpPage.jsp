
<html>
<head>
<meta charset="UTF-8">
<title>SignUp Page</title>

<link rel="stylesheet"

href="<%=request.getContextPath()%>/CSS/signupCSS.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

</head>

<body>

	<div class="container">

		<div class="left-panel">

			<img src="https://cdn-icons-png.flaticon.com/512/2620/2620277.png"
			     alt="Asset Image">

			<h1>JOIN OUR SYSTEM</h1>

			<p>
				Create your account and manage assets
				easily with our smart management system.
			</p>

		</div>

		<div class="right-panel">

			<form action="SignUpServlet" method="post">

				<h2>Sign Up</h2>


				<div class="input-box">

					<i class="fa-solid fa-user"></i>

					<input type="text" name="name" placeholder="Enter Full Name" required>

				</div>


				<div class="input-box">

					<i class="fa-solid fa-envelope"></i>

					<input type="email" name="email" placeholder="Enter Email" required>

				</div>

				<div class="input-box">

					<i class="fa-solid fa-lock"></i>

					<input type="password"  name="password" placeholder="Enter Password" required>

				</div>


				<button type="submit">
					Create Account
				</button>

				<p class="login-text">

					Already have an account ?

					<a href="LoginPage.jsp">
						Login
					</a>

				</p>
				

			</form>
			

		</div>

	</div>

</body>
</html>