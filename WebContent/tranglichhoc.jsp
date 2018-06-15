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
	  <title>Lịch Học</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	   <!-- Nhúng style.css do ta tạo vào trang web --> 
	  <link rel="stylesheet" type="text/css" href="css/style.css">
	  <!-- Khai báo các thư viện js--> 
	  <script src="lib/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
					}
				%>		
			</div>	
		</div>
	 </nav>
	  <br><br><br>
	 <!--Đường dẫn-->
	 <div class="container-fluid hidden-xs">
	 	<ol class="breadcrumb">
	 		<li><a href="trangchu">Trang chủ</a></li>
	 		<li><a href="tranglichhoc.jsp">Lịch học</a></li>
	 	</ol>
	 </div>
	 <!-- connect databse -->
	<sql:setDataSource var="data"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/dbquanlyttth" user = "root"  password = "12345"/>
			
	<sql:query dataSource="${data}" var="result">
         		select * from announce order by IDAnnounce desc;
	</sql:query>
	 <!--Content-->
	 <div class="container-fluid">
		 <div class="col-xs-12">
			 <h3 style="color:red; text-align: justify;">Hướng dẫn học bù tại Trung tâm Tin học Hoài Ân</h3>
			<br>
			<div class="col-sm-12 col-md-12 col-xs-12" style="text-align: justify;">
				<p>Đi học đầy đủ, đúng giờ là điều kiện tiên quyết tạo nên sự hiệu quả khi học tại Trung tâm Tin học Hoài Ân. Tuy nhiên, khi các em bị bận đột xuất không thể đi học được, Trung tâm vẫn tạo mọi điều kiện để các em được học bù sớm nhất có thể và hết lòng hỗ trợ để em không bị mất bài và theo kịp được tiến độ của lớp. Các em hãy xem hướng dẫn dưới đây để nắm rõ cách học bù nhé.</p>
	
				<br>
				<div class="col-sm-8 huong-dan">
					<h4 style="color:red;"><strong>Hướng dẫn học bù</strong></h4>
					<p>Hướng dẫn học bù được thầy cô phổ biến trên lớp trong buổi khai giảng. Tuy nhiên, nếu các em cần hỗ trợ, các em hãy liên hệ Phòng Ghi danh để được hướng dẫn đầy đủ nhé.</p>
					<p><strong>Bước 1:</strong> Các em xem mình cần học bù buổi mấy, lớp nào?</p>
					<p><strong>Bước 2:</strong> Xem kỹ lịch giảng dạy (bên dưới) của các ngày 2-4-6 hoặc 3-5-7 để tìm buổi học bù phù hợp với thời gian của mình (Chú ý đến ngày cập nhật của lịch giảng dạy để tính thời gian chính xác và số phòng học tương ứng).</p>
					<p><strong>Ví dụ tham khảo:</strong></p>
					<p>Giả sử em cần học bù lớp 1, buổi 4. Ta sẽ xem thông tin trên lịch giảng dạy.</p>
					<p>Trên lịch giảng dạy các ngày 2-4-6, tính đến ngày 02.03.2017, có lớp 1 học lúc 15h30, buổi 3 ở phòng 1. Vậy, ta sẽ học bù vào buổi 4 của lớp này lúc 15h30 ngày 04.03.2017 ở phòng 1.</p>
					<p>Hoặc:</p>
					<p>Trên lịch giảng dạy các ngày 3-5-7, tính đến ngày 03.03.2017 có lớp 1 học lúc 7h30 sáng, buổi 2 ở phòng 2. Vậy, ta sẽ học bù vào buổi 4 của lớp này lúc 7h30 sáng ngày 07.03.2017 ở phòng 2.</p>
					<br>
					<h4 style="color:red;"><strong>Quy định học bù:</strong></h4>
						<p>1) Chỉ được học bù tối đa 4 buổi mỗi lớp.</p>
						<p>2) Các em xem kỹ số phòng của lớp học bù để vào đúng lớp của mình.</p>
					<br>
					<h4 style="color:red;"><strong>Lịch giảng dạy:</strong></h4>
						<ul>
							<li><a href="https://goo.gl/tkWUHE" target="_blank">Lịch giảng dạy các ngày 2,4,6</a></li>
							<li><a href="https://goo.gl/irjJJZ" target="_blank">Lịch giảng dạy các ngày 3,5,7</a></li>
						</ul>
				</div>	
				<div class="col-sm-4">
					<h4 style="color:red; text-align: center;"><strong>Thông báo mới nhất</strong></h4>
					<c:forEach var="row" items="${result.rows}" begin="0" end="1" step="1">
						<div class="col-sm-12 col-xs-12 col-md-12">
							<div class="panel panel-default text-center">
								<div>
									<a href="thongbaochitiet?idthbct=${row.IDAnnounce}"> 
										<img class="img-responsive" src="image/${row.Images}" style="width:335px; height:210px;" alt="ảnh thông báo"/>
										<div class="panel-footer text-center">
											<h5><strong>${row.Title}</strong></h5>
										</div>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- Fooder Contact -->
	<div id="contact" class="container-fluid">
		<div class="text-center">
			<a href="#myPage" title="To Top">
				<span class="glyphicon glyphicon-chevron-up"></span>
			</a>
		</div>
		<h2 class="text-center content">LIÊN HỆ</h2>
		<h3 class="text-center content">Hãy liên hệ với chúng tôi, chúng tôi sẽ trả lời trong vòng 8 giờ .</h3>
		<div class="row slideanim">
			<div class="col-sm-2" ></div>	
			<div class="col-sm-5">
				<p class="contact_inf"><span class="glyphicon glyphicon-map-marker logo2"></span> Số 1, Võ Văn Ngân, Q.Thủ Đức, Hồ Chí Minh, Việt Nam.</p>
				<p class="contact_inf"><span class="glyphicon glyphicon-phone logo2"></span> 01665293553</p>
				<p class="contact_inf"><span class="glyphicon glyphicon-envelope logo2"></span> nctrung22041997@gmail.com</p>
			</div>
			<div class="col-sm-5"> 
				<p class="contact_inf"><span  class="logo2"><i class="fa fa-facebook" aria-hidden="true"></i></span><a href="https://www.facebook.com/trungncdev"> Facebook (Nguyễn Chí Trung)</a></p>
				<p class="contact_inf"><span  class="logo2"><i class="fa fa-google-plus" aria-hidden="true"></i></span><a href="https://www.facebook.com/conhoyolo"> Google+ (Lê Thị Thảo Nhi)</a></p>
				<p class="contact_inf"><span  class="logo2"><i class="fa fa-twitter" aria-hidden="true"></i></span><a href="https://www.facebook.com/boyvnpro1997"> Twitter (Hồ Văn Phong)</a></p>
			</div>
		</div>
		<h5 class="text-center">Copyright @ Trung tâm tin học Hoài Ân</h5>
	</div>
	</body>
	</html>