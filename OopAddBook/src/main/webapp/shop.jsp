<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shelf Wise</title>
    <link rel="stylesheet" href="stylehome.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
    
    body {
    min-height: 20vh;
    display: flex;
    flex-direction: column;
     margin: 0;
}


section {
    flex: 1;
}
    

  .grid-container {
    display: flex;
    justify-content: center;
    gap: 30px;
    flex-wrap: wrap;
    margin-bottom: 100px; /* Adjust as needed */
}
  


    /* Card Style */
    .item-card {
        background-color: #f5f5f5; /* Soft light gray background for cards */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: 300px;
        border-radius: 10px;
        text-align: center;
    }

    .item-card img {
        width: 100%;
        height: 300px;
        border-radius: 10px;
        margin-bottom: 10px;
    }

    .item-card h3 {
        font-size: 1.5em;
        margin: 10px 0;
        color: black; /* Deep blue for item titles */
    }

    .item-card p {
        color: black; /* Neutral gray for item description */
    }

    .item-card h4 {
        color: #b39690; /* Matching the button color for price */
    }

    .btn-add-cart {
        margin-top: 10px;
        background-color: #b39690;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
    }

    .btn-add-cart:hover {
        opacity: 0.9;
    }
    footer {
    background-color: #fff;
    color: #b39690;
    padding: 40px 20px;
  }

  footer a {
    color: #b39690;
    text-decoration: none;
  }

  footer a:hover {
    text-decoration: underline;
  }
   
    /* Media Queries */
    @media (max-width: 768px) {
        .grid-container {
            flex-direction: column;
            align-items: center;
        }

        .item-card {
            width: 90%;
        }
    }
        .page-header {
        font-size: 2.5em; /* Adjust size as needed */
        color: #b39690; 
        margin-top: 20px; /* Spacing above */
        margin-bottom: 40px; /* Spacing below */
        font-weight: bold; /* Optional: Increase boldness */
        text-transform: uppercase; /* Optional: Makes text uppercase */
    }
    </style>
</head>
<body>

    <section>

        <header>
            <div class="top-text">
                Hey, welcome!
            </div>
            <div class="header-container">
                <nav class="left-nav">
                    <a href="#">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    </a>
                </nav>
                <div class="logo-container">
                    <img src="logo.png" alt="Shelf Wise">
                </div>
                <nav class="right-nav">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fas fa-user"></i></a>
                    <a href="#"><i class="fas fa-shopping-cart"></i></a>
                </nav>
            </div>
            <div class="nav-links">
                <a href="./index.html">HOME</a>
                <a href="./ViewAllBooks">OUR PRODUCTS</a>
                <a href="#">ABOUT US</a>
                <a href="#">FAQ</a>
                <a href="#">FEEDBACK/REVIEWS</a>
                <a href="#">PRIVACY POLICY</a>
                <a href="./admin-dash.jsp">Admin Dashboard</a>
            </div>
        </header>

<center><h1 class="page-header">Our Products</h1></center>



<!-- Main Content: Grid for Items -->
<div class="grid-container">
    <c:forEach var="item" items="${items}">
        <div class="item-card">
            <img src="images/${item.itemImage}" alt="Bid Image">
            <h3><c:out value="${item.itemName}" /></h3>
            <p><c:out value="${item.description}" /></p>
            <br>
            <h4>RS. <c:out value="${item.price}" /></h4>
            <form action="AddToCart" method="post">
                <input type="hidden" name="itemNo" value="${item.itemNo}" />
                <button type="submit" class="btn-add-cart">Add to Cart</button>
            </form>
        </div>
    </c:forEach>
</div>


    </section>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>


<hr>
    
    <!--Footer Section-->
    <footer>
        <!-- Subscription Section -->
        <div class="subscribe-section">
          <p>
            Be the first to know about new collections and exclusive offers.
          </p>
          <form class="subscribe-form">
            <input type="email" placeholder="Email" required />
            <button type="submit">Subscribe</button>
          </form>
        </div>

        <!-- Acknowledgment and Social Icons -->
        <div class="footer-container">
          <div class="left-section">
            <p>
              Shelf Wise works on Sri Lanka country in Colombo. We
              acknowledge the traditional owners of this land and pay respect to
              elders past, present, and emerging.
            </p>
            <br />
            <div class="social-icons">
              <a href="#"><i class="fab fa-facebook-f"></i></a>
              <a href="#"><i class="fab fa-instagram"></i></a>
              <a href="#"><i class="fab fa-tiktok"></i></a>
            </div>
          </div>
          <div class="center-section">
            <img
              src="logo.png"
              width="280"
            />
          </div>
          <!-- Footer Links -->
          <div class="right-section">
            <ul>
              <li><a href="#">About Us</a></li>
              <li><a href="#">FAQ</a></li>
              <li><a href="#">Shipping, Returns & Refunds</a></li>
              <li><a href="#">Contact Information</a></li>
            </ul>
          </div>
        </div>

        <!-- Bottom Footer Section -->
        <div class="bottom-footer">
          <div class="currency-selector">
            <label for="currency">Country/region</label>
            <select id="currency">
              <option>LKR Rs | Sri Lanka</option>
              <!-- Add other options here -->
            </select>
          </div>

          <div class="footer-policies">
            <p>©️ 2024 SHELF WISE - ALL RIGHTS RESERVED</p>
            <p>
              <a href="#">Refund policy</a> · <a href="#">Privacy policy</a> ·
              <a href="#">Terms of service</a> ·
              <a href="#">Shipping policy</a> ·
              <a href="#">Contact information</a>
            </p>
          </div>

          <!-- Payment Method Icons -->
          <div class="payment-methods">
            <i class="fab fa-cc-amex"></i>
            <i class="fab fa-apple-pay"></i>
            <i class="fab fa-cc-paypal"></i>
            <i class="fab fa-cc-visa"></i>
            <i class="fab fa-google-pay"></i>
          </div>
        </div>
      </footer>
    <!--Footer Section-->


</html>
