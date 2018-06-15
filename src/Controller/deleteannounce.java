package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Announce;
import Dao.DBAnnounce;

@WebServlet("/deleteannounce")
public class deleteannounce extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public deleteannounce() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			// lấy idannounce từ request
			int idannounce = Integer.parseInt(request.getParameter("id"));
			// đưa dữ liệu vào model
			Announce announce= new Announce();
			announce.setIdannounce(idannounce);
			//gọi hàm xóa thông báo
			DBAnnounce db = new DBAnnounce();
			if (db.deleteAnnounce(announce)) {
				request.getRequestDispatcher("/WEB-INF/quanlythongbao.jsp").forward(request, response);

			}
			else {
				//thông báo thất bại
				request.setAttribute("thongbao", 0);
				request.getRequestDispatcher("/WEB-INF/quanlythongbao.jsp").forward(request, response);
			}
		}catch (Exception e) {
			//thông báo thất bại
			request.setAttribute("thongbao", 0);
			request.getRequestDispatcher("/WEB-INF/quanlythongbao.jsp").forward(request, response);
		}
	}

}
