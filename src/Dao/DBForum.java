package Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import org.owasp.encoder.Encode;

import Bean.Forum;
import Util.DBConnectionMySQL;

public class DBForum {

	public DBForum() {
		
	}
	// Hàm gọi store procedure để tạo một bình luận
	public Boolean createForum(Forum comment) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spCreateComment(?,?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setString(1, comment.getIduser());
			stmt.setString(2, Encode.forHtml(comment.getComment()));
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}

	// Hàm gọi store procedure để xóa một bình luận
	public Boolean deleteForum(Forum comment) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spDeleteComment(?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setInt(1, comment.getIdcomment());
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	} 

}
