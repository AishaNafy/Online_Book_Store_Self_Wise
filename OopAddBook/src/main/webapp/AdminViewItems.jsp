<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="admin-styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            margin: 10px 0;
            margin-right: 40px;
            background-color: #b39690;
            padding: 8px 12px;
            border-radius: 12px;
            font-size: 16pt;
        }

        .buttons {
            display: flex;
        }

        .item-name, .item_price {
            color: black;
            margin-bottom: 0;
            font-size:16pt;
        }
        .item_price{
        	padding-bottom: 8px;
        } 

        .logo {
            margin-left: 30px;
        }

        .table-container {
            
            margin: 0 auto; /* Center the table horizontally */
            margin: 50px 0;
        }

		.itemdes {
		    font-family: 'Ubuntu', sans-serif;
		    font-size: 12pt;
		    margin-top: 0;
		}

        .table-row-admin {
		    background-color: white;
		    margin: 50px 0;
		}
		.adminDashnav:hover{
			text-decoration:none;
		}
		
		
    </style>
</head>
<body style="background-color: whitesmoke;">

<nav>
    <div class="admin-nav">
        <div class="logo">
            <img class="logo" src="logo.png" alt="profImage" height="40px">
        </div>
			<a href="./admin-dash.jsp" class="adminDashnav"><h1 class="title">Admin
					Dashboard</h1></a>
			<div class="nav-links">
            <a href="./index.html" class="logoutBTN">
                <h3 class="logout">Logout</h3>
            </a>
        </div>
    </div>
</nav>

<div class="table-container">
    <table class="table table-bordered table-striped" style="width: 60%; margin: 0 auto;">
        <c:forEach var="item" items="${items}">
            <c:set var="itemNo" value="${item.itemNo}" />
            <c:set var="itemName" value="${item.itemName}" />
            <c:set var="description" value="${item.description}" />
            <c:set var="itemImage" value="${item.itemImage}" />
            <c:set var="price" value="${item.price}" />
            <div class="rowCard">
                <tr class="table-row-admin">
                    <td style="width: 500px; padding:30px;">
                        Item No: <c:out value="${item.itemNo}" /><br>
                        <h3 class="item-name"><c:out value="${item.itemName}" /></h3>
                        <p class="itemdes"><c:out value="${item.description}" /></p>
                        <h3 class="item_price">Rs.<c:out value="${item.price}" /></h3>

                        <c:url value="AdminUpdateItem.jsp" var="ItemUpdate">
                            <c:param name="itemNo" value="${itemNo}" />
                            <c:param name="itemName" value="${itemName}" />
                            <c:param name="description" value="${description}" />
                            <c:param name="itemImage" value="${itemImage}" />
                            <c:param name="price" value="${price}" />
                        </c:url>
                        <a href="${ItemUpdate}" class="btn btn-primary">Update</a>

                        <c:url value="DeleteItem.jsp" var="ItemDelete">
                            <c:param name="itemNo" value="${itemNo}" />
                            <c:param name="itemName" value="${itemName}" />
                            <c:param name="description" value="${description}" />
                            <c:param name="itemImage" value="${itemImage}" />
                            <c:param name="price" value="${price}" />
                        </c:url>
                        <a href="${ItemDelete}" class="btn btn-danger">Delete</a>
                    </td>

                    <td style="width: 0; text-align: center; vertical-align: middle;">
				    <img name="itemImage" src="images/${itemImage}" alt="Item Image" style="max-width: 300px;" />
				</td>


                </tr>
            </div>
        </c:forEach>
    </table>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
