<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- khai báo các thư viện-->
<title>Diễn đàn</title>
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
	type="text/javascript">
</script>
<!-- JS tạo nút bấm di chuyển trang end -->
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
			<li><a href="diendan">Diễn đàn</a></li>
		</ol>
	</div>
	<!--Body -->
	<div class="postlist container">
		<ol class="posts">
			<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/dbquanlyttth" user="root"
				password="12345" />
			<sql:query dataSource="${data}" var="result">
         	select * from forum order by IDComment desc;
			</sql:query>
			<c:set var="counter" value="0" scope="request"></c:set>
			<c:forEach var="row" items="${result.rows}">
				<c:set var="counter" value="${counter+1}"></c:set>
				<div class="contentPage">
					<li class="postbit postbitim postcontainer">
						<div class="posthead">
							<span class="date"> #${counter}</span>
						</div>
						<div class="firstpostinfo author">

							<sql:query dataSource="${data}" var="result1">
						select * from user_info, users where IDUser=? and IDUser=UserName;
						<sql:param value="${row.IDUser}" />
							</sql:query>
							<c:forEach var="row1" items="${result1.rows}">
								<div class="contact">
									<img class="img-responsive" src="image/${row1.Images}"
										style="width: 100px; height: 100px;" alt="Ảnh đại diện" />
								</div>
								<div class="username col-md-7 col-xs-12">
									<div>
										<span><strong>${row1.Name}</strong></span>
									</div>
									<div>
										<c:if test="${row1.Admin!=1}">
											<c:if test="${row.IDUser=='noname'}">
												<span>Guest</span>
											</c:if>
											<c:if test="${row.IDUser!='noname'}">
												<span>Thành viên</span>
											</c:if>
										</c:if>
										<c:if test="${row1.Admin==1}">
											<span>Quản trị viên</span>
										</c:if>
									</div>
									<div>
										<span class="glyphicon glyphicon-time"> ${row.Time}</span>
									</div>
								</div>
								<c:if test="${admin==1}">
									<div class="button-del col-md-5 col-xs-12 text-right">
										<a   id="deletecomment"
											href="deletecomment?id=${row.IDComment}&iduser=${row.IDUser}"><button
												type="button" class="btn btn-default">
												<span class="glyphicon glyphicon-remove"></span> Delete
											</button></a>
									</div>
								</c:if>
								<c:if test="${admin!=1}">
									<c:if test="${row.IDUser== username}">
										<div class="button-del col-md-5 col-xs-12 text-right">
											<a id="deletecomment" href="deletecomment?id=${row.IDComment}&iduser=${row.IDUser}">
												<button type="button" class="btn btn-default">
													<span class="glyphicon glyphicon-remove"></span> Delete
												</button>
											</a>
										</div>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
						<div class="firstpostbody">
							<article class="articleBody" style="margin: 0; padding: 0;">
								<blockquote class="postcontent restore">
									${row.Comment}</blockquote>
							</article>
							<p>
								<a href="#comment"><button type="button"
										class="btn btn-success">Bình luận</button></a>
							</p>
						</div>

					</li>
					<hr />
				</div>
			</c:forEach>
		</ol>
		<!--chuyển trang-->
		<script type="text/javascript">
			$(function() {
				var pageSize = 5; // Hiển thị 5 bình luận trên 1 trang
				showPage = function(page) {
					$(".contentPage").hide();
					$(".contentPage").each(function(n) {
						if (n >= pageSize * (page - 1) && n < pageSize * page)
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
	<hr>

	<!--Comment-->
	<div class="thread_info block container" id="comment">
		<h4 class="threadinfohead blockhead">Comment</h4>
		<label for="comment">Trả lời nhanh:</label>
		<form action="diendan" method="post">
			<div class="container">
				<div class="form-comt col-md-7 col-xs-12">
					<textarea id="commentcontext" class="form-control" rows="4" name="comment" required></textarea>
				</div>
				<br>
				<button id="commentsubmit" type="submit" class="btn btn-primary col-md-1 col-xs-3">
					<span class="glyphicon glyphicon-comment">Comment</span>
				</button>
			</div>
		</form>
	</div>
	<br>
	<br>
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