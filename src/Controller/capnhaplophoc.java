package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Class;
import Dao.DBClass;

@WebServlet("/capnhaplophoc")
public class capnhaplophoc extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public capnhaplophoc() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//nhận idclass và chuyển nó đến trang capnhaplophoc.jsp
		String idclass = (String) request.getParameter("idclass");
		request.setAttribute("idclass", idclass);
		request.getRequestDispatcher("/WEB-INF/capnhaplophoc.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// nhận chuẩn bộ mã hóa ký tự UTF-8
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    //nhận idclass lại từ session
	    int idclass = Integer.parseInt((String) request.getSession().getAttribute("idclass"));
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
			class1.setIdclass(idclass);
			class1.setLimited(limited);
			class1.setLink(link);
			class1.setStart(start);
			class1.setTimestudy(timestudy);
			class1.setIdteacher(idteacher);

			// gọi hàm cập nhật lớp học từ DAO
			DBClass db = new DBClass();
			if (db.updateClass(class1)) {
				//thông báo thành công
				request.setAttribute("thongbao", 1);
				request.getRequestDispatcher("/WEB-INF/capnhapkhoahoc.jsp?idcourse="+db.getIDCourse(class1)).forward(request, response);
			}
			else {
				//thông báo thất bại
				request.setAttribute("thongbao", 0);
				request.getRequestDispatcher("/WEB-INF/capnhaplophoc.jsp?idclass="+idclass).forward(request, response);
			}
		   }
		    catch (Exception e) {
		    	//thông báo thất bại
				request.setAttribute("thongbao", 0);
		    	request.getRequestDispatcher("/WEB-INF/capnhaplophoc.jsp?idclass="+idclass).forward(request, response);
			}
	}

}
