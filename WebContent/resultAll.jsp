<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, shrink-to-fit=no, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Linposium Job List</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/simple-sidebar.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a
					href="http://localhost:8080/Linposium/">Linposium</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1>All Jobs</h1>


						<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle
							Menu</a>

						<!-- Spacing -->
						<br> <br> <br>

						<form action="GetJobs.do" method="GET">
							<input size="150" type="text" name="input"> <br> <input
								type="submit" class="btn btn-default" value="Search by Employer"
								name="emp"> <input type="submit" class="btn btn-default"
								value="Search by Location" name="loc"> <input
								type="submit" class="btn btn-default" value="Search by Title"
								name="tit"> <input type="submit" class="btn btn-default"
								value="Search by Specialty" name="spec">
						</form>
						<form action="GetJobs.do" method="GET">
							<input type="submit" class="btn btn-default"
								value="Refresh Job List" name="go">
						</form>

						<!-- Spacing -->
						<br> <br> <br>

						<table width="100%">
							<thead>
								<th><b>Employer:</b></th>
								<th><b>Location:</b></th>
								<th><b>Title:</b></th>
								<th><b>Specialty:</b></th>
								<th><b>Date Posted:</b></th>
								<th><b>Deadline:</b></th>
								<th><b>Website:</b></th>
							</thead>
							<c:forEach var="job" items="${jobs}">
								<tr>
									<td>${job.employer}</td>
									<td>${job.location}</td>
									<td>${job.title}</td>
									<td>${job.specialty}</td>
									<td>${job.datePosted}</td>
									<td>${job.deadline}</td>
									<td><a href="${job.website}">View / Apply</a></td>
							</c:forEach>
							</tr>
						</table>



					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>

</body>

</html>
