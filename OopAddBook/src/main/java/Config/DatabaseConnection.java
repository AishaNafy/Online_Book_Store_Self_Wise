package Config;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    // Database credentials
    private static final String URL = "jdbc:mysql://localhost:3306/aaqib"; // Replace with your DB URL
    private static final String USER = "root"; // Replace with your DB username
    private static final String PASSWORD = "aisha123"; // Replace with your DB password

    // Static method to get database connection
    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the connection
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Connection Established Successfully!");
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found. Include the connector jar in your classpath.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Failed to establish a connection.");
            e.printStackTrace();
        }
        return connection; // Return the newly created connection
    }

    // Close the connection (optional, in case you want to close it later)
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Connection Closed Successfully!");
            } catch (SQLException e) {
                System.out.println("Error closing the connection.");
                e.printStackTrace();
            }
        }
    }
}
