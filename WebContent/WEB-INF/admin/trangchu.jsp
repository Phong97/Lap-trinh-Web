<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!-- Xóa bỏ các thuộc tính lưu trong sesion -->
<% session.invalidate();%>

<!DOCTYPE html>
<html lang="en">
	<head>
	  <title>Trung Tâm Tin Học Hoài Ân</title>
	  <meta charset="utf-8">
	  <!-- Khai báo các thư viện css-->
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
	<head>
	<body id="myPage">
	<!-- Menu-->
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
					<li><a href="trangchu_admin">TRANG CHỦ</a></li>
					<li><a href="trangkhoahoc">KHÓA HỌC</a></li>
					<li><a href="tranglichhoc.jsp">LỊCH HỌC</a></li>
					<li><a href="trangthongbao">THÔNG BÁO</a></li>
					<li><a href="diendan">DIỄN ĐÀN</a></li>
				</ul>
				<div class="navbar-right navbar-log text-center">
					<button class="formlogin btn btn-primary"><span class="glyphicon glyphicon-log-in"></span> Đăng Nhập</button>
					<button class="formreg btn btn-primary" ><span class="glyphicon glyphicon-user"></span> Đăng Ký</button>
				</div>		
			</div>	
		</div>
	 </nav>

	 <!--Form đăng nhập-->
		<div id="id01" class="modal">
		  <form action="trangchu_admin" name="Login" class="modal-content animate" method="post">
			<div class="modal-header">
			  <span class="close" title="Close">&times;</span>
			  <p><strong style="font-size:20px">Đăng nhập để học tập</strong></p>
			</div>
			<div class="modal-body">
			<!-- Nơi display thông báo lỗi -->
			  <div>
			  	<p id="announce"></p>		  	
			  	<c:if test="${thongbao eq 2 }">
			  		<p id="announce2">Tên đăng nhập hoặc mật khẩu không đúng!</p>
					<script type="text/javascript">
						$(document).ready(function(){
								   $("#id02").css("display","none");
								   $("#id01").css("display","block");
						});
					</script>
				</c:if>
				<c:if test="${thongbao eq 1 }">
			  		<p id="announce2">Đăng ký thành công, vui lòng đăng nhập!</p>
					<script type="text/javascript">
						$(document).ready(function(){
								   $("#id02").css("display","none");
								   $("#id01").css("display","block");
						});
					</script>
				</c:if>
			  </div>
				
			  <p><b>Tên đăng nhập:</b></p>
			  <input id="username_login" type="text" placeholder="Nhập tên đăng nhập" name="username" required><br>

			  <p><b>Mật khẩu:</b></p>
			  <input id="password_login" type="password" placeholder="Nhập mật khẩu" name="pw-login" required>

			  <div class="text-center">
				  <button class="btn-login" type="submit">  Đăng Nhập</button>
			  </div>
			</div>
			<div class="modal-footer">
				<div class="text-center">
					<p>Nếu chưa có tài khoản hãy</p>
					<button class="formreg btn-reg" type="submit">  Đăng Ký</button>
			  </div>
			</div>
		  </form>
		</div>
		<!--Form đăng ký-->
		<div id="id02" class="modal">
		  <form action="signupuser" class="modal-content animate" method="post">
			<div class="modal-header">
			  <span class="close" title="Close">&times;</span>
			  <p><strong style="font-size:20px">Đăng ký và bắt đầu học</strong></p>
			</div>
			<div class="modal-body">
				<!-- Nơi display thông báo lỗi -->
			  <div>
			  	<p id="announce1"></p>
			  	<c:if test="${thongbao eq 0 }">
			  		<p id="announce2">Tên đăng nhập đã tồn tại.<br/> Mời bạn chọn tên đăng nhập khác!</p>
					<script type="text/javascript">
						$(document).ready(function(){
								   $("#id01").css("display","none");
								   $("#id02").css("display","block");
						});
					</script>
				</c:if>
				<c:if test="${thongbao eq 3}">
			  		<p id="announce2">Đăng ký không thành công.<br/>Mật khẩu phải từ 8-20 kí tự hoặc tên đăng nhập từ 5-30 kí tự!</p>
					<script type="text/javascript">
						$(document).ready(function(){
								   $("#id01").css("display","none");
								   $("#id02").css("display","block");
						});
					</script>
				</c:if>
			  </div>
			  <input id="username_reg" type="text" placeholder="Chọn tên đăng nhập" name="username-reg" required>
			  <input id="password_reg" type="password" placeholder="Nhập mật khẩu" name="pw-reg" required>
			  <input id="password_cofirm" type="password" placeholder="Nhập lại mật khẩu" name="pw-reg-ago" required>
			  <div class="text-center">
				  <button class="btn btn-login" type="submit">  Đăng Ký</button>
			  </div>
			</div>
			<div class="modal-footer">
				<div class="text-center">
					<p>Nếu đã có tài khoản!</p>
					<button  class="formlogin btn btn-reg" type="submit">  Đăng Nhập</button>
			  </div>
			</div>
		  </form>
		</div>
	 <!--Header-->
	 <div  class="container-fluid">
		<img class="img-responsive logo" src="image/customLogo.png" alt="logo" title="Trung Tâm Tin Học Hoài Ân">
	 </div>
	<div class="container-fluid text-right">
		<div class="form-inline">
			<input id="search" class="btn_search input-text form-control" type="text" placeholder="Search" aria-label="Search" required>
			<button id="btnsearch" class="btn btn-danger btn_search"><i class="fa fa-search" aria-hidden="true"></i> Search</button>
		</div>
	</div>
	<!-- Slide  -->
	<div class="container-fluid text-center">
	  <div id="myCarousel" class="carousel slide" data-ride="carousel">
	   
		<!-- Phần các chỉ số  -->
		<ol class="carousel-indicators">
		  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		  <li data-target="#myCarousel" data-slide-to="1"></li>
		  <li data-target="#myCarousel" data-slide-to="2"></li>
		  <li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>

		<!-- Phần bao các slides -->
		<div class="carousel-inner" role="listbox">
		  <div class="item active">
			<img src="image/slide1.jpg" alt="Slide 1">
		  </div>

		  <div class="item">
			<img src="image/slide2.jpg" alt="Slide 2">
		  </div>
		
		  <div class="item">
			<img src="image/slide3.jpg" alt="Slide 3">
		  </div>

		  <div class="item">
			<img src="image/slide4.jpg" alt="Slide 4">
		  </div>
		</div>

		<!-- Control điều khiển bên trái và bên phải -->
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		  <span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		  <span class="sr-only">Next</span>
		</a>
	  </div>
	  <h1 class="title">Cảm ơn bạn đã tin tưởng và đồng hành cùng chúng tôi</h1>
	</div>
	<!-- container-fluid (About Section) -->
	<div id="about" class="container-fluid font-family">
	  <div class="row">
		<div class="col-sm-8">
		  <h2 class="title">Giới thiệu trung tâm tin học Hoài Ân </h2><br>
		  <div>
		  	 <h4 class="content">Trung tâm chuyên dạy các môn học về lập trình với đội ngũ giảng viên chuyên nghiệp, cở sở vận chất hiện đại. </h4>
		  	 <h4 class="content">Tâm huyết của Trung tâm là nâng cao trình độ cho thế hệ trẻ, giúp mọi người hòa nhập nhanh chóng vào nhịp sống, bước tiến của một xã hội hiện đại phía trước.</h4>	
		  </div>
		</div>
		<div class="col-sm-4">
		  <span class="glyphicon glyphicon-education logo1 slideanim"></span>
		</div>
	  </div>
	</div>
	
	<div class="container-fluid font-family text-left">
	  <div class="row">
		<div class="col-sm-4">
		  <span class="glyphicon glyphicon-globe logo1 slideanim"></span>
		</div>
		<div class="col-sm-8">
		  <h2 class="title">Giá trị của trung tâm tin học Hoài Ân mang lại </h2><br>
		  <div>
		    	<h3 class="content"><strong>Sứ mệnh :</strong>
		    		<h4 class="content">Góp phần cung cấp giải pháp đào tạo hiện đại, hiệu quả trong môi trường giáo dục chuyên nghiệp, bồi dưỡng nhân lực, phục vụ đắc lực sự nghiệp công nghiệp hoá, hiện đại hoá đất nước.</h4>
		    	</h3>
		 	    <h3 class="content"><strong>Tầm nhìn :</strong>
		 	    	<h4 class="content"> Xây dựng trung tâm Tin học thành trung tâm đào tạo có uy tín, có chất lượng hàng đầu về việc đào tạo và cấp chứng chỉ Tin học.</h4>
		 	    </h3>
		  </div>
		</div>
	  </div>
	</div>
	<!-- container-fluid ( Section) -->
	<div class="container-fluid text-center">
	<h2 class="title">KHÓA HỌC NỔI BẬT</h2>
	
	<sql:setDataSource var="data"
				driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/dbquanlyttth" user = "root"  password = "12345"/>
				<sql:query dataSource="${data}" var="result">
         		select * from course order by IDCourse desc;
				</sql:query>
	<div class="khoangcach"><br></div>
	
	<div class="row slideanim">
		<c:forEach var="row" items="${result.rows}" begin="0" end="2" step="1">
			<div class="col-sm-4 col-xs-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h1 class="title">${row.NameCourse}</h1>
					</div>
					<div class="panel-body">
						<img class="img-responsive" src="image/${row.Images}" style="width:300px; height:170px;" alt="Ảnh khóa học"/>
					</div>
					<div>
						<div class="panel-footer">
							<h4>${row.NameCourse}</h4>
							<p>${row.Fee}đ</p>
							<a href="khoahocchitiet?idkhct=${row.IDCourse}"><button class="btn btn-lg">Xem chi tiết</button></a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	<br>
	</div>

	<a href="trangkhoahoc"><button class="btn btn-all">Xem tất cả khóa học</button></a>
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