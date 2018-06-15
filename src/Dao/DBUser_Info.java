package Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.owasp.encoder.Encode;

import Util.DBConnectionMySQL;
import Bean.User;
import Bean.User_Info;

public class DBUser_Info {

	public DBUser_Info() {
	
	}
	
	// Hàm gọi store procedure để cập nhật thông tin cá nhân
	public Boolean updateUser_Info(User_Info UserInfo) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String cmd = "{call spUpdateUser_Info(?,?,?,?,?,?,?)}";
			CallableStatement stmt = conn.prepareCall(cmd);
			stmt.setString(1, UserInfo.getIduser());
			stmt.setString(2, Encode.forHtml(UserInfo.getName()));
			stmt.setInt(3, UserInfo.getAge());
			stmt.setInt(4, UserInfo.getSex());
			stmt.setString(5, Encode.forHtml(UserInfo.getEmail()));
			stmt.setDouble(6, UserInfo.getPhone());
			stmt.setString(7, Encode.forHtml(UserInfo.getAddress()));
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}	
	// Hàm gọi store procedure để cập nhật tài khoản của học viên
	public Boolean updateMyAccount(User_Info UserInfo) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spUpdateMyAccount(?,?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setString(1, UserInfo.getIduser());
			stmt.setDouble(2, UserInfo.getMyaccount());
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}
	// Hàm gọi store procedure để đổi ảnh đại diện
	public Boolean changeAvatar(User_Info UserInfo) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spChangeAvatar(?,?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setString(1, UserInfo.getIduser());
			stmt.setString(2, UserInfo.getImages());
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}
	// Hàm gọi store procedure để lấy ảnh đại diện
	public String getAvatar(User_Info UserInfo) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		String cmd = "select spGetAvatar('"+UserInfo.getIduser()+"') as kt";
		
		ResultSet rs = DBConnectionMySQL.ExecuteQueryResultSet(conn, cmd);
		try {
			String image = null;
			while(rs.next()) {
				image = rs.getString("kt");
			}
			
			return image;
		}
		catch (Exception e) {
			return null;
		}finally {
			conn.close();
		}
	}
	
	// Hàm gọi store procedure để cập nhật set quyền, thay đổi mật khẩu và nạp tiền vào tài khoản.
	public Boolean updateUser(User user, User_Info UserInfo, String password) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spUpdateUser(?,?,?,?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setString(1, user.getUsername());
			stmt.setString(2, password);
			stmt.setInt(3, user.getAdmin());
			stmt.setDouble(4, UserInfo.getMyaccount());
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}
	
	// Hàm gọi function để lấy tiền trong tài khoản của học viên
	public double getMyAccount(User_Info UserInfo)throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		String cmd = "select spGetMyAccount('"+UserInfo.getIduser()+"') as kt";
		ResultSet rs = DBConnectionMySQL.ExecuteQueryResultSet(conn, cmd);
		double tien = 0;
		try {
			String stringtien = "0";
			while (rs.next()) {
				 stringtien = rs.getString("kt");
			}
			
			tien = Double.parseDouble(stringtien);
			
			return tien;
		}catch (Exception e) {
			return tien;
		}finally {
			conn.close();
		}
	}
	
}
