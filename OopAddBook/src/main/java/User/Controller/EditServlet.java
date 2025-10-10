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

@WebServlet("/editUser")
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao(); // Initialize UserDao
    }

    // Display the user information in a form for editing
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id")); // Get user ID from the request
        User user = userDao.selectUser(userId); // Fetch user details

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Edit User</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }");
            out.println("h2 { color: #333; }");
            out.println("form { background-color: #fff; padding: 20px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); max-width: 400px; }");
            out.println("label { display: block; margin: 10px 0 5px; }");
            out.println("input[type='text'], input[type='password'] {");
            out.println("    width: calc(100% - 20px);");
            out.println("    padding: 10px;");
            out.println("    border: 1px solid #ccc;");
            out.println("    border-radius: 4px;");
            out.println("    margin-bottom: 10px;");
            out.println("}");
            out.println("input[type='submit'] {");
            out.println("    padding: 10px 15px;");
            out.println("    background-color: #4CAF50;");
            out.println("    color: white;");
            out.println("    border: none;");
            out.println("    border-radius: 4px;");
            out.println("    cursor: pointer;");
            out.println("    font-size: 16px;");
            out.println("    transition: background-color 0.3s;");
            out.println("}");
            out.println("input[type='submit']:hover { background-color: #45a049; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h2>Edit User</h2>");
            out.println("<form action='editUser' method='POST'>");
            out.println("<input type='hidden' name='id' value='" + user.getId() + "'>"); // Hidden field for user ID
            out.println("<label for='username'>Username:</label>");
            out.println("<input type='text' id='username' name='username' value='" + user.getUsername() + "' required>");
            out.println("<label for='email'>Email:</label>");
            out.println("<input type='text' id='email' name='email' value='" + user.getEmail() + "' required>");
            out.println("<label for='password'>Password:</label>");
            out.println("<input type='password' id='password' name='password' value='" + user.getPassword() + "' required>");
            out.println("<input type='submit' value='Update'>");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // Process the updated user information from the form submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id")); // Get user ID
        String username = request.getParameter("username"); // Get updated username
        String email = request.getParameter("email"); // Get updated email
        String password = request.getParameter("password"); // Get updated password

        User updatedUser = new User(userId, email, username, password); // Create a User object with the updated information

        try {
            userDao.updateUser(updatedUser); // Update user in the database
            response.sendRedirect("users"); // Redirect to user list after successful update
        } catch (SQLException e) {
            // Handle SQL exception (could log it or show an error message)
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating user");
        }
    }
}
