package Util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnectionMySQL {
	 // Driver and URL
    private static final String DRIVER_JDBC = "com.mysql.jdbc.Driver";
    private static final String URL_DB = "jdbc:mysql://localhost/dbquanlyttth";
    // Pass and User
    private static final String USER = "root";
    private static final String PASS = "12345";
    // Khai báo connect 
    private static Connection conn;
    static Statement statement = null;
    // Hàm kết nối vớ database 
    public static Connection getConnection() {
        try {
        	// Đăng ký
            Class.forName(DRIVER_JDBC);
            conn = DriverManager.getConnection(URL_DB, USER, PASS);
            System.out.println("Connected successfully ...");
        } catch (Exception e) {
            System.out.println("Error connection " + e);
        }
        return conn;    
    }
    

 // hàm trả danh sách lưu trong ResultSet thông qua câu truy vấn str
 	public static ResultSet ExecuteQueryResultSet(Connection conn, String str) {
 		ResultSet rs = null;
 		try {
 			statement = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
 			rs = statement.executeQuery(str);
 		} catch (SQLException ex) {
 			Logger.getLogger(DBConnectionMySQL.class.getName()).log(Level.SEVERE, null, ex);
 		} 
 		return rs;
 	}
    
 // Hàm thực hiện lệnh trả về true hoặc false
 	public static boolean MyExcuteUpdateNonQuery(Connection conn, CallableStatement stmt) {
 		boolean f = false;
 		try {
 			stmt.executeUpdate();
 			f = true;
 		} catch (SQLException se) {
 			se.printStackTrace();
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			// finally block used to close resources
 			try {
 				if (conn != null || stmt != null) {
 					conn.close();
 				}
 			} catch (SQLException se) {
 			} // do nothing
 			try {
 				if (conn != null) {
 					conn.close();
 				}
 			} catch (SQLException se) {
 				se.printStackTrace();
 			}
 		}
 		return f;
 	}

}
