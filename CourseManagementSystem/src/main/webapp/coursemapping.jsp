<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
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
	<style>
		/* Universal reset */
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		/* Body styling */
		body {
			font-family: 'Poppins', sans-serif;
			background-color: #f7f7f7;
			color: #333;
		}

		/* Breadcrumb Section */
		.breadcrumb-section {
			background: #008cba;
			color: #fff;
			padding: 40px 0;
			text-align: center;
		}

		.breadcrumb-section .breadcrumb-text p {
			margin: 0;
			font-size: 16px;
			font-weight: 300;
		}

		.breadcrumb-section .breadcrumb-text h1 {
			margin: 10px 0 0;
			font-size: 36px;
			font-weight: 700;
		}

		/* Main Form Container */
		.form-container {
			background-color: #ffffff;
			padding: 30px;
			margin: 40px auto;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			border-radius: 8px;
			width: 60%;
		}

		form {
			font-size: 16px;
		}

		/* Table Layout */
		table {
			width: 100%;
			border-collapse: collapse;
		}

		table td {
			padding: 15px;
			vertical-align: middle;
		}

		table td:first-child {
			text-align: right;
			font-weight: bold;
			color: #444;
			padding-right: 20px;
			width: 30%;
		}

		table td:last-child {
			text-align: left;
			width: 70%;
		}

		/* Inputs and Textareas */
		input[type="text"],
		input[type="email"],
		input[type="password"],
		input[type="number"],
		input[type="date"],
		textarea,
		select {
			width: 100%;
			padding: 10px;
			margin-top: 5px;
			border: 1px solid #ccc;
			border-radius: 4px;
			font-size: 14px;
		}

		textarea {
			resize: vertical;
		}

		input[type="file"] {
			border: none;
		}

		/* Radio Buttons */
		.gender-radio label {
			margin-right: 15px;
			font-weight: normal;
		}

		.gender-radio input {
			margin-right: 5px;
		}

		/* Submit Button */
		input[type="submit"],
		input[type="reset"] {
			background-color: #008cba;
			color: #fff;
			border: none;
			padding: 10px 20px;
			font-size: 16px;
			font-weight: bold;
			text-transform: uppercase;
			border-radius: 4px;
			cursor: pointer;
			transition: background-color 0.3s ease;
		}

		input[type="submit"]:hover
		input[type="reset"]:hover {
			background-color: #005f5f;
		}

		/* Centering Add Button */
		.add-button-container {
			text-align: center;
		}

		/* Responsive Design */
		@media (max-width: 768px) {
			.form-container {
				width: 90%;
			}

			table td:first-child {
				text-align: left;
				padding-right: 0;
			}

			table td {
				display: block;
				text-align: left;
				padding: 10px 0;
			}

			table td:last-child {
				margin-top: 5px;
			}
		}
	</style>
</head>
<body>
	<%@include file="adminnavbar.jsp" %>
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>Course Management System</p>
						<h1>Course Mapping</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<main class="main container" id="main">
		<section class="content">
			<div class="form-container">
        <h3>${message}</h3>
<form method="post" action="fcoursemappinginsert">
  <div class="form-container">
    <div class="form-group">
      <label for="fid">Select Faculty</label>
      <select name="fid" id="fid" required>
        <option value="">--Select--</option>
        <c:forEach items="${facultydata}" var="faculty">
          <option value="${faculty.id}">${faculty.id}-${faculty.name}</option>
        </c:forEach>
      </select>
    </div>

    <div class="form-group">
      <label for="cid">Select Course</label>
      <select name="cid" id="cid" required>
        <option value="">--Select--</option>
        <c:forEach items="${coursedata}" var="course">
          <option value="${course.id}">${course.courseCode}-${course.courseName}</option>
        </c:forEach>
      </select>
    </div>

    <div class="form-group">
      <label for="section">Provide Section</label>
      <input type="number" name="section" id="section" min="1" max="10" required>
    </div>

    <div class="form-group">
      <label for="ftype">Select Faculty Type</label>
      <select name="ftype" id="ftype" required>
        <option value="">--Select--</option>
        <option value="MAIN">Main Faculty</option>
        <option value="ASSISTANCE">Assistance Faculty</option>
      </select>
    </div>

    <div class="button-container">
      <input type="submit" name="Submit" value="Submit" class="button">
      <input type="reset" name="Clear" value="Clear" class="button">
    </div>
  </div>
</form>
    </div>
		</section>
	</main>
	<script src="assets/js/text.js"></script>
	<script src="resources/js/main.js"></script>
</body>
</html>
