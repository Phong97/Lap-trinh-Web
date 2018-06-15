package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.User;
import Dao.DBUser;

@WebServlet("/deleteuser")
public class deleteuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public deleteuser() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// nhận username từ request
		String username = (String) request.getParameter("iduser").trim();
		//không cho xóa noname, vì nó là học viên ảo để guest bình luận hoặc xóa chính tài khoản đang đăng nhập
		if(username.equals("noname") || !username.equals(request.getSession().getAttribute("username"))) {
			//thông báo thất bại
			request.setAttribute("thongbao", 0);
			request.getRequestDispatcher("/WEB-INF/quanlyuser.jsp").forward(request, response);
		}
		else
		{
			// đưa dữ liêụ vào model
			DBUser db = new DBUser();
			User user= new User();
			user.setUsername(username);
			try {
				// gọi hàm xóa tài khoản từ DAO
				if (db.deleteUser(user)) {
					request.getRequestDispatcher("/WEB-INF/quanlyuser.jsp").forward(request, response);
				}
				else {
					//thông báo thất bại
					request.setAttribute("thongbao", 0);
					request.getRequestDispatcher("/WEB-INF/quanlyuser.jsp").forward(request, response);
				}
			} catch (Exception e) {
				//thông báo thất bại
				request.setAttribute("thongbao", 0);
				request.getRequestDispatcher("/WEB-INF/quanlyuser.jsp").forward(request, response);
			}
		}
		
	}

}
