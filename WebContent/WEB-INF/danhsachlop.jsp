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
		} else {
			request.getRequestDispatcher("/WEB-INF/trangchu.jsp").forward(request, response);
		}
	%>
	<div class="container">
		<img class="img-responsive logo" src="image/customLogo.png" alt="logo"
			title="Trung Tâm Tin Học Hoài Ân">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<br>
			<div class="titleInfo title">Danh sách học viên</div>
			<!-- connect databse -->
			<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/dbquanlyttth" user="root"
				password="12345" />
			<div class="khoangcach">
				<br> <br>
			</div>
			<div class="row">
				<sql:query dataSource="${data}" var="result">
         			select * from spgetcourseadmin where IDClass=?;
         			<sql:param value="${iddslh}" />
				</sql:query>
				<c:forEach var="row" items="${result.rows}">
					<div class="col-sm-6 col-xs-12">
						<h4><strong>Tên lớp: </strong> ${row.NameCourse}</h4>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h4><strong>Thời gian: </strong> ${row.TimeStudy}</h4>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h4><strong>Ngày khai giảng: </strong> ${row.Start}</h4>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h4><strong>Giáo viên: </strong> ${row.Name}</h4>
					</div>
					
					
						
				</c:forEach>
			</div>
			<div class="table-responsive">
						<a href="javascript:window.print()" target="_blank"><i style="font-size: 30px;"
				class="fa fa-print pull-right" aria-hidden="true"></i></a>
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
		</div>
	</div>
	<!-- Contact-->
	<div id="contact" class="container-fluid">
		<h2 class="text-center content">LIÊN HỆ</h2>
		<div class="row">
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
	</div>
</body>
</html>