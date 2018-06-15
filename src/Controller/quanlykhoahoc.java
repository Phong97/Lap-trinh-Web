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

import Bean.Course;
import Dao.DBCourse;

@WebServlet("/quanlykhoahoc")
@MultipartConfig
public class quanlykhoahoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public quanlykhoahoc() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/WEB-INF/quanlykhoahoc.jsp").forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//THÊM KHÓA HỌC
		// nhận bộ mã hóa ký tự UTF-8
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    try {	
	    // nhận giá trị từ request
		String namecourse = (String) request.getParameter("tenkhoahoc");
		
		String stringfee = (String) request.getParameter("hocphi");
		Double fee= Double.parseDouble(stringfee);
		
		String content_course = request.getParameter("noidung");
		//lấy địa chỉ local của ảnh
		Part filePart = request.getPart("file");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		//lấy nội dung ảnh
		InputStream fileContent = filePart.getInputStream();
		
		String url = request.getServletContext().getRealPath("") + "image\\";
		
		File uploads = new File(url);
		File file = new File(uploads, fileName);//tạo file với tên ảnh
		Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);  //copy dữ liệu vào file ảnh

		DBCourse db = new DBCourse();
		// đưa dữ liệu vào model
		Course course= new Course();
		course.setNamecourse(namecourse);
		course.setContent_course(content_course);
		course.setFee(fee);
		course.setImages(fileName);
		// gọi hàm tạo khóa học
		if (db.createCourse(course)) {
			request.getRequestDispatcher("/WEB-INF/quanlykhoahoc.jsp").forward(request, response);
		}
		else {
			//thông báo thất bại
			request.setAttribute("thongbao", 0);
			request.getRequestDispatcher("/WEB-INF/quanlykhoahoc.jsp").forward(request, response);
		}
	   }
	    catch (Exception e) {
	    	//thông báo thất bại
			request.setAttribute("thongbao", 0);
	    	request.getRequestDispatcher("/WEB-INF/quanlykhoahoc.jsp").forward(request, response);
		}
	}

}
