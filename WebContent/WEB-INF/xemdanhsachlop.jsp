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
<title>Danh Sách Lớp Học</title>
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
<!-- Nhúng validation.js do ta tạo vào trang web -->
<script type="text/javascript" src="js/validation.js"></script>
</head>
<body id="myPage">
	<!-- danh mục-->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
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
					int iddslh;
					try {
						iddslh = Integer.parseInt(request.getParameter("iddslh"));
					} catch (Exception ex) {
						iddslh = -1;
					}
					request.setAttribute("iddslh", iddslh);
					//get username
					String username = (String) session.getAttribute("username");
					if (username != null) {
				%>
				<div class="navbar-right navbar-log text-center">
					<a href="trangcanhan"><button class="btn btn-primary">
							<span class="glyphicon glyphicon-folder-open"></span> Hồ sơ của
							bạn
						</button></a> <a href="logoutuser"><button
							class="btn btn-primary">
							<span class="glyphicon glyphicon-log-out"></span> Đăng Xuất
						</button></a>
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
						<li id="list-one" class="list-group-item"><a href="khoahocdaday">Khóa học đã dạy</a></li>
						<li class="list-group-item"><a href="taikhoancuaban">Tài khoản của bạn</a></li>
						<%
							int admin = (int) session.getAttribute("admin");
							if (admin == 1) {
						%>
						<li class="list-group-item"><a href="quanlyuser">Quản lý User</a></li>
						<li class="list-group-item"><a href="quanlykhoahoc">Quản lý khóa học</a></li>
						<li class="list-group-item"><a href="quanlythongbao">Quản lý thông báo</a></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="titleInfo title">Danh sách học viên</div>
				<br>
				<div class="khoangcach">
					<br> <br>
				</div>
				<div>
					<c:if test="${thongbao eq 0}">
					  	<p id="announce2">Cập nhật link bài giảng không thành công!</p>
					</c:if>
				</div>
				<!-- connect databse -->
				<sql:setDataSource var="data"
				driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/dbquanlyttth" user = "root"  password = "12345"/>

				<%-- kiểm tra có đúng giáo viên hay không --%>
				
				<form action="xemdanhsachlop?iddslh=${iddslh}" method="post">
						<div class="col-sm-2 col-xs-12">
							<span><strong>Link Bài Giảng:</strong></span>
						</div>
						<div class="col-sm-6 col-xs-12 text-center">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon"><i class="fa fa-link" aria-hidden="true"></i></span>
								<input type="text" class="form-control content_input" placeholder=" Nhập link bài giảng" 
								name="link" aria-describedby="basic-addon" required>
							</div>
						</div>
						<div class="col-sm-2 col-xs-12 text-center">
							<sql:query dataSource="${data}" var="result1">
         						select Link from class where IDClass=?;
         						<sql:param value="${iddslh}" />	
							</sql:query>
							<c:forEach var="row1" items="${result1.rows}">
	         						<a href="${row1.Link}" target="_blank">Link liên kết</a>
	         					</c:forEach>
						</div>
						<div class="col-sm-2 col-xs-12 text-center">
								<input class="btn_dslop btn btn-warning" type="submit" value="SUBMIT">
							
						</div>
				</form>
				<br>
				<div class="khoangcach">
					<br> <br>
				</div>
				<div class="table-responsive">
					<table id="table" class="table table-hover">
						<thead>
							<tr>
								<th scope="col">STT</th>
								<th scope="col">Name</th>
								<th scope="col">Age</th>
								<th scope="col">Sex</th>
								<th scope="col">Email</th>
								<th scope="col">Phone</th>
								<th scope="col">Address</th>
							</tr>
						</thead>
						<tbody>
							<sql:query dataSource="${data}" var="result">
         						call spGetStudent(?);
         						<sql:param value="${iddslh}" />
							</sql:query>
							<c:set value="0" var="counter" scope="request"></c:set>
							<c:forEach var="row" items="${result.rows}">
								<tr>
									<c:set value="${counter+1 }" var="counter" scope="request"></c:set>
									<td>${counter}</td>
									<td>${row.Name}</td>
									<td>${row.Age}</td>
									<c:if test="${row.Sex==0}">
										<td>Nữ</td>
									</c:if>
									<c:if test="${row.Sex==1}">
										<td>Nam</td>
									</c:if>
									<td>${row.Email}</td>
									<td>0${row.Phone}</td>
									<td>${row.Address}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
					<hr>
					<a href="danhsachlop?iddslh=${iddslh}"><button class="center-block btn btn-success">Xuất Danh Sách</button></a>
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