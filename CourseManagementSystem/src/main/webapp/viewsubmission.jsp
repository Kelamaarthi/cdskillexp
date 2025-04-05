<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
                     <h3>View Submissions</h3>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <div class="table-container">
		<table>
        <thead>
            <tr> <th>Submission Id</th>
                <th>Submission Date</th>
                <th>Download</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="submissions" items="${submission}">
                <tr>
                 <td>${submissions.id}</td>
                    <td>${submissions.submissiondate}</td>
                    <td>
                        <!-- Provide download option -->
                        <a href="<c:url value='/downloadsubmission?id=${submissions.id}' />" download>
                            <button>Download</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
	</div>
   </body>
</html>
