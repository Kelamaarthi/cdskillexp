<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Page</title>
    <style>

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
	<%@include file="studentnavbar.jsp" %>
    <div class="page-content">
        <aside class="sidebar">
            <a href="studenthome">Dashboard</a>
            <a href="/register-courses?studentId=${student.id}">Register Courses</a>
            <a href="/my-courses?studentId=${student.id}">My Courses</a>
            <a href="studenthome">Feedback</a>
            <a href="/">Logout</a>
        </aside>
    </div>
</body>
</html>

