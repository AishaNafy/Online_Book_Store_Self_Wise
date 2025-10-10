package User.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import User.DAO.UserDao;
import User.Model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao(); // Initialize UserDao
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set the content type for the response
        response.setContentType("text/html;charset=UTF-8");

        // Get the form input values
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input fields
        if (username == null || email == null || password == null || username.isEmpty() || email.isEmpty() || password.isEmpty()) {
            sendAlert(response, "All fields are required!", "SignUp.jsp");
            return;
        }

        // Check if the username already exists
        if (userDao.usernameExists(username)) {
            sendAlert(response, "Username already taken! Please choose another.", "SignUp.jsp");
            return;
        }

        // Create a new User object
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setEmail(email);
        newUser.setPassword(password);

        // Prepare to send a script response
        try (PrintWriter out = response.getWriter()) {
            try {
                // Register the user in the database
                userDao.registerUser(newUser);

                // On success, send a JavaScript alert and redirect to the login page
                sendAlert(response, "Registration successful!", "SignUp.jsp"); // Redirect to Login.jsp or any other page
            } catch (SQLException e) {
                // If there's an error, send a failure alert and return to SignUp.jsp
                sendAlert(response, "Registration failed! Please try again.", "SignUp.jsp");
            }
        }
    }

    private void sendAlert(HttpServletResponse response, String message, String redirectPage) throws IOException {
        try (PrintWriter out = response.getWriter()) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + message + "');");
            out.println("location='" + redirectPage + "';");  // Redirect to specified page
            out.println("</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("SignUp.jsp"); // Redirect to the signup form on GET requests
    }
}
