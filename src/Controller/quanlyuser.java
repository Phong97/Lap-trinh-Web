package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.User;
import Dao.DBUser;

@WebServlet("/quanlyuser")
public class quanlyuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public quanlyuser() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/quanlyuser.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // nhận giá trị từ request
		String username = (String) request.getParameter("username-reg");
		String password = (String) request.getParameter("pw-reg");
		
		// đưa dữ liệu vào model
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		// gọi hàm tạo tài khoản từ DAO
		DBUser db = new DBUser();
		try {
			if (db.signUpUser(user)) {
					
					request.getRequestDispatcher("/WEB-INF/quanlyuser.jsp").forward(request, response);
			}
			else
			{
				//thông báo thất bại
				request.setAttribute("thongbao", 1);
				request.getRequestDispatcher("/WEB-INF/quanlyuser.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			//thông báo thất bại
			request.setAttribute("thongbao", 1);
			request.getRequestDispatcher("/WEB-INF/quanlyuser.jsp").forward(request, response);
		}
	}

}
