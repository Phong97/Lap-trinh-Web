package Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.owasp.encoder.Encode;

import Bean.Course;
import Util.DBConnectionMySQL;

public class DBCourse {

	public DBCourse() {
		
	}
	// Hàm gọi store procedure để tạo một khóa học có ảnh
	public Boolean createCourse(Course course) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spCreateCourse(?,?,?,?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setString(1, Encode.forHtml(course.getNamecourse()));
			stmt.setString(2, Encode.forHtml(course.getContent_course()));
			stmt.setDouble(3, course.getFee());
			stmt.setString(4, Encode.forHtml(course.getImages()));
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}
	
	// Hàm gọi store procedure để cập nhật thông tin khóa học không ảnh
	public Boolean updateCourseNoImage(Course course) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spUpdateCourseImages(?,?,?,?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setInt(1, course.getIdcourse());			
			stmt.setString(2, Encode.forHtml(course.getNamecourse()));
			stmt.setString(3, Encode.forHtml(course.getContent_course()));
			stmt.setDouble(4, course.getFee());
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}
	
	// Hàm gọi store procedure để cập nhật thông tin khóa học
	public Boolean updateCourse(Course course) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spUpdateCourse(?,?,?,?,?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setInt(1, course.getIdcourse());			
			stmt.setString(2, Encode.forHtml(course.getNamecourse()));
			stmt.setString(3, Encode.forHtml(course.getContent_course()));
			stmt.setDouble(4, course.getFee());
			stmt.setString(5, Encode.forHtml(course.getImages()));
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}
	
	// Hàm gọi function để lấy thông tin học phí của khóa học
	public double getFee(Course course)throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		String cmd = "select spGetFee('"+course.getIdcourse()+"') as kt";
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
	
	// Hàm gọi store procedure để xóa khóa học
	public Boolean deleteCourse(Course course) throws SQLException {
		Connection conn = DBConnectionMySQL.getConnection();
		try {
			String call = "{call spDeleteCourse(?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setInt(1, course.getIdcourse());
			return DBConnectionMySQL.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	} 

}
