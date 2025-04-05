<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Page</title>
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
<%@include file="studentnavbar.jsp" %>
<main class="main-content">
    <div class="filter">
        <label for="year">Filter by Year:</label>
        <select id="year" onchange="filterCoursesByYear()">
            <option value="all">All Years</option>
            <option value="1">1st Year</option>
            <option value="2">2nd Year</option>
            <option value="3">3rd Year</option>
            <option value="4">4th Year</option>
        </select>
    </div>
    <div class="container" id="course-container">
        <c:forEach items="${courseslist}" var="cr">
            <div class="card" data-semester="${cr.semester}">
                <img src="resources/img/coursesback.jpg" alt="Course Image">
                <h3>Course Name: <c:out value="${cr.courseName}"/></h3>
                <p>Course Code: <c:out value="${cr.courseCode}"/></p>
                <p>Credits: <c:out value="${cr.credits}"/></p>
                <p>Department: <c:out value="${cr.department}"/></p>
                <p>LTPS: <c:out value="${cr.ltps}"/></p>
                <p>Coordinator: <c:out value="${cr.courseCoordinator}"/></p>
                <p>Year: <c:out value="${cr.semester}"/></p>
                <a href="course">View Course</a>

            </div>
        </c:forEach>
    </div>
</main>
<script>
    function filterCoursesByYear() {
        const year = document.getElementById('year').value;
        const cards = document.querySelectorAll('.card');

        cards.forEach(card => {
            const semester = parseInt(card.getAttribute('data-semester'));
            const cardYear = Math.ceil(semester); // Calculate year based on semester
            if (year === 'all' || cardYear === parseInt(year)) {
                card.style.display = '';
            } else {
                card.style.display = 'none';
            }
        });
    }
</script>

</body>
</html>

