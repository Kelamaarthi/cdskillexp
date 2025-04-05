<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<%
Student student =(Student)session.getAttribute("student");
if(student==null)
{
	response.sendRedirect("login?message=sessionExpired");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            padding: 0;
        }

        .navbar { background-color: #7eb6d8;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar .brand {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .navbar .nav-links {
            display: flex;
            gap: 15px;
        }

        .navbar a {
            text-decoration: none;
            color: black;
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .navbar a:hover {
            background-color: teal;
            color: white;
        }

        .page-content {
            display: flex;
        }

        .sidebar { background-color: #7eb6d8;
            border-right: 1px solid #ddd;
            width: 250px;
            padding: 20px;
            height: 100vh;
            position: sticky;
            top: 0;
        }

        .sidebar a {
            display: block;
            color: #fff;
            text-decoration: none;
            margin: 15px 0;
            padding: 10px;
            border-radius: 5px;
        }

        .sidebar a:hover {
            background-color: #555;
            color: white;
        }

        .logout {
            margin-top: auto;
            text-align: center;
        }

        .main-content {
            flex-grow: 1;
            padding: 20px;
        }

        .container {
            margin-top: 30px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

    </style>
</head>
<body>

    <nav class="navbar">
        <div class="brand">Course Management System</div>
        <div class="nav-links">
        	<a href="studenthome">Home</a>
        	<a href="/register-courses?studentId=${student.id}">Register Courses</a>
        	<a href="/my-courses?studentId=${student.id}">My Courses</a>
            <a href="#">Welcome, Student</a>
            <a href="login">Logout</a>
        </div>
    </nav>
</body>
</html>

