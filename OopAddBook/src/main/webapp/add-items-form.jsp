<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: sans-serif;
}

body{
    margin: 0;
}

html{
    display: contents;
    font-family: 'Ubuntu', sans-serif;
    box-sizing: border-box;
    margin: 0 0 0 0 ;
    padding: 0;
    background-repeat: no-repeat;
    background-size: cover;
}

.admin-nav{
    background-color: #b39690;
    padding: 4px;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between; /* Center horizontally */
}

h1,h3{
    color: white;
} 

.title{
    font-size: 2em;
    margin: 0.125em 0;
}

.logout{
    
    margin:10px 0;
    margin-right: 40px;
    background-color: #b39690;
    padding: 8px 12px;
    border-radius: 12px;
    font-size:16pt;
}

.buttons{
    display: flex;
    background-color: #b39690;
}

.logo{
    margin-left: 30px;
}
	
</style>
<nav>
    <div class="admin-nav">
        <div class="logo">
            <img class="logo" src="logo.png" alt="profImage" height="40px">
        </div>
			<a href="./admin-dash.jsp" class="adminDashnav"><h1 class="title">Admin
					Dashboard</h1></a>
			<div class="nav-links">
            <a href="./admin-dash.jsp" class="logoutBTN">
                <h3 class="logout">Logout</h3>
            </a>
        </div>
    </div>
</nav>
</head>

<body>
<div class="container" style="width:700px; margin-top:80px;">

    <form class="add-items-form" action="insertItem" method="post" enctype="multipart/form-data" id="items_form">
    <fieldset>
        <!-- Form Name -->
        <legend class="mt-5" style="font-family: 'Ubuntu'" >Add Books</legend>
        
        <!-- Item Name input -->
        <div class="form-group">
            <label for="itemName">Book Name</label>
            <input type="text" name="itemName" class="form-control" id="itemName" placeholder="Item Name">
            <span id="itemNameError" class="text-danger"></span>
        </div>
        
        <!-- Description input -->
        <div class="form-group">
            <label for="description">Book Description</label>
            <input type="text" name="description" class="form-control" id="description" placeholder="Description" required>
            <span id="descriptionError" class="text-danger"></span>
        </div>
        
        <!-- Image input -->
        <div class="form-group">
            <label for="itemImage">Book Cover Image</label>
            <input type="file" name="itemImage" class="form-control-file" id="itemImage" accept="image/jpeg, image/png, image/jpg" required>
        </div>
        
        <!-- Empty image element to display the selected image -->
        <img id="selectedImage" src="#" alt="Selected Image" style="max-width: 300px; display: none;" required>
        
        <!-- JavaScript to handle image preview -->
        <script>
            var itemImageInput = document.getElementById("itemImage");
            var selectedImage = document.getElementById("selectedImage");

            itemImageInput.addEventListener("change", function () {
                var file = itemImageInput.files[0];

                if (file) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        selectedImage.src = e.target.result;
                        selectedImage.style.display = "block";
                    };
                    reader.readAsDataURL(file);
                } else {
                    selectedImage.style.display = "none";
                }
            });
        </script>

        <!-- Price input -->
        <div class="form-group">
            <label for="price">Book Price</label>
            <input type="text" name="price" class="form-control" id="price" placeholder="Price" required>
            <span id="priceError" class="text-danger"></span>
        </div>

        <!-- Submit button -->
        <button type="submit" class="btn btn-primary" style="background-color: #b39690;"> Add Book</button>
    </fieldset>
</form>

</div>
</body>

<br><br><br><br>
<footer style="background-color: #b39690; padding: 20px 0; color: white; text-align: center; width: 100%; position: relative; bottom: 0;">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>Admin Links</h5>
                <ul style="list-style-type: none; padding: 0;">
                    <li><a href="./admin-dash.jsp" style="color: white; text-decoration: none;">Dashboard</a></li>
                    <li><a href="#" style="color: white; text-decoration: none;">Manage Items</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Support</h5>
                <p>For any support, please contact:</p>
                <p>Email: support@ShelfWise.com</p>
                <p>Phone: +123 456 7890</p>
            </div>
            <div class="col-md-4">
                <h5>Company Info</h5>
                <p>&copy; 2024 Shelf Wise. All rights reserved.</p>
                <p><a href="#" style="color: white; text-decoration: none;">Privacy Policy</a> | <a href="#" style="color: white; text-decoration: none;">Terms of Service</a></p>
            </div>
        </div>
    </div>
</footer>

</html>