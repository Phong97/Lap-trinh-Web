<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<fmt:requestEncoding value="UTF-8" />

<!DOCTYPE html>
<html lang="en">
<head>
<!-- khai báo các thư viện-->
<title>Cập nhật khóa học</title>
<meta charset="utf-8">
<!-- Khai báo các thư viện css-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="lib/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Nhúng style.css do ta tạo vào trang web -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- Khai báo các thư viện js-->
<script src="lib/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="lib/jquery.dataTables.min.js"></script>
<script src="lib/dataTables.bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('#table').DataTable();
	});
</script>
<script src="lib/tinymce/js/tinymce/tinymce.min.js"></script>
<script src="lib/tinymce/js/tinymce/jquery.tinymce.min.js"></script>
<script>
	tinymce
			.init({
				/* replace textarea having class .tinymce with tinymce editor */
				selector : "textarea",

				/* theme of the editor */
				theme : "modern",
				skin : "lightgray",

				/* width and height of the editor */
				width : "100%",
				height : 300,

				/* display statusbar */
				statubar : true,

				/* plugin */
				plugins : [
						"advlist autolink link image lists charmap print preview hr anchor pagebreak",
						"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
						"save table contextmenu directionality emoticons template paste textcolor" ],

				/* toolbar */
				toolbar : "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",

				/* style */
				style_formats : [ {
					title : "Headers",
					items : [ {
						title : "Header 1",
						format : "h1"
					}, {
						title : "Header 2",
						format : "h2"
					}, {
						title : "Header 3",
						format : "h3"
					}, {
						title : "Header 4",
						format : "h4"
					}, {
						title : "Header 5",
						format : "h5"
					}, {
						title : "Header 6",
						format : "h6"
					} ]
				}, {
					title : "Inline",
					items : [ {
						title : "Bold",
						icon : "bold",
						format : "bold"
					}, {
						title : "Italic",
						icon : "italic",
						format : "italic"
					}, {
						title : "Underline",
						icon : "underline",
						format : "underline"
					}, {
						title : "Strikethrough",
						icon : "strikethrough",
						format : "strikethrough"
					}, {
						title : "Superscript",
						icon : "superscript",
						format : "superscript"
					}, {
						title : "Subscript",
						icon : "subscript",
						format : "subscript"
					}, {
						title : "Code",
						icon : "code",
						format : "code"
					} ]
				}, {
					title : "Blocks",
					items : [ {
						title : "Paragraph",
						format : "p"
					}, {
						title : "Blockquote",
						format : "blockquote"
					}, {
						title : "Div",
						format : "div"
					}, {
						title : "Pre",
						format : "pre"
					} ]
				}, {
					title : "Alignment",
					items : [ {
						title : "Left",
						icon : "alignleft",
						format : "alignleft"
					}, {
						title : "Center",
						icon : "aligncenter",
						format : "aligncenter"
					}, {
						title : "Right",
						icon : "alignright",
						format : "alignright"
					}, {
						title : "Justify",
						icon : "alignjustify",
						format : "alignjustify"
					} ]
				} ]
			});
</script>

<!-- Nhúng validation.js do ta tạo vào trang web -->
<script type="text/javascript" src="js/validation.js"></script>

<!-- jquery ui -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
</head>
<body id="myPage">
	<!-- danh mục-->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="trangchu">TRANG CHỦ</a></li>
					<li><a href="trangkhoahoc">KHÓA HỌC</a></li>
					<li><a href="tranglichhoc.jsp">LỊCH HỌC</a></li>
					<li><a href="trangthongbao">THÔNG BÁO</a></li>
					<li><a href="diendan">DIỄN ĐÀN</a></li>
				</ul>
				<!-- check username  -->
				<%@ page import="java.io.*,java.util.*"%>
				<%
					String idcourse = (String) request.getParameter("idcourse");

					if (idcourse == null) {
						request.getRequestDispatcher("/WEB-INF/trangchu.jsp").forward(request, response);
					}

					session.setAttribute("idcourse", idcourse);

					int admin = (int) session.getAttribute("admin");
					if (admin != 1) {
						request.getRequestDispatcher("/WEB-INF/trangchu.jsp").forward(request, response);
					} 
					//get username
					String username = (String) session.getAttribute("username");
					if (username != null) {
				%>

				<div class="navbar-right navbar-log text-center">
					<a href="trangcanhan">
						<button class="btn btn-primary">
							<span class="glyphicon glyphicon-folder-open"></span> Hồ sơ của bạn
						</button></a> 
					<a href="logoutuser">
						<button class="btn btn-primary">
							<span class="glyphicon glyphicon-log-out"></span> Đăng Xuất
						</button>
					</a>
				</div>
				<%
					} else {
						request.getRequestDispatcher("/WEB-INF/trangchu.jsp").forward(request, response);
					}
				%>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<!-- Content-->
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3">
				<div class="imgAvatar thumbnail">
					<img class="img-responsive" src="image/${avatar}" style="width:250px; height:250px;" alt="Ảnh đại diện"/>
				</div>
				<div class="NameAccount">${username}</div>
				<div class="Menu content">
					<ul class="list-group">
						<li class="list-group-item"><a href="trangcanhan">Thông tin tài khoản</a></li>
						<li class="list-group-item"><a href="doimatkhau">Đổi mật khẩu</a></li>
						<li class="list-group-item"><a href="doianhdaidien">Đổi ảnh đại diện</a></li>
						<li class="list-group-item"><a href="khoahoccuaban">Khóa học của bạn</a></li>
						<li class="list-group-item"><a href="khoahocdaday">Khóa học đã dạy</a></li>
						<li class="list-group-item"><a href="taikhoancuaban">Tài khoản của bạn</a></li>
						<li class="list-group-item"><a href="quanlyuser">Quản lý User</a></li>
						<li id="list-one" class="list-group-item"><a href="quanlykhoahoc">Quản lý khóa học</a></li>
						<li class="list-group-item"><a href="quanlythongbao">Quản lý thông báo</a></li>
					</ul>
				</div>
			</div>

			 	<!-- connect databse -->
				<sql:setDataSource var="data"
					driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://localhost/dbquanlyttth" user = "root"  password = "12345"/>
				<sql:query dataSource="${data}" var="result">
	         		select * from course where IDCourse=?;
	         		<sql:param value="${idcourse}" />
				</sql:query>

			<div class="inform col-sm-9">
				<div id="course" class="titleInfo title">Cập nhập thông tin khóa học</div>
				<div class="khoangcach">
					<br> <br>
				</div>
				<!--thông báo  -->
				<div>
					<c:if test="${thongbao eq 3}">
					  	<p id="announce2">Cập nhật khóa học không thành công!</p>
					</c:if>
					<c:if test="${thongbao eq 2}">
					  	<p id="announce2">Xóa lớp học không thành công!</p>
					</c:if>
					<c:if test="${thongbao eq 1}">
					  	<p id="announce2">Cập nhật lớp học thành công!</p>
					</c:if>
					<c:if test="${thongbao eq 0}">
					  	<p id="announce2">Thêm lớp học không thành công!</p>
					</c:if>
					
				</div>
				
				<c:forEach var="row" items="${result.rows}">
					<form action="capnhapkhoahoc" method="post" enctype="multipart/form-data">
						<div class="col-sm-2">
							<span><strong>Tên khóa học</strong></span>
						</div>
						<div class="col-sm-10">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon">
									<i class="fa fa-align-justify" aria-hidden="true"></i>
								</span> 
								<input id="tenkhoahoc" type="text" class="form-control content_input"
										placeholder="Tên khóa học" aria-describedby="basic-addon"
										value="${row.NameCourse}" name="tenkhoahoc" required>
							</div>
						</div>
						<div class="khoangcach">
							<br> <br>
						</div>
						 <br>
						 <div>
						 	<p id="announce"></p>
						 </div>
						<div class="col-sm-2">
							<span><strong>Học phí</strong></span>
						</div>
						<div class="col-sm-10">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon">
									<i class="fa fa-money" aria-hidden="true"></i>
								</span> 
									<input id="validation_fee" type="text" class="form-control content_input"
									placeholder="Học phí" aria-describedby="basic-addon" value="${row.Fee}" name="hocphi" required>
							</div>
						</div>
						<div class="khoangcach">
							<br> <br>
						</div>
						 <br>
						 <div class="col-sm-2">
							<span><strong>Hình ảnh bìa</strong></span>
						</div>
						<div class="col-sm-10">
							<div class="input-group">
								<img class="img-responsive" src="image/${row.Images}" style="width:300px; height:170px;" alt="Ảnh bìa"/>			
							</div>							
						</div>
						<div class="khoangcach">
							<br> <br>
						</div>
						<div class="khoangcach">
							<br> <br>
						</div>
						<div class="khoangcach">
							<br> <br>
						</div>
						<div class="khoangcach">
							<br> <br>
						</div>
						<div class="khoangcach">
							<br> <br>
						</div>
						 <div class="col-sm-2">
							<span><strong>Chọn lại hình(*)</strong></span>
						</div>
						<div class="col-sm-10">
							<input type="file" name="file" class="content_input"
							accept="image/*">
						</div>
						<div class="khoangcach">
							<br> <br>
						</div>
						
						 <br>
						<div class="col-sm-2">
							<span><strong>Nội dung</strong></span>
						</div>
						<div class="khoangcach">
							<br>
						</div>
						 <br>
						<textarea name="noidung">${row.Content_Course}</textarea>
						<div class="khoangcach">
							<br> <br>
						</div>
						 <br>
				
						<div class="col-sm-6 col-xs-6 text-right">
							<button id="Confirm_info" class="btn btn-primary" type="submit">
								<span class="glyphicon glyphicon-ok"></span> Xác nhận
							</button>
						</div>
						<div class="col-sm-6 col-xs-6 text-center">
							<button id="Reset_info" class="btn btn-danger" type="reset">
								<span class="glyphicon glyphicon-remove"></span> Hủy bỏ
							</button>
						</div>
					</form>
				</c:forEach>

				<sql:query dataSource="${data}" var="result">
         			select * from class where IDCourse=?;
         			<sql:param value="${idcourse}" />
				</sql:query>
										
				<br>
				<div class="khoangcach">
					<br> <br>
				</div>
				<!--Lớp học-->
				<div class="titleInfo title">Danh sách lớp học</div>
				<br/>
				<div class="table-responsive">
					<table id="table" class="table table-bordered table-striped">
						<thead>
							<tr>
			                    <th class="text-center">Lịch học</th>
								<th class="text-center">Số lượng</th>
								<th class="text-center">Bài giảng</th>
								<th class="text-center">Ngày khai giảng</th>
								<th class="text-center">Giáo viên</th>
								<th class="text-center"></th>
								<th class="text-center"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${result.rows}">
								<tr>
									<form action="deleteclass" method="post">
										<input maxlength="8" size="1" type="hidden" name="id" value="${row.IDClass}"/>
										<td>${row.TimeStudy}</td>
										<td>${row.Limited}</td>
										<td><a href="${row.Link}" target="_blank">Link học tập</a></td>
										<td>${row.Start}</td>
										<td>
											<sql:query dataSource="${data}" var="result1">
							         			select Name from user_info where IDUser=?;
							         			<sql:param value="${row.IDTeacher}" />
											</sql:query>
											<c:forEach var="row1" items="${result1.rows}">
												${row1.Name}
											</c:forEach>
										</td>
										<td class="text-center">
											<a href="capnhaplophoc?idclass=${row.IDClass}">
												<button id="update" class="btn btn-primary" type="button">
													<span class="fa fa-wrench"></span>
												</button>
											</a>
										</td>
										<td>
											<button id="delete" class="btn btn-primary" type="submit">
												<span class="fa fa-trash"></span>
											</button>
										</td>
									</form>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<hr />
				<form action="createclass" name="khoahoc" method="post">
					
					<div class="col-sm-2">
						<span><strong>Lịch học</strong></span>
					</div>
					<div class="col-sm-10">
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon">
								<i class="fa fa-calendar" aria-hidden="true"></i>
							</span> 
							<input name="lichhoc" type="text" class="form-control content_input"
								placeholder="Lịch học" aria-describedby="basic-addon" required>
						</div>
					</div>
					<div class="khoangcach">
						<br> <br>
					</div>
					<br>
					<div>
					  	<p id="announce1"></p>		
					</div>
					<div class="col-sm-2">
						<span><strong>Số Lượng</strong></span>
					</div>
					<div class="col-sm-10">
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon">
								<i class="fa fa-list-ol" aria-hidden="true"></i>
							</span> 
							<input id="soluong" name="soluong" type="text" class="form-control content_input"
								placeholder="Số Lượng" aria-describedby="basic-addon" required>
						</div>
					</div>
					<div class="khoangcach">
						<br> <br>
					</div>
					<br>
					<div class="col-sm-2">
						<span><strong>Bài giảng</strong></span>
					</div>
					<div class="col-sm-10">
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon">
								<i class="fa fa-link" aria-hidden="true"></i>
							</span> 
							<input name="baigiang" type="text" class="form-control content_input"
								placeholder="Link bài giảng" aria-describedby="basic-addon"
								required>
						</div>
					</div>
					<div class="khoangcach">
						<br> <br>
					</div>
					<br>
					<div class="col-sm-2">
						<span><strong>Ngày khai giảng</strong></span>
					</div>
					<div class="col-sm-10">
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon">
								<i class="fa fa-calendar" aria-hidden="true"></i>
							</span> 
							<input name="ngaykhaigiang" type="text"
								class="form-control content_input" placeholder="Ngày Khai Giảng"
								aria-describedby="basic-addon" required>
						</div>
					</div>
					<div class="khoangcach">
						<br> <br>
					</div>
					<br>
					<div class="col-sm-2">
						<span><strong>Giáo viên</strong></span>
					</div>
					<div class="col-sm-10">					
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon">
								<i class="fa fa-user" aria-hidden="true"></i>
							</span>
							<select class="form-control" name="giaovien" required>
								<sql:query dataSource="${data}" var="result">
							         select * from user_info;
								</sql:query>
								<option value="">Chọn giáo viên</option>	
								<c:forEach var="row" items="${result.rows}">
									<option value="${row.IDUser}">${row.Name}</option>		
								</c:forEach>
				                
				            </select>
						</div>
					</div>
					<div class="khoangcach">
						<br> <br>
					</div>
					<br>
					<div class="col-sm-6 col-xs-6 text-right">
						<button id="Confirm_info" class="btn btn-primary" type="submit">
							<span class="glyphicon glyphicon-ok"></span> Xác nhận
						</button>
					</div>
					<div class="col-sm-6 col-xs-6 text-center">
						<button id="Reset_info" class="btn btn-danger" type="reset">
							<span class="glyphicon glyphicon-remove"></span> Hủy bỏ
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Contact-->
	<div id="contact" class="container-fluid">
		<div class="text-center">
			<a href="#myPage" title="To Top"> <span
				class="glyphicon glyphicon-chevron-up"></span>
			</a>
		</div>
		<h2 class="text-center content">LIÊN HỆ</h2>
		<h3 class="text-center content">Hãy liên hệ với chúng tôi, chúng tôi sẽ trả lời trong vòng 8 giờ .</h3>
		<div class="row slideanim">
			<div class="col-sm-2"></div>
			<div class="col-sm-5">
				<p class="contact_inf">
					<span class="glyphicon glyphicon-map-marker logo2"></span> Số 1, Võ Văn Ngân, Q.Thủ Đức, Hồ Chí Minh, Việt Nam.
				</p>
				<p class="contact_inf">
					<span class="glyphicon glyphicon-phone logo2"></span> 01665293553
				</p>
				<p class="contact_inf">
					<span class="glyphicon glyphicon-envelope logo2"></span> nctrung22041997@gmail.com
				</p>
			</div>
			<div class="col-sm-5">
				<p class="contact_inf">
					<span class="logo2"><i class="fa fa-facebook"
						aria-hidden="true"></i></span><a
						href="https://www.facebook.com/trungncdev"> Facebook (Nguyễn Chí Trung)</a>
				</p>
				<p class="contact_inf">
					<span class="logo2"><i class="fa fa-google-plus"
						aria-hidden="true"></i></span><a
						href="https://www.facebook.com/conhoyolo"> Google+ (Lê Thị Thảo Nhi)</a>
				</p>
				<p class="contact_inf">
					<span class="logo2"><i class="fa fa-twitter"
						aria-hidden="true"></i></span><a
						href="https://www.facebook.com/boyvnpro1997"> Twitter (Hồ Văn Phong)</a>
				</p>
			</div>
		</div>
		<h5 class="text-center">Copyright @ Trung tâm tin học Hoài Ân</h5>
	</div>
</body>
</html>