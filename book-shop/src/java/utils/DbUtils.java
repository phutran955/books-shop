/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trang
 */
public class DbUtils {
    private static final String DB_NAME = "bookDB";
    private static final String DB_USER_NAME = "SA";
    private static final String DB_PASSWORD = "12345";
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_NAME;
        conn = DriverManager.getConnection(url, DB_USER_NAME, DB_PASSWORD);
        return conn;
    }
    
    public static void main(String[] args) {
         checkTblCategory(); // Check and print categories
        try {
            System.out.println(DbUtils.getConnection());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbUtils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DbUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
   public static void checkTblCategory() {
    String query = "SELECT catID, catName FROM tblCategory";

    try (Connection conn = getConnection();
         java.sql.Statement stmt = conn.createStatement();
         java.sql.ResultSet rs = stmt.executeQuery(query)) {

        System.out.println("📋 Categories in tblCategory:");
        while (rs.next()) {
            int id = rs.getInt("catID");
            String name = rs.getString("catName");
            System.out.println(" - ID: " + id + ", Name: " + name);
        }

    } catch (ClassNotFoundException | SQLException e) {
        System.err.println("❌ Error reading tblCategory:");
        e.printStackTrace();
    }
}


}
