<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<fmt:requestEncoding value="UTF-8" />

		<!-- connect databse -->
		<sql:setDataSource var="data"
			driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/dbquanlyttth" user = "root"  password = "12345"/>
		<sql:query dataSource="${data}" var="result">
         		select * from course where IDCourse=?;
         		<sql:param value="${idkhct}" />
		</sql:query>
		
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- khai báo các thư viện-->
	<c:forEach var="row" items="${result.rows}">
		<title>${row.NameCourse}</title>
	</c:forEach>

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
</head>
<body id="myPage">
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
					String stringidkhct = request.getParameter("idkhct");
					int idkhct;
					try {
						idkhct = Integer.parseInt(stringidkhct);
						request.getSession().setAttribute("idkhct", idkhct);
					} catch (Exception ex) {
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
					}
				%>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<!--Đường dẫn-->
	<div class="container-fluid hidden-xs">
		<ol class="breadcrumb">
			<li><a href="trangchu">Trang chủ</a></li>
			<li><a href="trangkhoahoc">Danh sách khóa học</a></li>
			<li><a href="khoahocchitiet?idkhct=${idkhct}">
				<c:forEach var="row" items="${result.rows}">${row.NameCourse}</c:forEach></a>
			</li>
		</ol>
	</div>
	<!--Content-->
	<div class="container-fluid row">
		<c:forEach var="row" items="${result.rows}">
			${row.Content_Course}
		</c:forEach>
	</div>

	<sql:query dataSource="${data}" var="result">
         		select * from quanlykhoahoc where IDCourse=?;
         		<sql:param value="${idkhct}" />
	</sql:query>

	<!-- Lớp -->
	<div class="row">
		<div class="col-md-9">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Giảng viên</th>
							<th scope="col">Thời gian</th>
							<th scope="col">Ngày khai giảng</th>
							<th scope="col">Số lượng</th>
							<th scope="col">Học phí</th>
							<th scope="col">Đăng ký</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${result.rows}">
							<tr>
								<td>${row.Name}</td>
								<td>${row.TimeStudy}</td>
								<td>${row.Start}</td>
								<td>${row.Limited}</td>
								<td>${row.Fee}</td>
								<td>
									<sql:query dataSource="${data}" var="result1">
	         								SELECT count(*) as soluong from user_class where IDClass=?;
	         								<sql:param value="${row.IDClass}" />
									</sql:query>
									<c:forEach var="row1" items="${result1.rows}">
										<c:if test="${row1.soluong<row.Limited}">
											<a href="muakhoahoc?idlh=${row.IDClass}"> 
												<input class="btn btn-info" type="button" value="Ghi danh">
											</a>
										</c:if>
										<c:if test="${row1.soluong>=row.Limited}"> 
												<input class="btn btn-warning" type="button" value="Hết chỗ">
										</c:if>										
									</c:forEach>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>
	<br>
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