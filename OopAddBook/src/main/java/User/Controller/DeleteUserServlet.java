package User.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import User.DAO.UserDao;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao(); // Initialize UserDao
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
			userDao.deleteUser(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // Delete user
        response.sendRedirect("users"); // Redirect back to the user list
    }
}

