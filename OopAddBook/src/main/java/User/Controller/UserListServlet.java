package User.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import User.DAO.UserDao;
import User.Model.User;

@WebServlet("/users")
public class UserListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao(); // Initialize UserDao
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set the content type for the response
        response.setContentType("text/html;charset=UTF-8");

        List<User> userList = userDao.selectAllUsers(); // Fetch all users
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>User List</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }");
            out.println("h2 { color: #333; }");
            out.println("table { width: 100%; border-collapse: collapse; margin-top: 20px; }");
            out.println("th, td { padding: 10px; text-align: left; border: 1px solid #ddd; }");
            out.println("th { background-color: #4CAF50; color: white; }");
            out.println("tr:hover { background-color: #f1f1f1; }");
            
            // Button styles
            out.println("input[type='submit'] {");
            out.println("    padding: 10px 15px;");
            out.println("    border: none;");
            out.println("    border-radius: 5px;");
            out.println("    cursor: pointer;");
            out.println("    font-weight: bold;");
            out.println("    transition: all 0.3s ease;");
            out.println("    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);");
            out.println("}");
            
            // Update button styles
            out.println("input[type='submit'].update {");
            out.println("    background-color: yellow;");
            out.println("    color: black;");
            out.println("    border: 1px solid #d3d300;"); // Darker border for the update button
            out.println("}");
            out.println("input[type='submit'].update:hover {");
            out.println("    background-color: gold;");
            out.println("    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);");
            out.println("    transform: translateY(-2px);");
            out.println("}");

            // Delete button styles
            out.println("input[type='submit'].delete {");
            out.println("    background-color: red;");
            out.println("    color: white;");
            out.println("    border: 1px solid darkred;"); // Darker border for the delete button
            out.println("}");
            out.println("input[type='submit'].delete:hover {");
            out.println("    background-color: darkred;");
            out.println("    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);");
            out.println("    transform: translateY(-2px);");
            out.println("}");
            
            out.println("</style>");
            out.println("<script>");
            out.println("function confirmDelete() {");
            out.println("    return confirm('Are you sure you want to delete this user?');");
            out.println("}");
            out.println("</script>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h2>User List</h2>");
            out.println("<table>");
            out.println("<thead><tr><th>ID</th><th>Username</th><th>Email</th><th>Actions</th></tr></thead>");
            out.println("<tbody>");

            for (User user : userList) {
                out.println("<tr>");
                out.println("<td>" + user.getId() + "</td>");
                out.println("<td>" + user.getUsername() + "</td>");
                out.println("<td>" + user.getEmail() + "</td>");
                out.println("<td>");
                out.println("<form action='editUser' method='GET' style='display:inline;'>");
                out.println("<input type='hidden' name='id' value='" + user.getId() + "'>");
                out.println("<input type='submit' value='Update' class='update'>");
                out.println("</form>");
                out.println("<form action='deleteUser' method='POST' style='display:inline;' onsubmit='return confirmDelete();'>");
                out.println("<input type='hidden' name='id' value='" + user.getId() + "'>");
                out.println("<input type='submit' value='Delete' class='delete'>");
                out.println("</form>");
                out.println("</td>");
                out.println("</tr>");
            }

            out.println("</tbody>");
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
