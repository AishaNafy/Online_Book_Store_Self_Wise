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
    color: black;
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

        h1, h3 {
            color: white;
        }

        .title {
            font-size: 2em;
            margin: 0.125em 0;
        }

        .logout {
            margin: 0.75em 0;
            margin-right: 40px;
            background-color: rgb(28, 28, 75);
            padding: 8px 12px;
            border-radius: 12px;
        }

        .logo {
            margin-left: 30px;
        }

        .container {
            margin-top: 50px;
        }

        .item-image {
            margin-top: 15px;
        }

        .submit-btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<nav>
    <div class="admin-nav">
        <div class="logo">
            <img class="logo" src="logo.png" alt="profImage" height="40px">
        </div>
			<a href="./admin-dash.jsp" class="adminDashnav"><h1 class="title">Admin
					Dashboard</h1></a>
			<div class="nav-links">
            <a href="" class="logoutBTN">
                <h3 class="logout">Logout</h3>
            </a>
        </div>
    </div>
</nav>
    
    <%
		String itemNo = request.getParameter("itemNo");
		String itemName = request.getParameter("itemName");
		String description = request.getParameter("description");
		String itemImage = request.getParameter("itemImage");
		String price = request.getParameter("price");
	%>
	
	
    <div class="container">
        <form class="add-items-form" action="delete" method="post" id="items_form">
            <fieldset>
                <c:forEach var="item" items="${items}">
                    <c:set var="itemImage" value="${item.itemImage}" />
                    <c:out value="${item.itemImage}" />
                </c:forEach>
    
                <legend>Delete Book</legend>
    
                <div class="form-group">
                    <label for="itemNo">Book Number</label>
                    <input name="itemNo" id="itemNo" class="form-control" type="text" value="<%=itemNo%>" readonly>
                </div>
    
                <div class="form-group">
                    <label for="itemName">Book Name</label>
                    <input name="itemName" id="itemName" class="form-control" type="text" value="<%=itemName%>"readonly>
                </div>
    
                <div class="form-group">
                    <label for="description">Book Description</label>
                    <input name="description" id="description" class="form-control" type="text" value="<%=description%>"readonly>
                </div>
    
                <div class="form-group item-image">
                    <label for="itemImage">Book Cover Image</label>
                    <input name="itemImage" id="itemImage" class="form-control" type="text" value="<%=itemImage%>"readonly>
 

                </div>
    
                <div class="form-group">
                    <label for="price">Book Price</label>
                    <input name="price" id="price" class="form-control" type="text" value="<%=price%>"readonly>
                </div>
    
                <div class="form-group submit-btn">
                	<button type="button" class="btn btn-secondary" onclick="history.back();">Back</button>
				    <button type="submit" class="btn btn-danger" id="deleteButton">Delete Book</button>
					<script>
					document.addEventListener("DOMContentLoaded", function() {
					  // Get a reference to the delete button
					  const deleteButton = document.getElementById("deleteButton");
					  // Add a click event listener to the delete button
					  deleteButton.addEventListener("click", function() {
					    // Display a confirmation dialog
					    const confirmation = confirm("Do you want to delete this item?");
					    if (confirmation) {
					      alert("Item deleted.");
					    }
					  });
					});
					</script>

				    
				</div>

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