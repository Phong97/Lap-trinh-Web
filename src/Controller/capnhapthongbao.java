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

@WebServlet("/capnhapthongbao")
@MultipartConfig
public class capnhapthongbao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public capnhapthongbao() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//nhận idannounce và chuyển nó đến trang capnhapthongbao.jsp
		String idannounce = (String) request.getParameter("idannounce");
		request.setAttribute("idannounce", idannounce);
		request.getRequestDispatcher("/WEB-INF/capnhapthongbao.jsp").forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// nhận chuẩn bộ mã hóa ký tự UTF-8
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	  //nhận idannounce lại từ session
		int idannounce = Integer.parseInt((String) request.getSession().getAttribute("idannounce"));

	    try {	
	    // nhận giá trị từ request
		String title = (String) request.getParameter("tieude");
		String  description= (String) request.getParameter("description");
		String content_announce = request.getParameter("noidung");
		
		//lấy địa chỉ local của ảnh
		Part filePart = request.getPart("file");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		
		// nếu không muốn thay đổi hình ảnh bìa
		if(fileName.equals("")) {
			// đưa dữ liệu vào model
			Announce announce= new Announce();
			announce.setIdannounce(idannounce);
			announce.setTitle(title);
			announce.setContent_announce(content_announce);
			announce.setDescription(description);
			
			DBAnnounce db= new	DBAnnounce();
			// gọi hàm cập nhật thông báo không ảnh từ DAO
			if (db.updateAnnounceNoImage(announce)) {
				request.getRequestDispatcher("/WEB-INF/quanlythongbao.jsp").forward(request, response);		
			}
			else {
				//thông báo thất bại
				request.setAttribute("thongbao", 0);
				request.getRequestDispatcher("/WEB-INF/capnhapthongbao.jsp?idannounce="+idannounce).forward(request, response);		
			}
		}
		else
		{	
			//lấy nội dung ảnh
			InputStream fileContent = filePart.getInputStream();
			
			String url = request.getServletContext().getRealPath("") + "image\\";
			
			File uploads = new File(url);
			File file = new File(uploads, fileName); //tạo file với tên ảnh
			Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);//copy dữ liệu vào file ảnh
			
			// đưa dữ liệu vào model
			Announce announce= new Announce();
			announce.setIdannounce(idannounce);
			announce.setTitle(title);
			announce.setContent_announce(content_announce);
			announce.setDescription(description);
			announce.setImages(fileName);
			// gọi hàm cập nhật thông báo từ DAO
			DBAnnounce db= new	DBAnnounce();
			if (db.updateAnnounce(announce)) {
				request.getRequestDispatcher("/WEB-INF/quanlythongbao.jsp").forward(request, response);		
			}
			else {
				//thông báo thất bại
				request.setAttribute("thongbao", 0);
				request.getRequestDispatcher("/WEB-INF/capnhapthongbao.jsp?idannounce="+idannounce).forward(request, response);		
			}
		}		
	   }
	    catch (Exception e) {
	    	//thông báo thất bại
			request.setAttribute("thongbao", 0);
	    	request.getRequestDispatcher("/WEB-INF/capnhapthongbao.jsp?idannounce="+idannounce).forward(request, response);		
		}
	}

}
