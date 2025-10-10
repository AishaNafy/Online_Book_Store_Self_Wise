<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
        src="https://kit.fontawesome.com/64d58efce2.js"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css" />
    <title>Login Form</title>
</head>
<body>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <!-- Sign In Form -->
                <form action="login" method="post" class="sign-in-form"> <!-- Change action to your login servlet -->
                    <h2 class="title">Sign In</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" name="username" placeholder="Username" required /> <!-- Added name attribute -->
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Password" required /> <!-- Added name attribute -->
                    </div>
                    <input type="submit" value="Login" class="btn solid" />
                    <p class="social-text">or sign in with social platforms</p>
                    <div class="social-media">
                        <a href="#" class="social-icon">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-google"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </div>
                </form>
                
                <!-- Sign Up Form -->
                <form action="register" method="post" class="sign-up-form">
                    <h2 class="title">Sign Up</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" name="username" placeholder="Username" required /> <!-- Added name attribute -->
                    </div>
                    <div class="input-field">
                        <i class="fas fa-envelope"></i>
                        <input type="email" name="email" placeholder="Email" required /> <!-- Added name attribute -->
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Password" required /> <!-- Added name attribute -->
                    </div>
                    <input type="submit" class="btn" value="Sign up" />
                    <p class="social-text">or sign up with social platforms</p>
                    <div class="social-media">
                        <a href="#" class="social-icon">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-google"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>New here?</h3>
                    <p>
                        Create an account to explore our curated collection of books and enjoy personalized recommendations.
                    </p>
                    <button class="btn transparent" id="sign-up-btn">
                        Sign Up
                    </button>
                </div>
                <img src="logo.png" class="image" alt="" />
            </div>
            <div class="panel right-panel">
                <div class="content">
                    <h3>One of us?</h3>
                    <p>
                        Welcome back! Sign in to continue discovering your next great read.
                    </p>
                    <button class="btn transparent" id="sign-in-btn">
                        Sign In
                    </button>
                </div>
                <img src="logo.png" class="image" alt="" />
            </div>
        </div>
    </div>

    <script src="app.js"></script>
</body>
</html>

