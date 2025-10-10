package User.DAO;

import User.Model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Config.DatabaseConnection;

public class UserDao {

    // SQL queries for CRUD operations
    private static final String INSERT_USERS_SQL = "INSERT INTO users (email, username, password) VALUES (?, ?, ?)";
    private static final String SELECT_USER_BY_ID = "SELECT id, email, username, password FROM users WHERE id = ?";
    private static final String SELECT_USER_BY_USERNAME = "SELECT id, email, username, password FROM users WHERE username = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id = ?";
    private static final String UPDATE_USERS_SQL = "UPDATE users SET email = ?, username = ?, password = ? WHERE id = ?";

    // CREATE: Insert a new user into the database
    public void registerUser(User user) throws SQLException {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // READ: Select a user by ID
    public User selectUser(int id) {
        User user = null;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String email = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                user = new User(id, email, username, password);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    // READ: Select a user by username
    public User selectUserByUsername(String username) {
        User user = null;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME)) {
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String password = rs.getString("password");
                user = new User(id, email, username, password);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    // READ: Select all users
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                users.add(new User(id, email, username, password));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    // UPDATE: Update user details
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL)) {
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setInt(4, user.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // DELETE: Delete user by ID
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    

    // Check if the username already exists in the database
    public boolean usernameExists(String username) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME)) {
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            return rs.next(); // If a record exists, username is taken
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false; // If there's an error or no records found
    }

    // Utility method to print SQL exceptions
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
