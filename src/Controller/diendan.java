package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Forum;
import Dao.DBForum;

@WebServlet("/diendan")
public class diendan extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public diendan() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/diendan.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// nhận bộ mã hóa ký tự UTF-8
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    try {	
	    	// nhận dữ liệu từ repuest
	    	String comment = (String) request.getParameter("comment");
			String iduser=(String) request.getSession().getAttribute("username");
			// nếu iduser is null thì gán cho nó là guest với iduser=noname 
			if(iduser==null)
			{
				iduser="noname";
			}
			// đưa dữ liệu vào model
			Forum forum = new Forum();
			forum.setIduser(iduser);
			forum.setComment(comment);
			
			// gọi hàm tạo bình luận
			DBForum db = new DBForum();
			if (db.createForum(forum)) {
				//thành công
				request.getRequestDispatcher("/WEB-INF/diendan.jsp").forward(request, response);
			}
			else {
				// lỗi
				request.getRequestDispatcher("/WEB-INF/diendan.jsp").forward(request, response);
			}
		   }
		    catch (Exception e) {
		    	//lỗi
		    	request.getRequestDispatcher("/WEB-INF/diendan.jsp").forward(request, response);
			}
	}

}
