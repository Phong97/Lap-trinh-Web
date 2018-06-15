package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Forum;
import Dao.DBForum;


@WebServlet("/deletecomment")
public class deletecomment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public deletecomment() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// nhận dữ liệu từ request
			int idcomment = Integer.parseInt(request.getParameter("id"));
			String iduser=(String) request.getParameter("iduser");
			String username=(String) request.getSession().getAttribute("username");
			int admin = (int) request.getSession().getAttribute("admin");
			// đưa dữ liệu vào model
			Forum forum= new Forum();
			forum.setIdcomment(idcomment);
			
			DBForum db = new DBForum();
			// nếu là admin, được xóa tất cả các bình luân trong diễn đàn
			// ngược lại thì chỉ được xóa bình luận của mình
			if(admin!=1)
			{
				// kiểm tra bình luận đó là của mình hay không?
				if(iduser.equals(username))
				{
					// gọi hàm xóa bình luận
					if (db.deleteForum(forum)) {
						request.getRequestDispatcher("/WEB-INF/diendan.jsp").forward(request, response);

					}
					else {
						// lỗi
						request.getRequestDispatcher("/WEB-INF/diendan.jsp").forward(request, response);
					}
				} else
				{
					// lỗi
					request.getRequestDispatcher("/WEB-INF/diendan.jsp").forward(request, response);
				}
			}
			else
			{
				// gọi hàm xóa bình luận
				if (db.deleteForum(forum)) {
					request.getRequestDispatcher("/WEB-INF/diendan.jsp").forward(request, response);

				}
				else {
					// lỗi
					request.getRequestDispatcher("/WEB-INF/diendan.jsp").forward(request, response);
				}
			}
		}catch (Exception e) {
			// lỗi
			request.getRequestDispatcher("/WEB-INF/diendan.jsp").forward(request, response);
		}
	}

}
