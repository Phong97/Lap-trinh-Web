package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DBClass;
import Bean.Class;
@WebServlet("/createclass")
public class createclass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public createclass() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// nhận chuẩn bộ mã hóa ký tự UTF-8
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	  //nhận idcourse lại từ session
		int idcourse = Integer.parseInt((String) request.getSession().getAttribute("idcourse"));
		
	    try {	
	    	 // nhận giá trị từ request
			String stringlimit = (String) request.getParameter("soluong");
			int limited = Integer.parseInt(stringlimit);
			String link = (String) request.getParameter("baigiang");
			String start = request.getParameter("ngaykhaigiang");
			String timestudy = request.getParameter("lichhoc");
			String idteacher = request.getParameter("giaovien");
			
			// đưa dữ liệu vào model
			Class class1= new Class();
			class1.setLimited(limited);
			class1.setLink(link);
			class1.setStart(start);
			class1.setTimestudy(timestudy);
			class1.setIdteacher(idteacher);
			class1.setIdCourse(idcourse);
			
			// gọi hàm tạo khóa học từ DAO
			DBClass db = new DBClass();
			if (db.createClass(class1)) {
				
				request.getRequestDispatcher("/WEB-INF/capnhapkhoahoc.jsp?idcourse="+idcourse).forward(request, response);
			}
			else {
				//thông báo thất bại
				request.setAttribute("thongbao", 0);
				request.getRequestDispatcher("/WEB-INF/capnhapkhoahoc.jsp?idcourse="+idcourse).forward(request, response);
			}
		   }
		    catch (Exception e) {
		    	//thông báo thất bại
				request.setAttribute("thongbao", 0);
				request.getRequestDispatcher("/WEB-INF/capnhapkhoahoc.jsp?idcourse="+idcourse).forward(request, response);
			}
	}

}
