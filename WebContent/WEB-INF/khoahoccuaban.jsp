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
<title>Khóa Học Của Bạn</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Nhúng style.css do ta tạo vào trang web -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- Khai báo các thư viện js-->
<script src="lib/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Nhúng validation.js do ta tạo vào trang web -->
<script type="text/javascript" src="js/validation.js"></script>

<!-- JS tạo nút bấm di chuyển trang start -->
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript">
</script>
<!-- JS tạo nút bấm di chuyển trang end -->

</head>
<body id="myPage">

	<!-- connect databse -->
	<sql:setDataSource var="data"
				driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/dbquanlyttth" user = "root"  password = "12345"/>
				
	<!-- danh mục-->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
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
						<li id="list-one" class="list-group-item"><a href="khoahoccuaban">Khóa học của bạn</a></li>
						<li class="list-group-item"><a href="khoahocdaday">Khóa học đã dạy</a></li>
						<li class="list-group-item"><a href="taikhoancuaban">Tài khoản của bạn</a></li>
						<%
							int admin = (int) session.getAttribute("admin");
							if (admin == 1) {
						%>
						<sql:query dataSource="${data}" var="result">
         					select * from spgetcourseadmin;
						</sql:query>
						
						<li class="list-group-item"><a href="quanlyuser">Quản lý User</a></li>
						<li class="list-group-item"><a href="quanlykhoahoc">Quản lý khóa học</a></li>
						<li class="list-group-item"><a href="quanlythongbao">Quản lý thông báo</a></li>
						<%
							}
							else{%>
								<sql:query dataSource="${data}" var="result">
         							select * from spgetcourseuser where IDhocVien=?;
         							<sql:param value="${username}" />
								</sql:query>
						<%}
						%>
					</ul>
				</div>
			</div>
			<div class="col-sm-9">
				<!-- container-fluid ( Section) -->
				<div class="text-center">
					<div class="titleInfo title">KHÓA HỌC CỦA BẠN</div>
					<div class="khoangcach">
						<br>
					</div>
					
					<div>
						<c:if test="${thongbao eq 2}">
						  	<p id="announce2">Lớp học đã được đăng ký trước đó, hiện bạn đang theo học lớp học này!</p>
						</c:if>
						<c:if test="${thongbao eq 1}">
						  	<p id="announce2">Bạn đã đăng ký thành công! Chào mừng bạn đến với lớp học</p>
						</c:if>
					</div>
					<br/>
					<div class="row">
					<c:set var="counter" value="0" scope="request"></c:set>
						<c:forEach var="row" items="${result.rows}">
						<c:set var="counter" value="${counter+1}"></c:set>
						<div class="contentPage">
						<div class="col-sm-4 col-xs-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="title">${row.NameCourse}</h3>
								</div>
								<div class="panel-body">
									<img class="img-responsive" src="image/${row.Images}" style="width:260px; height:150px;" alt="Ảnh khóa học"/>
								</div>
								<div>
									<div class="panel-footer">
											<p><strong>${row.Name}</strong></p>
											<p>${row.TimeStudy}</p>
											<p>Khai giảng: ${row.Start}</p>
										<a href="${row.Link}" target="_blank"><button class="btn btn-lg">Xem chi tiết</button></a>
									</div>
								</div>
							</div>
						</div>
						</div>
					</c:forEach>	
						<br>
					</div>
				</div>
			</div>
		</div>
						<!--chuyển trang-->
		<script type="text/javascript">
				$(function() {
					var pageSize = 6; // Hiển thị 8 khóa học trên 1 trang
					showPage = function(page) {
						$(".contentPage").hide();
						$(".contentPage").each(
								function(n) {
									if (n >= pageSize * (page - 1)
											&& n < pageSize * page)
										$(this).show();
								});
					}
					showPage(1);
					///** Cần truyền giá trị vào đây **///
					var totalRows = ${counter}; // Tổng số bình luận hiển thị
					var btnPage = 10; // Số nút bấm hiển thị di chuyển trang
					var iTotalPages = Math.ceil(totalRows / pageSize);

					var obj = $('#pagination').twbsPagination({
						totalPages : iTotalPages,
						visiblePages : btnPage,
						onPageClick : function(event, page) {
							console.info(page);
							showPage(page);
						}
					});
					console.info(obj.data());
				});
			</script>

		<!--Số trang-->
		<nav class="col-md-12 col-sm-12 col-xs-12" id="sotrang">
			<ul id="pagination">
			</ul>
		</nav>
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