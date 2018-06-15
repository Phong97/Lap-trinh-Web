package Dao;

import Util.*;
import Bean.*;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.owasp.encoder.Encode;

public class DBUser {

	public DBUser() {
	
	}
	// Hàm gọi store procedure để thay đổi mậ khẩu
	public Boolean changePassword(User user) throws SQLException{
			
			Connection conn = DBConnectionMySQL.getConnection();
			try {
				String call = "{call spChangePassword(?,?)}";
				CallableStatement stmt = conn.prepareCall(call);
				stmt.setString(1,  user.getUsername());
				stmt.setString(2,  user.getPassword());
				return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
			} catch (Exception e) {
				return false;
			}finally {
				conn.close();
			}
		}
		// Hàm gọi function để kiểm tra tài khoản có tồn tại hay không? 
		public Boolean checkUser(User user) throws SQLException {
			Connection conn = DBConnectionMySQL.getConnection();
			String cmd = "select spCheckUser('"+user.getUsername()+"','"+user.getPassword()+"' ) as kt";
			ResultSet rs = DBConnectionMySQL.ExecuteQueryResultSet(conn, cmd);
			try {
				int kt = 0;
				while(rs.next()) {
					kt = rs.getInt("kt");
				}
				
				if (kt==1) return true;
			} catch (Exception ex) {
				Logger.getLogger(DBUser.class.getName()).log(Level.SEVERE, null, ex);
			}
			conn.close();
			return false;
		}
		// Hàm gọi store procedure để đăng ký tài khoản
		public Boolean signUpUser(User user) throws SQLException {			
			Connection conn = DBConnectionMySQL.getConnection();
			try {
				String call = "{call spCreateUser(?,?)}";
				CallableStatement stmt = conn.prepareCall(call);
				stmt.setString(1,  user.getUsername());
				stmt.setString(2,  user.getPassword());
				return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
			} catch (Exception e) {
				return false;
			}finally {
				conn.close();
			}
			
		}
		// Hàm gọi function để kiểm tra có phải là admin hay không?
		public int checkAdmin(User user) throws SQLException {
			Connection conn = DBConnectionMySQL.getConnection();
			String cmd = "select spCheckAdmin('"+user.getUsername()+"') as kt";
			ResultSet rs = DBConnectionMySQL.ExecuteQueryResultSet(conn, cmd);
			
			try {
				int admin = 0;
				while (rs.next()) {
					admin = rs.getInt("kt");
				}
				
				return admin;
			}catch (Exception e) {
				return 0;
			}finally {
				conn.close();
			}
		}
		// Hàm gọi store procedure để xóa tài khoản
		public Boolean deleteUser(User user) throws SQLException {
			Connection conn = DBConnectionMySQL.getConnection();
			try {
				String call = "{call spDeleteUser(?)}";
				CallableStatement stmt = conn.prepareCall(call);
				stmt.setString(1, user.getUsername());
				return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
			} catch (Exception e) {
				return false;
			}finally {
				conn.close();
			}
		}
}
