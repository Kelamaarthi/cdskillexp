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
		input[type="submit"] {
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

		input[type="submit"]:hover {
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
						<h1>Add Student</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<main class="main container" id="main">
		<section class="content">
			<div class="form-container">
                <form action="insertstudent" method="post" enctype="multipart/form-data">
                    <table align="center">
                        <tr>
                            <td><label>Name</label></td>
                            <td><input type="text" name="name" required /></td>
                        </tr>

                        <tr>
                            <td><label>Gender</label></td>
                            <td class="gender-radio">
                                <label><input type="radio" name="gender" value="Male" required /> Male</label>
                                <label><input type="radio" name="gender" value="Female" required /> Female</label>
                            </td>
                        </tr>

                        <tr>
                            <td><label>Date of Birth</label></td>
                            <td><input type="date" name="dateofbirth" required /></td>
                        </tr>

                        <tr>
                            <td><label>Department</label></td>
                            <td><input type="text" name="department" required /></td>
                        </tr>

                        <tr>
                            <td><label>Year Of Study</label></td>
                            <td><input type="text" name="yearofstudy" required /></td>
                        </tr>
						
						<tr>
                            <td><label>Total Fee</label></td>
                            <td><input type="text" name="fee" required /></td>
                        </tr>
                        
                        <tr>
                            <td><label>Email</label></td>
                            <td><input type="email" name="email" required /></td>
                        </tr>

                        <tr>
                            <td><label>Password</label></td>
                            <td><input type="password" name="password" required /></td>
                        </tr>

                        <tr>
                            <td><label>Location</label></td>
                            <td><textarea name="location" required></textarea></td>
                        </tr>

                        <tr>
                            <td><label>Contact</label></td>
                            <td><input type="text" name="contact" required /></td>
                        </tr>
						
						<tr>
                            <td><label>Parent Contact</label></td>
                            <td><input type="text" name="parentcontact" required /></td>
                        </tr>
                        
                        <tr>
                            <td><label>Profile Image</label></td>
                            <td><input type="file" name="profileimage" required /></td>
                        </tr>

                        <tr>
                        <td></td>
                            <td colspan="2" align="center">
                                <input type="submit" value="Add" class="button" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
		</section>
	</main>
	<script src="assets/js/text.js"></script>
	<script src="resources/js/main.js"></script>
</body>
</html>
