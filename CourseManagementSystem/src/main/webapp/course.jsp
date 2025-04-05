<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Details</title>
    <style>
    .unit {
        background-color: white;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-bottom: 20px;
        padding: 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .unit a {
        display: inline-block;
        padding: 12px 24px;
        color: white;
        background-color: #007bff;
        text-align: center;
        text-decoration: none;
        font-weight: bold;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .unit a:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
	<%@include file="studentnavbar.jsp" %>

    <div class="main-content">
        <div class="unit">
            <a href="viewassign">Unit 1: Introduction</a>
        </div>

        <div class="unit">
            <a href="#">Unit 2: Advanced Concepts</a>
        </div>

        <div class="unit">
            <a href="#">Unit 3: Practical Applications</a>
        </div>

        <div class="unit">
            <a href="#">Unit 4: Case Studies</a>
        </div>

        <div class="unit">
            <a href="#">Unit 5: Summary and Review</a>
        </div>
    </div>

</body>
</html>
