package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DBClass;
import Bean.Class;
@WebServlet("/deleteclass")
public class deleteclass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public deleteclass() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// nhận bộ mã hóa ký tự UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		 //nhận idcourse lại từ session
		int idcourse = Integer.parseInt((String) request.getSession().getAttribute("idcourse"));
		
		try {
			// nhận giá trị từ request
			int idclass = Integer.parseInt(request.getParameter("id"));
			// đưa dữ liệu vào model
			Class class1=new Class();
			class1.setIdclass(idclass);
			
			DBClass db = new DBClass();
			// gọi hàm xóa lớp học
			if (db.deleteClass(class1)) {
				
				request.getRequestDispatcher("/WEB-INF/capnhapkhoahoc.jsp?idcourse="+idcourse).forward(request, response);
			} else {
				//thông báo thất bại
				request.setAttribute("thongbao", 2);
				request.getRequestDispatcher("/WEB-INF/capnhapkhoahoc.jsp?idcourse="+idcourse).forward(request, response);
			}
		} catch (Exception e) {
			//thông báo thất bại
			request.setAttribute("thongbao", 2);
			request.getRequestDispatcher("/WEB-INF/capnhapkhoahoc.jsp?idcourse="+idcourse).forward(request, response);
		}
	}

}
