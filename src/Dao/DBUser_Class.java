package Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;


import Bean.User_Class;
import Util.DBConnectionMySQL;

public class DBUser_Class {

	public DBUser_Class() {
		
	}

	// Hàm gọi store procedure để thêm học viên vào lớp học
	public Boolean addStudent(User_Class user_class) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spAddStudent(?,?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setInt(1, user_class.getIdclass());
			stmt.setString(2, user_class.getIduser());
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}	
}
