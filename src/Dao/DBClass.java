package Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.owasp.encoder.Encode;

import Util.DBConnectionMySQL;
import Bean.Class;

public class DBClass {

	public DBClass() {
		// 
	}

	// Hàm gọi store procedure để tạo một lớp học
	public Boolean createClass(Class class1) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spCreateClass(?,?,?,?,?,?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setInt(1, class1.getLimited());
			stmt.setString(2, Encode.forHtml(class1.getLink()));
			stmt.setString(3, Encode.forHtml(class1.getStart()));
			stmt.setString(4, Encode.forHtml(class1.getTimestudy()));
			stmt.setString(5, class1.getIdteacher());
			stmt.setInt(6, class1.getIdCourse());
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}
	
	// Hàm gọi store procedure để cập nhật thông tin lớp học
	public Boolean updateClass(Class class1) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spUpdateClass(?,?,?,?,?,?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setInt(1, class1.getIdclass());
			stmt.setInt(2, class1.getLimited());
			stmt.setString(3, Encode.forHtml(class1.getLink()));
			stmt.setString(4, Encode.forHtml(class1.getStart()));
			stmt.setString(5, Encode.forHtml(class1.getTimestudy()));
			stmt.setString(6, class1.getIdteacher());
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}
	
	// Hàm gọi store procedure để xóa lớp học
	public Boolean deleteClass(Class class1) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spDeleteClass(?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setInt(1, class1.getIdclass());
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}
	
	// Hàm gọi store procedure để cập nhật link học tập của lớp học
	public Boolean UpdateLinkClass(Class class1) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spUpdateLinkClass(?,?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setInt(1, class1.getIdclass());
			stmt.setString(2, Encode.forHtml(class1.getLink()));
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}
	
	// Hàm gọi function để lấy id khóa học từ id class
	public int getIDCourse(Class class1) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		String cmd = "select spGetIDCourse('"+class1.getIdclass()+"') as kt";
		
		ResultSet rs = DBConnectionMySQL.ExecuteQueryResultSet(conn, cmd);
		try {
			int idcourse=0;
			while(rs.next()) {
				idcourse = rs.getInt("kt");
			}
			
			return idcourse;
		}
		catch (Exception e) {
			return 0;
		}finally {
			conn.close();
		}
	}
	
	// Hàm gọi function để lấy id giáo viên từ id class
	public String getIDTeacher(Class class1) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		String cmd = "select spGetTeacher('"+class1.getIdclass()+"') as kt";
		
		ResultSet rs = DBConnectionMySQL.ExecuteQueryResultSet(conn, cmd);
		try {
			String idcourse=null;
			while(rs.next()) {
				idcourse = rs.getString("kt");
			}
			
			return idcourse;
		}
		catch (Exception e) {
			return null;
		}finally {
			conn.close();
		}
	}
	
	// Hàm gọi function để lấy học phí lớp học
		public double getFeeCourse(Class class1)throws SQLException {
			Connection conn = DBConnectionMySQL.getConnection();
			String cmd = "select spGetFeeCourse('"+class1.getIdclass()+"') as kt";
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
