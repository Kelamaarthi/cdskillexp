<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Details</title>
    <link rel="stylesheet" href="styles.css"> 
    <style>
        :root {
            --primary-color: #007bff;
            --secondary-color: #28a745;
            --text-color: #333;
            --background-color: #f7f7f7;
            --card-shadow: rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: Arial, sans-serif;
            background-color: var(--background-color);
            margin: 0;
            padding: 0;
            color: var(--text-color);
        }

        .main-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin: 20px auto;
            width: 90%;
            max-width: 1200px;
            flex-wrap: wrap;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            width: 60%;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px var(--card-shadow);
            padding: 20px;
            margin: 10px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            flex: 1 1 calc(45% - 20px);
            box-sizing: border-box;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .card h3 {
            text-align: center;
            color: var(--text-color);
            margin-bottom: 10px;
        }

        .card p {
            font-size: 14px;
            margin: 5px 0;
            color: #555;
        }

        .download-button a {
            display: inline-block;
            padding: 10px 20px;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .download-button a:hover {
            background-color: #0056b3;
        }

        .form-container {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            width: 35%;
            box-shadow: 0 2px 4px var(--card-shadow);
        }

        .form-container table {
            width: 100%;
            border-collapse: collapse;
        }

        .form-container label {
            font-weight: bold;
        }

        .form-container input[type="file"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        .form-container input[type="submit"] {
            background-color: var(--secondary-color);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <%@include file="studentnavbar.jsp" %>

    <div class="main-container">
        <div class="card-container">
            <c:forEach var="assignments" items="${assignment}">
                <div class="card">
                    <h3>${assignments.coursename}</h3>
                    <p><strong>Course Code:</strong> ${assignments.coursecode}</p>
                    <p><strong>Semester:</strong> ${assignments.semester}</p>
                    <p><strong>Submission Last Date:</strong> ${assignments.submissiondate}</p>
                    <div class="download-button">
                        <a href="<c:url value='/downloadassignment?id=${assignments.id}' />" download>Download Assignment</a>
                    </div>
                </div>
            </c:forEach>
        </div>

        <form action="insertsubmission" method="POST" enctype="multipart/form-data" class="form-container">
            <table>
                <tr>
                    <td><label for="submissiondate">Submission Date</label></td>
                    <td><input type="date" name="submissiondate" id="submissiondate" readonly /></td>
                </tr>
                <tr>
                    <td><label for="submissionpdf">Assignment</label></td>
                    <td><input type="file" name="submissionpdf" id="submissionpdf" accept="application/pdf" required="required" /></td>
                </tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" value="Add Submission" class="button"></td>
                </tr>
            </table>
        </form>
    </div>

    <script>
        document.getElementById("submissiondate").value = new Date().toISOString().split('T')[0];
    </script>
</body>
</html>
