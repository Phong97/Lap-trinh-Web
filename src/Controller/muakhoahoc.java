package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Class;
import Bean.User_Class;
import Bean.User_Info;
import Dao.DBUser_Class;
import Dao.DBUser_Info;
import Dao.DBClass;

@WebServlet("/muakhoahoc")
public class muakhoahoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public muakhoahoc() {
        super();

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//nhận idlh và chuyển nó đến trang muakhoahoc.jsp
		String idlh = (String) request.getParameter("idlh");
		request.setAttribute("idlh", idlh);
		request.getRequestDispatcher("/WEB-INF/muakhoahoc.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// nhận bộ mã hóa ký tự UTF-8
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    //nhận idclass lại từ session
	    int idclass = (int) request.getSession().getAttribute("idlh");
	    try {
	    	 // nhận giá trị từ request
			String iduser = (String) request.getSession().getAttribute("username");
		
			//lấy tài khoản của user từ database
			User_Info user_Info = new User_Info();
			user_Info.setIduser(iduser);
			DBUser_Info  db1 = new DBUser_Info();
			
			Double myaccount = db1.getMyAccount(user_Info);
			System.out.println(myaccount);
			
			//lấy học phí khóa học của lớp đó từ database
			Class class1 = new Class();
			class1.setIdclass(idclass);
			DBClass dbclass= new DBClass();
			
			
			Double fee=dbclass.getFeeCourse(class1);
			System.out.println(myaccount);
					
			// kiểm tra tài khoản đủ để ghi danh hay không
			if (myaccount < fee) {
				//thông báo thất bại
				request.setAttribute("thongbao", 0);
				request.getRequestDispatcher("/WEB-INF/muakhoahoc.jsp?idlh="+idclass).forward(request, response);
			
			}
			else {
				// đưa dữ liệu vào model
				User_Class user_class=new User_Class();
				user_class.setIdclass(idclass);
				user_class.setIduser(iduser);
				
				DBUser_Class db = new DBUser_Class();
				
					// thêm học viên vào lớp học thông qua hàm từ DAO
					if (db.addStudent(user_class))
					{
						// trừ tiền trong tài khoản của học viên
						myaccount = myaccount - fee;
	
						User_Info user_info= new User_Info();
						user_info.setMyaccount(myaccount);
						user_info.setIduser(iduser);
						
						DBUser_Info dbuser_info = new DBUser_Info();
	
						dbuser_info.updateMyAccount(user_info);
						//thông báo thành công
						request.setAttribute("thongbao", 1);
						request.getRequestDispatcher("/WEB-INF/khoahoccuaban.jsp").forward(request, response);
					}
					else {
						//thông báo thất bại
						request.setAttribute("thongbao", 2);
						request.getRequestDispatcher("/WEB-INF/khoahoccuaban.jsp").forward(request, response);
					}
			
				}
	    } catch (Exception e) {
	    	//thông báo thất bại
			request.setAttribute("thongbao", 3);
			request.getRequestDispatcher("/WEB-INF/muakhoahoc.jsp?idlh="+idclass).forward(request, response);
		}
	}
	

}
