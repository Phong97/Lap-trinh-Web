package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/thongbaochitiet")
public class thongbaochitiet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public thongbaochitiet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//nhận idthbct và chuyển nó đến trang thongbaochitiet.jsp
		String idthbct = (String) request.getParameter("idthbct");
		request.setAttribute("idthbct", idthbct);
		request.getRequestDispatcher("/WEB-INF/thongbaochitiet.jsp").forward(request, response);
	}

}
