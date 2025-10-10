<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="admin-styles.css">
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
    color: white;
}

html{
    display: contents;
    font-family: 'Ubuntu', sans-serif;
    box-sizing: border-box;
    margin: 0 0 0 0 ;
    padding: 0;
    background-image: url('adminbg2.jpg');
    background-repeat: no-repeat;
    background-size: cover;
    background-color:whitesmoke;
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
.mngProdTxt{
	color: white;
}
.title{
    font-size: 2em;
    margin: 0.125em 0;
}
.logout {
        margin: 10px 0;
        margin-right: 40px;
        background-color: #b39690;
        padding: 8px 12px;
        border-radius: 12px;
        font-size: 16pt;
        color: #FFFFFF; 
    }

    .logout:hover {
        color: white; 
    }

.item-name, .item_price{
	color: black;
	margin-bottom: 0;
}


.logo{
    margin-left: 30px;
}
.manage-prod-link, .orders-link, .users-link{
	    text-decoration: none;
	   
	
}

.itemdes{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12pt;
	margin-top: 0;
	
}

.table-row-admin{
    background-color: white;
    margin: 50px 0 ;
    
}
.manage_products {
    border: 2px solid #b39690; /* Set the border color to #b39690 */
    border-radius: 20px;
    margin: 30px;
    padding: 10px 20px;
    background-color: #b39690;
    color: white; /* Make sure text color is readable */
}

.manage_products, .orders, .users{
    border-radius: 20px;
    margin: 30px;
    padding : 10px 20px;
    background-color: #b39690;
}
.manage_products:hover, .orders:hover, .users:hover{

    background-color: #b39690;
}

.buttons{
	display: flex;
	align-items: center;
    justify-content: center;
    margin: 0 auto,#b39690 ;
    margin: 0 auto; /* Center the buttons */
    margin-top: 30px;
   
}
	
</style>
<nav>
    <div class="admin-nav">
        <div class="logo">
            <img class="logo" src="logo.png" alt="profImage" height="40px">
        </div>
			<h1 class="title">Admin
					Dashboard</h1>
			<div class="nav-links">
            <a href="./index.html" class="logoutBTN">
                <h3 class="logout">Logout</h3>
            </a>
        </div>
    </div>
</nav>
</head>
<body >
<div class="buttons">
		<div class="buttons"> 
    <button class="manage_products" onclick="window.location.href='./add-items-form.jsp'">
        <img class="mngProdIcon" src="./images/manageProd.png" alt="profImage" height="120px">
        <h1 class="mngProdTxt">Add Book</h1>
    </button>

    <button class="manage_products" onclick="window.location.href='./AdminViewServlet'">
        <img class="mngProdIcon" src="./images/manage.png" alt="profImage" height="120px">
        <h1 class="mngProdTxt">Manage Books</h1>
    </button>
    
    <button class="manage_products" onclick="window.location.href='./ViewAllBooks'">
        <img class="mngProdIcon" src="./images/shop.png" alt="profImage" height="120px">
        <h1 class="mngProdTxt">Shop Page</h1>
    </button>
</div>
		

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
