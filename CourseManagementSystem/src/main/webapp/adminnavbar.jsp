<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<%
Admin admin =(Admin)session.getAttribute("admin");
if(admin==null)
{
	response.sendRedirect("login?message=sessionExpired");
    return;
}
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">
	<title>Admin</title>
	<link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/main.css">

</head>
<body>
	<div class="top-header-area" id="sticker">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12 text-center">
					<div class="main-menu-wrap">
						<nav class="main-menu">
							<ul>
								<li><a href="adminhome">Home</a></li>
								<li><a href="#">Add</a>
									<ul class="sub-menu">
										<li><a href="addfaculty">Faculty</a></li>
										<li><a href="addstudent">Student</a></li>
										<li><a href="addcourse">Course</a></li>
									</ul>
								</li>
								<li><a href="#">View</a>
									<ul class="sub-menu">
										<li><a href="viewfaculty">Faculty</a></li>
										<li><a href="viewstudents">Student</a></li>
										<li><a href="viewcourses">Course</a></li>
									</ul>
								</li>
								<li><a href="coursemapping">Course Mapping</a></li>
								<li><a href="updatecourse">Update Course</a></li>
								<li><a href="feedbacks">Feedbacks</a></li>
								<li><a href="login">logout</a></li>
								<li>
									<div class="header-icons">
										<a class="shopping-cart" href="#"><i class="fas fa-shopping-cart"></i></a>
									</div>
								</li>
							</ul>
						</nav>
						<a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
						<div class="mobile-menu"></div>
						<!-- menu end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end header -->

	<!-- search area -->
	<div class="search-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<span class="close-btn"><i class="fas fa-window-close"></i></span>
					<div class="search-bar">
						<div class="search-bar-tablecell">
							<h3>Search For:</h3>
							<input type="text" placeholder="Keywords">
							<button type="submit">Search <i class="fas fa-search"></i></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="assets/js/text.js"></script>
	<script src="resources/js/main.js"></script>
</body>
</html>