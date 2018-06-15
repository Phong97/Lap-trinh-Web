package Controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import Bean.User_Info;
import Dao.DBUser_Info;

@WebServlet("/doianhdaidien")
@MultipartConfig
public class doianhdaidien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public doianhdaidien() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/doianhdaidien.jsp").forward(request, response);
		
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// nhận bộ mã hóa ký tự UTF-8
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
		try {
		//nhận dữ liệu từ request
		String iduser = (String) request.getSession().getAttribute("username");
		
		//xóa avatar cũ
		
		DBUser_Info db = new DBUser_Info();
		User_Info user = new User_Info();
		// lấy ảnh trước khi đổi
		user.setIduser(iduser);
		String nameImage = db.getAvatar(user);
		//lấy url của server
		String url = request.getServletContext().getRealPath("") + "image\\";
		//xóa file ảnh trừ tài khoản có ảnh khởi tạo man.jpg
		if(!nameImage.equals("man.jpg")) {
			File uploads = new File(url);
			File file = new File(uploads, nameImage);
			if (file.exists())
			{
				file.delete();
			}
		}
		
		//lấy địa chỉ local của ảnh
		Part filePart = request.getPart("file");
		/*String fileNameUpload = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();*/
		
		//get ngày tháng
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String fileName = "avatar "+ iduser + " " + dateFormat.format(date); //tạo tên ảnh
		//thay đổi phong972017/12/13 22:53:15 ->phong972017_12_13 22_53_15
		fileName = fileName.replace("/", "_");
		fileName = fileName.replace(":", "_");
		
		//lấy nội dung ảnh
		InputStream fileContent = filePart.getInputStream();
		
		File uploads = new File(url);
		File file = new File(uploads, fileName); //tạo file với tên ảnh
		Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING); //copy dữ liệu vào file ảnh
				
		user.setImages(fileName);
		
		if (db.changeAvatar(user)) {
			//thông báo thành công
			request.getSession().setAttribute("avatar", fileName);
			
			request.getRequestDispatcher("/WEB-INF/doianhdaidien.jsp").forward(request, response);
		}
		else {
			//thông báo thất bại
			request.setAttribute("thongbao", 0);
			request.getRequestDispatcher("/WEB-INF/doianhdaidien.jsp").forward(request, response);
		}
		} catch(Exception ex) {
			//thông báo thất bại
			request.setAttribute("thongbao", 0);
			request.getRequestDispatcher("/WEB-INF/doianhdaidien.jsp").forward(request, response);
		}
	}

}
