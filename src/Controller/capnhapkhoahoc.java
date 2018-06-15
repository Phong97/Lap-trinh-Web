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

@WebServlet("/capnhapkhoahoc")
@MultipartConfig
public class capnhapkhoahoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public capnhapkhoahoc() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//nhận idcourse và chuyển nó đến trang capnhapkhoahoc.jsp
		String idcourse = (String) request.getParameter("idcourse");
		request.setAttribute("idcourse", idcourse);
		request.getRequestDispatcher("/WEB-INF/capnhapkhoahoc.jsp").forward(request, response);		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// nhận bộ mã hóa ký tự UTF-8
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    //nhận idcourse lại từ session
	    int idcourse = Integer.parseInt((String) request.getSession().getAttribute("idcourse"));
	    
	    try {	
	    // nhận giá trị từ request
		String namecourse = (String) request.getParameter("tenkhoahoc");
		String  stringfee= (String) request.getParameter("hocphi");
		Double fee= Double.parseDouble(stringfee);
		String content_course = request.getParameter("noidung");
		
		//lấy địa chỉ local của ảnh
		Part filePart = request.getPart("file");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		
		// nếu không muốn thay đổi hình ảnh bìa
		if(fileName.equals("")) {
			// đưa dữ liệu vào model
			Course course= new Course();
			course.setIdcourse(idcourse);
			course.setNamecourse(namecourse);
			course.setContent_course(content_course);
			course.setFee(fee);
			
			DBCourse db = new DBCourse();
			// gọi hàm cập nhật khóa học không ảnh từ DAO
			if (db.updateCourseNoImage(course)) {
				
				request.getRequestDispatcher("/WEB-INF/quanlykhoahoc.jsp").forward(request, response);		
			}
			else {
				//thông báo thất bại
				request.setAttribute("thongbao", 3);
				request.getRequestDispatcher("/WEB-INF/capnhapkhoahoc.jsp?idcourse="+idcourse).forward(request, response);		
			}
		} 
		else
		{
			//lấy nội dung ảnh
			InputStream fileContent = filePart.getInputStream();
			
			String url = request.getServletContext().getRealPath("") + "image\\";
			
			File uploads = new File(url);
			File file = new File(uploads, fileName);  //tạo file với tên ảnh
			Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING); //copy dữ liệu vào file ảnh
			
			// đưa dữ liệu vào model
			Course course= new Course();
			course.setIdcourse(idcourse);
			course.setNamecourse(namecourse);
			course.setContent_course(content_course);
			course.setFee(fee);
			course.setImages(fileName);
			
			DBCourse db = new DBCourse();
			// gọi hàm cập nhật khóa học từ DAO
			if (db.updateCourse(course)) {
				
				request.getRequestDispatcher("/WEB-INF/quanlykhoahoc.jsp").forward(request, response);		
			}
			else {
				//thông báo thất bại
				request.setAttribute("thongbao", 3);				
				request.getRequestDispatcher("/WEB-INF/capnhapkhoahoc.jsp?idcourse="+idcourse).forward(request, response);		
			}
		}
		
	   }
	    catch (Exception e) {
	    	//thông báo thất bại
			request.setAttribute("thongbao", 3);
	    	request.getRequestDispatcher("/WEB-INF/capnhapkhoahoc.jsp?idcourse="+idcourse).forward(request, response);		
		}
	}

}
