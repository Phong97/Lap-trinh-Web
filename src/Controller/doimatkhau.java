package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.User;
import Dao.DBUser;

@WebServlet("/doimatkhau")
public class doimatkhau extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public doimatkhau() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		request.getRequestDispatcher("/WEB-INF/doimatkhau.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  	    
	   
	    try {
	    	 //get password from doimatkhau.jsp
		    String oldpassword = request.getParameter("oldpassword");
		    String newpassword = request.getParameter("newpassword");
		    
		    //get username from session
		    String username = (String) request.getSession().getAttribute("username");
		    
		    // get data to model
		    User user = new User();
		    user.setUsername(username);
		    user.setPassword(oldpassword);
		    
		    User user1 = new User();
		    user1.setUsername(username);
		    user1.setPassword(newpassword);
		    
		    DBUser db = new DBUser();
		    // kiểm tra validate cho new password và check old password
			if (db.checkUser(user) && newpassword.trim().length()>=8 && newpassword.trim().length()<=20)
			{
				if (db.changePassword(user1))
				{
					//thông báo thành công
					request.setAttribute("thongbao", 1);
					request.getRequestDispatcher("/WEB-INF/doimatkhau.jsp").forward(request, response);
				}
				else {
					// thông báo thất bại
					request.setAttribute("thongbao", 0);
					request.getRequestDispatcher("/WEB-INF/doimatkhau.jsp").forward(request, response);
				}
			}
			else {
				// thông báo thất bại
				request.setAttribute("thongbao", 0);
				request.getRequestDispatcher("/WEB-INF/doimatkhau.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// thông báo thất bại
			request.setAttribute("thongbao", 0);
			request.getRequestDispatcher("/WEB-INF/doimatkhau.jsp").forward(request, response);
		}
	  
	}

}
