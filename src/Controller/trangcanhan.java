package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.User_Info;
import Dao.DBUser_Info;

@WebServlet("/trangcanhan")
public class trangcanhan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public trangcanhan() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/trangcanhan.jsp").forward(request, response);
		
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		try {
			// nhận bộ mã hóa ký tự UTF-8
			request.setCharacterEncoding("UTF-8");
		    response.setCharacterEncoding("UTF-8");
		    
		    //nhận iduser lại từ session
			String iduser = (String) request.getSession().getAttribute("username");
			 // nhận giá trị từ request
			String name = (String) request.getParameter("name");
			
			int age = Integer.parseInt((String) request.getParameter("age"));	
			
			int sex = Integer.parseInt((String) request.getParameter("sex"));
			
			String email = request.getParameter("email");
			
			Double phone = Double.parseDouble((String) request.getParameter("phone"));
			
			String address = request.getParameter("address");
			
			User_Info userinfo= new User_Info();
			// đưa dữ liệu vào model
			userinfo.setIduser(iduser);
			userinfo.setName(name);
			userinfo.setAge(age);
			userinfo.setSex(sex);
			userinfo.setPhone(phone);
			userinfo.setAddress(address);
			userinfo.setEmail(email);
			
			// gọi hàm cập nhật thông tin cá nhân từ DAO
			DBUser_Info db = new DBUser_Info();
			if (db.updateUser_Info(userinfo)) {
				//thong bao thanh cong
				request.getRequestDispatcher("/WEB-INF/trangcanhan.jsp").forward(request, response);				
			}
			else {
				//thông báo thất bại
				request.setAttribute("thongbao", 0);
				request.getRequestDispatcher("/WEB-INF/trangcanhan.jsp").forward(request, response);
			}
		} catch (Exception e) {
			//thông báo thất bại
			request.setAttribute("thongbao", 0);
			request.getRequestDispatcher("/WEB-INF/trangcanhan.jsp").forward(request, response);
		}
	}
}
