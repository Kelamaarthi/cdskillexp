<%@page import="com.klef.jfsd.springboot.model.Faculty"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<%
Faculty faculty =(Faculty)session.getAttribute("faculty");
if(faculty==null)
{
	response.sendRedirect("login?message=sessionExpired");
    return;
}
%>
<html>
   <head>
      <meta charset="utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <meta name="keywords" content="" />
      <meta name="description" content="" />
      <meta name="author" content="" />
      <link rel="shortcut icon" href="resources/img/cms.jpg" type="">
      <title>Faculty</title>
      <link rel="stylesheet" type="text/css" href="resources/css/facultybootstrap.css" />
      <link href="resources/css/faculty.css" rel="stylesheet" />
   </head>
   <body>
      <div class="hero_area">
         <header class="header_section">
            <div class="container">
               <nav class="navbar navbar-expand-lg custom_nav-container ">
                  <a class="navbar-brand" href="index.html"><img width="160" src="resources/img/bg.png" alt="#" /></a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class=""> </span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                     <ul class="navbar-nav">
                        <li class="nav-item">
                           <a class="nav-link" href="facultyhome">Home</a>
                        </li>
                       <li class="nav-item dropdown">
                           <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"> <span class="nav-label">View <span class="caret"></span></a>
                           <ul class="dropdown-menu">
                              <li><a href="viewstudentsf">Students</a></li>
                           </ul>
                        </li>
                        <li class="nav-item dropdown">
                           <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"> <span class="nav-label">Assignment <span class="caret"></span></a>
                           <ul class="dropdown-menu">
                              <li><a href="addassignment">ADD</a></li>
                              <li><a href="viewassignment">View</a></li>
                              <li><a href="viewsubmission">View submissions</a></li>
                           </ul>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" href="#">Contact</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" href="login">logout</a>
                        </li>
                     </ul>
                  </div>
               </nav>
            </div>
         </header>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
      
   </body>
</html>