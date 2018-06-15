package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Class;
import Dao.DBClass;

@WebServlet("/danhsachlop")
public class indanhsachlop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public indanhsachlop() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// nhận giá trị iddslh từ request
		int iddslh = Integer.parseInt(request.getParameter("iddslh"));
		// đưa dữ liệu vào model
		Class class1= new Class();
		class1.setIdclass(iddslh);
		// lấy username của giáo viên của lớp học này
		DBClass db = new DBClass();
		String IDTeacher=null;
		try {
			IDTeacher= db.getIDTeacher(class1);			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// nhận giá trị từ request
		String username =(String) request.getSession().getAttribute("username");
		int admin = (int) request.getSession().getAttribute("admin");
		// nếu là admin, được xem tất các danh sách
		// nếu là giáo viên dạy môn đó thì mới được xem danh sách lớp
		if(admin!=1) {
			//kiểm tra có phải giáo viên dạy lớp đó đang xem danh sách hay không?
			if(IDTeacher.equals(username))
			{
				request.setAttribute("iddslh", iddslh);
				request.getRequestDispatcher("/WEB-INF/danhsachlop.jsp").forward(request, response);	
			}
			else
			{
				// lỗi
				request.getRequestDispatcher("/WEB-INF/khoahocdaday.jsp").forward(request, response);
			}	
		}
		else
		{
			// dành cho admin
			request.setAttribute("iddslh", iddslh);
			request.getRequestDispatcher("/WEB-INF/danhsachlop.jsp").forward(request, response);	
		}
	}

}
