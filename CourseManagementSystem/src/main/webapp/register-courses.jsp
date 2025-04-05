<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Courses</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #444;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #008cba;
            color: white;
        }

        td {
            background-color: #f2f2f2;
        }

        button {
            background-color: #008cba;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            display: block;
            margin: 0 auto;
        }

        button:hover {
            background-color: #005f5f;
        }

        input[type="checkbox"] {
            margin: 0 auto;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
    </style>
</head>
<body>

<%@ include file="studentnavbar.jsp" %>

<main class="container">
    <form action="/register-courses" method="POST">
        <input type="hidden" name="studentId" value="${studentId}" />
        <table>
            <tr>
                <th>Course Name</th>
                <th>Course Code</th>
                <th>Credits</th>
                <th>Select</th>
            </tr>
            <c:forEach var="course" items="${availableCourses}">
                <tr>
                    <td>${course.courseName}</td>
                    <td>${course.courseCode}</td>
                    <td>${course.credits}</td>
                    <td><input type="checkbox" name="courseIds" value="${course.id}" /></td>
                </tr>
            </c:forEach>
        </table>
        <button type="submit">Register</button>
    </form>
</main>

</body>
</html>
