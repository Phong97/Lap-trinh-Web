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
<title>Đăng ký khóa học</title>
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
					String stringidlh = request.getParameter("idlh");
					int idlh;
					try {
						idlh = Integer.parseInt(stringidlh);
						request.getSession().setAttribute("idlh", idlh);
					} catch (Exception ex) {
						response.sendRedirect("trangchu.jsp");
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
				%><script language="javascript">
					alert("Vui lòng đăng nhập tài khoản!")
					window.location = "trangchu";
				</script>
				<%
					}
				%>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<!-- connect databse -->
			<sql:setDataSource var="data"
				driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/dbquanlyttth" user = "root"  password = "12345"/>
				
			<sql:query dataSource="${data}" var="result">
         		call spGetMuaKhoaHoc(?);
         		<sql:param value="${idlh}" />
			</sql:query>
			
			<sql:query dataSource="${data}" var="result1">
         		select * from course where IDCourse=?;
         		<sql:param value="${idkhct}" />
			</sql:query>
				
	<!--Đường dẫn-->
	<div class="container-fluid hidden-xs">
		<ol class="breadcrumb">
			<li><a href="trangchu">Trang chủ</a></li>
			<li><a href="trangkhoahoc">Danh sách khóa học</a></li>
			<li><a href="khoahocchitiet?idkhct=${idkhct}">
				<c:forEach var="row" items="${result.rows}">${row.NameCourse}</c:forEach>
			</a></li>
			<li><a href="muakhoahoc?idlh=${idlh}">Đăng ký khóa học</a></li>

		</ol>
	</div>
	<!--Content-->
	<div class="container-fluid text-center">
		<img class="img-responsive" src="image/banner-dang-ky.jpg" alt="Ảnh đại diện"/> 
		<br>
		<br>
		<div class="row jumbotron">
			<div class="inf_course">
				<h3 class="title">Thông Tin Khóa Học</h3>
				<div class="khoangcach">
					<br> <br>
				</div>
				<br/>
				<div>
					<c:if test="${thongbao eq 0}">
					  	<p id="announce2">Tài khoản không đủ tiền để ghi danh!</p>
					</c:if>
					<c:if test="${thongbao eq 3}">
					  	<p id="announce2">Ghi danh không thành công! Vui lòng thử lại</p>
					</c:if>
				</div>
				<form action="muakhoahoc" method="post">
					<c:forEach var="row" items="${result.rows}">
					<div class="col-sm-4">
							<span><strong>Tên lớp học:</strong></span>
						</div>
						<div class="col-sm-8 input-group">
							<input type="text" class="form-control content_input"
								value="${row.NameCourse}" readonly>
						</div>
						<div class="khoangcach">
							<br>
						</div>
						<div class="col-sm-4">
							<span><strong>Giảng viên:</strong></span>
						</div>
						<div class="col-sm-8 input-group">
							<input type="text" class="form-control content_input"
								value="${row.Name}" readonly>
						</div>
						<div class="khoangcach">
							<br>
						</div>
						<div class="col-sm-4">
							<span><strong>Lịch học:</strong></span>
						</div>
						<div class="col-sm-8 input-group">
							<input type="text" class="form-control content_input"
								value="${row.TimeStudy}" readonly>
						</div>
						<div class="khoangcach">
							<br>
						</div>
						<div class="col-sm-4">
							<span><strong>Ngày khai giảng:</strong></span>
						</div>
						<div class="col-sm-8 input-group">
							<input type="text" class="form-control content_input"
								value="${row.Start}" readonly>
						</div>
						<div class="khoangcach">
							<br>
						</div>
	
						<div class="col-sm-4">
							<span><strong>Học phí:</strong></span>
						</div>
						<div class="col-sm-8 input-group">
							<input type="text" class="form-control content_input" name="fee"
								value="${row.Fee}" readonly>
						</div>
						<div class="khoangcach">
							<br>
						</div>
					</c:forEach>
					<sql:query dataSource="${data}" var="result">
	         						select spGetMyAccount(?) as MyAccount;
	         						<sql:param value="${username}" />
					</sql:query>
					<c:forEach var="row" items="${result.rows}">
						<div class="col-sm-4">
							<span><strong>Tài khoản:</strong></span>
						</div>
						<div class="col-sm-8 input-group">
							<input type="text" class="form-control content_input" name="myaccount"
								value="${row.MyAccount}" readonly>
						</div>
						<br>
					</c:forEach>
						<input id="muakhoahoc" class="btn btn-danger" type="submit" value="Xác nhận đăng ký">
				</form>
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