package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/khoahocchitiet")
public class khoahocchitiet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public khoahocchitiet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//nhận idkhct và chuyển nó đến trang khoahocchitiet.jsp
		String idkhct = (String) request.getParameter("idkhct");
		request.setAttribute("idkhct", idkhct);
		request.getRequestDispatcher("/WEB-INF/khoahocchitiet.jsp").forward(request, response);
	}

}
