package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logoutuser")
public class dangxuat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public dangxuat() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// loại bỏ các session
		request.getSession().invalidate();
		request.getRequestDispatcher("/WEB-INF/trangchu.jsp").forward(request, response);
	}

}
