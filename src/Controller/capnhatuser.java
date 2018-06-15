package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.User;
import Bean.User_Info;
import Dao.DBUser_Info;

@WebServlet("/capnhapuser")
public class capnhatuser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public capnhatuser() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//nhận iduser và chuyển nó đến trang capnhapuser.jsp
		String iduser = (String) request.getParameter("iduser");
		request.setAttribute("iduser", iduser);
		request.getRequestDispatcher("/WEB-INF/capnhapuser.jsp").forward(request, response);		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// nhận chuẩn bộ mã hóa ký tự UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		  // nhận giá trị từ request
		String username = (String) request.getParameter("username");
		try {
			String password = (String) request.getParameter("password");
			// kiểm tra validate cho password
			if(password.trim().length()>=8 && password.trim().length()<=32)
			{
				Double myaccount=Double.parseDouble((String) request.getParameter("myaccount"));

				String stringadmin = (String) request.getParameter("tadmin");
				
				int tadmin = 1;
				// nếu không check vào checkbox thì tadmin=0, nghĩ là không phải admin
				if (stringadmin == null) {
					tadmin = 0;
				}
				// đưa dữ liệu vào model
				User_Info userinfo =new User_Info();
				userinfo.setMyaccount(myaccount);
				
				User user =new User();
				user.setUsername(username);
				/*user.setPassword(password);*/
				user.setAdmin(tadmin);
				
				// gọi hàm cập nhật tài khoản từ DAO
				DBUser_Info db = new DBUser_Info();
				if (db.updateUser(user, userinfo, password)) {
					request.getRequestDispatcher("/WEB-INF/quanlyuser.jsp").forward(request, response);
				}
				else
				{
					//thông báo thất bại
					request.setAttribute("thongbao", 0);
					request.getRequestDispatcher("/WEB-INF/capnhapuser.jsp?iduser="+username).forward(request, response);
				}
			}
			else
			{
				//thông báo thất bại
				request.setAttribute("thongbao", 1);
				request.getRequestDispatcher("/WEB-INF/capnhapuser.jsp?iduser="+username).forward(request, response);
			}
			
		} catch (Exception e) {
			//thông báo thất bại
			request.setAttribute("thongbao", 0);
			request.getRequestDispatcher("/WEB-INF/capnhapuser.jsp?iduser="+username).forward(request, response);
		}

	}

}
