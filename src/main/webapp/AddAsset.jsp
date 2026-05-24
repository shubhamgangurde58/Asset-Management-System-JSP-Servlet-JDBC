
<html>
<head>


<title>Add Asset</title>

<link rel="stylesheet" href="CSS/AddAssetCSS.css">

</head>

	<script>
		
		function validateForm(){
		
			let assetName = document.forms[0]["assetName"].value;
		
			let category = document.forms[0]["category"].value;
		
			let price = document.forms[0]["price"].value;
		
			let quantity = document.forms[0]["quantity"].value;
		
		
			if(assetName == "" || category == "" || price == "" || quantity == ""){
		
				alert("All fields are required!");
		
				return false;
			}
		
		
			if(price <= 0){
		
				alert("Price must be greater than 0");
		
				return false;
			}
		
		
			if(quantity <= 0){
		
				alert("Quantity must be greater than 0");
		
				return false;
			}
		
		
			if(assetName.length < 2){
		
				alert("Asset Name is too short");
		
				return false;
			}
		
			return true;
		}
		
	</script>

<body>

	<div class="container">

		<h1>Add New Asset</h1>

		<form action="AddAsset" method="post" onsubmit="return validateForm()">
		

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