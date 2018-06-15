package Controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;


import javax.servlet.ServletException;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Bean.Announce;
import Dao.DBAnnounce;

@WebServlet("/quanlythongbao")
@MultipartConfig
public class quanlythongbao extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public quanlythongbao() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/WEB-INF/quanlythongbao.jsp").forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// THÊM THÔNG BÁO
		// nhận bộ mã hóa ký tự UTF-8
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    try {	
	    // nhận giá trị từ request
		String idadmin = (String) request.getSession().getAttribute("username");
		String title = (String) request.getParameter("tieude");
		String content_announce = (String) request.getParameter("noidung");
		String description = (String) request.getParameter("description");
		
		//lấy địa chỉ local của ảnh
		Part filePart = request.getPart("file");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		//lấy nội dung ảnh
		InputStream fileContent = filePart.getInputStream();
		
		String url = request.getServletContext().getRealPath("") + "image\\";
		
		File uploads = new File(url);
		File file = new File(uploads, fileName);//tạo file với tên ảnh
		Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);//copy dữ liệu vào file ảnh
		// đưa dữ liệu vào model
		Announce announce= new Announce();
		announce.setTitle(title);
		announce.setContent_announce(content_announce);
		announce.setDescription(description);
		announce.setIdadmin(idadmin);
		announce.setImages(fileName);
		
		DBAnnounce db = new DBAnnounce();
		// gọi hàm tạo thông báo
		if (db.createAnnounce(announce)) {
			request.getRequestDispatcher("/WEB-INF/quanlythongbao.jsp").forward(request, response);
		}
		else {
			//thông báo thất bại
			request.setAttribute("thongbao", 1);
			request.getRequestDispatcher("/WEB-INF/quanlythongbao.jsp").forward(request, response);
		}
	   }
	    catch (Exception e) {
	    	//thông báo thất bại
			request.setAttribute("thongbao", 1);
	    	request.getRequestDispatcher("/WEB-INF/quanlythongbao.jsp").forward(request, response);
		}
	}

}
