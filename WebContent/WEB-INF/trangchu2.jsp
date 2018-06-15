<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	  <!-- khai báo các thư viện-->
	  <title>Trung Tâm Tin Học Hoài Ân</title>
	  <meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	  <link rel="stylesheet" type="text/css" href="css/style.css">
	  <script src="lib/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
     <%@ page import = "java.io.*,java.util.*" %>
     <% 
     	//get username
     	String username = (String) session.getAttribute("username");
     	if (username != null)
     	{
     %>
				<div class="navbar-right navbar-log text-center">
					<a href="trangcanhan"><button class="btn btn-primary"><span class="glyphicon glyphicon-folder-open"></span> Hồ sơ của bạn</button></a> 
					<a href="logoutuser"><button class="btn btn-primary"><span class="glyphicon glyphicon-log-out"></span> Đăng Xuất</button></a> 
				</div>	
	<% }
     	else{
     		request.getRequestDispatcher("/WEB-INF/trangchu.jsp").forward(request, response);
     		
     	}
    %>	
			</div>	
		</div>
	 </nav>
	 
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