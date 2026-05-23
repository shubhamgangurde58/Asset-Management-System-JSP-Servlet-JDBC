<html>
<head>


<title>Add Asset</title>

<link rel="stylesheet" href="CSS/AddAssetCSS.css">

</head>
<body>

	<div class="container">

		<h1>Add New Asset</h1>

		<form action="AddAsset" method="post">
		

			<div class="input-group">
				<label>Asset Name</label>
				<input type="text" name="assetName" required>
			</div>
			

			<div class="input-group">
				<label>Category</label>
				<input type="text" name="category" required>
			</div>
			

			<div class="input-group">
				<label>Price</label>
				<input type="number" name="price" required>
			</div>


			<div class="input-group">
				<label>Quantity</label>
				<input type="number" name="quantity" required>
			</div>


			<div class="input-group">
				<label>Purchase Date</label>
				<input type="date" name="purchaseDate" required>
			</div>
			

			<button type="submit">Add Asset</button>

		</form>
		

	</div>

</body>
</html>