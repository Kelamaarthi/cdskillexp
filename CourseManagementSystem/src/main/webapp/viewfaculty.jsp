<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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

		/* Centered Table Layout */
		.table-container {
			margin: 40px auto;
			width: 80%;
			background-color: #ffffff;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			border-radius: 8px;
			padding: 20px;
		}

		table {
			width: 100%;
			border-collapse: collapse;
			margin: 0 auto;
		}

		table th, table td {
			padding: 15px;
			text-align: center;
			border: 1px solid #ccc;
		}

		table th {
			background-color: #008cba;
			color: #fff;
			text-transform: uppercase;
		}

		table tr:nth-child(even) {
			background-color: #f2f2f2;
		}
		
		.delete-button {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .delete-button:hover {
            background-color: darkred;
        }

		/* Responsive Design */
		@media (max-width: 768px) {
			.table-container {
				width: 90%;
			}

			table th, table td {
				font-size: 14px;
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
						<h1>View Faculty</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="table-container">
		<table>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>GENDER</th>
				<th>DATE OF BIRTH</th>
				<th>DEPARTMENT</th>
				<th>SALARY</th>
				<th>EMAIL</th>
				<th>CONTACT</th>
				<th>LOCATION</th>
				<th>ACTION</th>
			</tr>
			<c:forEach items="${facultylist}" var="faculty">
				<tr>
					<td><c:out value="${faculty.id}"/></td>
					<td><c:out value="${faculty.name}"/></td>
					<td><c:out value="${faculty.gender}"/></td>
					<td><c:out value="${faculty.dateofbirth}"/></td>
					<td><c:out value="${faculty.department}"/></td>
					<td><c:out value="${faculty.salary}"/></td>
					<td><c:out value="${faculty.email}"/></td>
					<td><c:out value="${faculty.contact}"/></td>
					<td><c:out value="${faculty.location}"/></td>
					<td>
                    <a class="delete-button" href='<c:url value="deletefaculty2?id=${faculty.id}"></c:url>'>Delete</a>
                	</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script src="assets/js/text.js"></script>
	<script src="resources/js/main.js"></script>
</body>
</html>
