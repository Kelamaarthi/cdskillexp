<%@page import="com.klef.jfsd.springboot.model.Faculty"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
   <head>
      <meta charset="utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <meta name="keywords" content="" />
      <meta name="description" content="" />
      <meta name="author" content="" />
      <link rel="shortcut icon" href="resources/img/cms.jpg" type="">
      <title>Faculty</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="resources/css/facultybootstrap.css" />
      <link href="resources/css/faculty.css" rel="stylesheet" />
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
			background-color: #0fa8f0;
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
   <body class="sub_page">
      <%@include file="facultynavbar.jsp" %>
      <section class="inner_page_head">
         <div class="container_fuild">
            <div class="row">
               <div class="col-md-12">
                  <div class="full">
                     <h3>ADD ASSIGNMENT</h3>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <div class="form-container">
        <form action="insertassignment" method="POST" enctype="multipart/form-data" class="form-container">
        <table>
            <tr>
                <td><label for="coursename">Course Name</label></td>
                <td><input type="text" name="coursename" id="coursename" required="required" /></td>
            </tr>
            <tr>
                <td><label for="coursecode">Course Code</label></td>
                <td><input type="text" name="coursecode" id="coursecode" required="required" /></td>
            </tr>
            <tr>
                <td><label for="semester">Semester</label></td>
                <td>
                    <select name="semester" id="semester" required="required">
                        <option value="">---Select---</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="submissiondate">Exam Date</label></td>
                <td><input type="date" name="submissiondate" id="submissiondate" required="required" /></td>
            </tr>
            <tr>
                <td><label for="assignmentpdf">Assignment</label></td>
                <td><input type="file" name="assignmentpdf" id="assignmentpdf" accept="application/pdf" required="required" /></td>
            </tr>
            <tr align="center">
                <td colspan="2"><input type="submit" value="Add Assignment" class="button"></td>
            </tr>
        </table>
    </form>
    </div>
   </body>
</html>
