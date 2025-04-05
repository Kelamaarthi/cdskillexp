<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Registered Courses</title>
    <style>
        .card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            overflow: hidden;
        }

        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
            margin-bottom: 15px;
        }

        .card h3 {
            color: #444;
            margin-bottom: 10px;
        }

        .card p {
            color: #666;
            margin-bottom: 15px;
        }

        .card a {
            background-color: #008cba;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
        	text-align: center;
        	text-decoration: none;
        	font-weight: bold;
        	transition: background-color 0.3s;
        }

        .card a:hover {
            background-color: #005f5f;
        }
    </style>
</head>
<body>
<%@ include file="studentnavbar.jsp" %>
<main class="main-content">
    <h2>My Registered Courses</h2>
    <div class="container">
        <c:forEach var="course" items="${registeredCourses}">
            <div class="card">
                <img src="resources/img/coursesback.jpg" alt="Course Image">
                <h3>Course Name: <c:out value="${course.courseName}"/></h3>
                <p>Course Code: <c:out value="${course.courseCode}"/></p>
                <p>Credits: <c:out value="${course.credits}"/></p>
                <a href="course">View Course</a>
            </div>
        </c:forEach>
    </div>
</main>
</body>
</html>
