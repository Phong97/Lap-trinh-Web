package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Course;
import Dao.DBCourse;

@WebServlet("/deletecourse")
public class deletecourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public deletecourse() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//nhận dữ liệu từ request 
		int idcourse = Integer.parseInt(request.getParameter("id"));
		// đưa dữ liệu vào model
		Course course= new Course();
		course.setIdcourse(idcourse);
		
		// gọi hàm xóa khóa học từ DAO
		DBCourse db = new DBCourse();
		try {
			if (db.deleteCourse(course)) {
				request.getRequestDispatcher("/WEB-INF/quanlykhoahoc.jsp").forward(request, response);
			}
			else {
				//thông báo thất bại
				request.setAttribute("thongbao", 1);
				request.getRequestDispatcher("/WEB-INF/quanlykhoahoc.jsp").forward(request, response);
			}
		}catch (Exception e) {
			//thông báo thất bại
			request.setAttribute("thongbao", 1);
			request.getRequestDispatcher("/WEB-INF/quanlykhoahoc.jsp").forward(request, response);
		}
	}

}
