package User.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import User.DAO.UserDao;
import User.Model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
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
        String password = request.getParameter("password");

        // Prepare to send a script response
        try (PrintWriter out = response.getWriter()) {
            User user = userDao.selectUserByUsername(username); // Check if the user exists

            if (user != null && user.getPassword().equals(password)) { // Validate password
                // On successful login, send a JavaScript alert and redirect to index.html
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Login successful!');");
                out.println("location='index.html';");  // Redirect to index.html
                out.println("</script>");
            } else {
                // If authentication fails, send a failure alert and return to Login.jsp
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid username or password!');");
                out.println("location='SignUp.jsp';");  // Redirect to Login.jsp
                out.println("</script>");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Login.jsp"); // Redirect to the login form on GET requests
    }
}
