package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DBUser;
import Dao.DBUser_Info;
import Bean.User;
import Bean.User_Info;

@WebServlet(urlPatterns = { "/trangchu_admin" })
public class login_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBUser db = null;

	public login_admin() {
        super();  	
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			  // nhận giá trị từ request
			String username = (String) request.getParameter("username");
			String password = (String) request.getParameter("pw-login");
			// đưa dữ liệu vào model
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			
			User_Info user_info= new User_Info();
			user_info.setIduser(username);
			
			db = new DBUser();	
			// kiểm tra username có tồn tại chưa?
			if (db.checkUser(user)) {
				
				//đưa username vào session
				request.getSession().setAttribute("username", username);
				
				DBUser_Info db1 = new DBUser_Info();
				String avatar = db1.getAvatar(user_info);
				int admin = db.checkAdmin(user);
				// đưa avatar, admin vào sesion
				request.getSession().setAttribute("avatar", avatar);
				request.getSession().setAttribute("admin", admin);
				
				// thông báo thành công
				request.getRequestDispatcher("/WEB-INF/trangchu2.jsp").forward(request, response);	
			}
			else {
				//thông báo thất bại
				request.setAttribute("thongbao", 2);
				request.getRequestDispatcher("/WEB-INF/admin/trangchu.jsp").forward(request, response);
			}
		} catch (Exception e) {
			//thông báo thất bại
			request.setAttribute("thongbao", 2);
			request.getRequestDispatcher("/WEB-INF/admin/trangchu.jsp").forward(request, response);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/admin/trangchu.jsp").forward(request, response);
	}
}