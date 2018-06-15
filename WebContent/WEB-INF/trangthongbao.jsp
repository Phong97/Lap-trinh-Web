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
<title>Thông Báo</title>
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
<!-- Chuyển trang -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->
<!-- JS tạo nút bấm di chuyển trang start -->
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<!-- JS tạo nút bấm di chuyển trang end -->
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
					//get username
					String username = (String) session.getAttribute("username");
					if (username != null) {
				%>
				<div class="navbar-right navbar-log text-center">
					<a href="trangcanhan">
						<button class="btn btn-primary">
							<span class="glyphicon glyphicon-folder-open"></span> Hồ sơ của
							bạn
						</button>
					</a> <a href="logoutuser">
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
			<li><a href="thongbao">Thông báo trung tâm tin học</a></li>
		</ol>
	</div>
	<!-- connect databse -->
	<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/dbquanlyttth" user="root" password="12345" />

	<sql:query dataSource="${data}" var="result">
         		select * from announce order by IDAnnounce desc;
	</sql:query>
	<!--Body -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12 col-sm-6">
				<c:forEach var="row" items="${result.rows}" begin="0" end="0"
					step="1">
					<div class="panel panel-default text-center">
						<div>
							<a href="thongbaochitiet?idthbct=${row.IDAnnounce}">
							 <img class="img-responsive" src="image/${row.Images}"
								style="width: 600px; height: 350px;" alt="Ảnh thông báo"/>
								<div class="panel-footer text-center">
									<h3 class="title">${row.Title}</h3>
									<h5>${row.Description}...<a href="thongbaochitiet?idthbct=${row.IDAnnounce}"> Xem tiếp</a>
									</h5>
									<span class="glyphicon glyphicon-time"> ${row.Time}</span>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-xs-12 col-sm-6">
				<c:forEach var="row" items="${result.rows}" begin="1" end="4"
					step="1">
					<div class="col-sm-6 col-xs-12 col-md-6">
						<div class="panel panel-default text-center">
							<div>
								<a href="thongbaochitiet?idthbct=${row.IDAnnounce}"> <img
									class="img-responsive" src="image/${row.Images}"
									style="width: 300px; height: 170px;" alt="Ảnh đại diện"/>
									<div class="panel-footer text-center">
										<h5>
											<strong>${row.Title}</strong>
										</h5>
									</div>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<c:set var="counter" value="0" scope="request"></c:set>
		<c:forEach var="row" items="${result.rows}">
			<c:set var="counter" value="${counter+1}"></c:set>
			<div class="contentPage">
				<div class="khoang-cach line"></div>
				<!--Chi tiết-->
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12 text-center">
						<a href="thongbaochitiet?idthbct=${row.IDAnnounce}"> <img
							class="img-responsive" src="image/${row.Images}"
							style="width: 300px; height: 200px;" alt="Ảnh đại diện"></a>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<a href="thongbaochitiet?idthbct=${row.IDAnnounce}">
							<h3 class="title">${row.Title}</h3>
						</a> <span class="glyphicon glyphicon-time"> ${row.Time}</span>
						<p>${row.Description}...<a
								href="thongbaochitiet?idthbct=${row.IDAnnounce}"> Xem tiếp</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>

		<!--chuyển trang-->
		<script type="text/javascript">
			$(function() {
				var pageSize = 4; // Hiển thị 4 thông báo trên 1 trang
				showPage = function(page) {
					$(".contentPage").hide();
					$(".contentPage").each(function(n) {
						if (n >= pageSize * (page - 1) && n < pageSize * page)
							$(this).show();
					});
				}
				showPage(1);
				///** Cần truyền giá trị vào đây **///
				var totalRows = ${counter}; // Tổng số sản phẩm hiển thị
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
		<h3 class="text-center content">Hãy liên hệ với chúng tôi, chúng
			tôi sẽ trả lời trong vòng 8 giờ .</h3>
		<div class="row slideanim">
			<div class="col-sm-2"></div>
			<div class="col-sm-5">
				<p class="contact_inf">
					<span class="glyphicon glyphicon-map-marker logo2"></span> Số 1, Võ
					Văn Ngân, Q.Thủ Đức, Hồ Chí Minh, Việt Nam.
				</p>
				<p class="contact_inf">
					<span class="glyphicon glyphicon-phone logo2"></span> 01665293553
				</p>
				<p class="contact_inf">
					<span class="glyphicon glyphicon-envelope logo2"></span>
					nctrung22041997@gmail.com
				</p>
			</div>
			<div class="col-sm-5">
				<p class="contact_inf">
					<span class="logo2"><i class="fa fa-facebook"
						aria-hidden="true"></i></span><a
						href="https://www.facebook.com/trungncdev"> Facebook (Nguyễn
						Chí Trung)</a>
				</p>
				<p class="contact_inf">
					<span class="logo2"><i class="fa fa-google-plus"
						aria-hidden="true"></i></span><a
						href="https://www.facebook.com/conhoyolo"> Google+ (Lê Thị
						Thảo Nhi)</a>
				</p>
				<p class="contact_inf">
					<span class="logo2"><i class="fa fa-twitter"
						aria-hidden="true"></i></span><a
						href="https://www.facebook.com/boyvnpro1997"> Twitter (Hồ Văn
						Phong)</a>
				</p>
			</div>
		</div>
		<h5 class="text-center">Copyright @ Trung tâm tin học Hoài Ân</h5>
	</div>
</body>
</html>