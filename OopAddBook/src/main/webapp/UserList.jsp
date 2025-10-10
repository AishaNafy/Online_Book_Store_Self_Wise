<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        #itemsContainer {
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        h2 {
            color: #333;
        }
    </style>
</head>
<body>

<h1>User Management</h1>
<div id="itemsContainer">
    <!-- Items will be loaded here -->
</div>

<script>
    // Function to load items from the server
    function loadItems() {
        fetch('users') // Adjust the URL according to your server setup
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.text();
            })
            .then(data => {
                document.getElementById('itemsContainer').innerHTML = data;
            })
            .catch(error => {
                console.error('Error fetching items:', error);
                document.getElementById('itemsContainer').innerHTML = '<h2>Failed to load items.</h2>';
            });
    }

    // Call the function to load items when the page is loaded
    window.onload = loadItems;
</script>

</body>
</html>
