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

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/simple-sidebar.css" rel="stylesheet">


</head>

<body>

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
					<li class="sidebar-brand"><a
					href="index.html"><img src="img/small-logo.png"/></a>
				</li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div class="page-bg" id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
					<a href="#menu-toggle" id="menu-toggle"><button type="submit" class="btn btn-primary">
    <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
                                        </button></a>
						<h1>All Jobs</h1>


						<!-- Spacing -->
						<br> <br> <br>

						<form action="GetJobs.do" method="GET">
							<input size="150" type="text" name="input"> <br> <input
								type="submit" class="btn btn-default" value="Search by Employer"
								name="emp"> 
						</form>
						<form action="GetJobs.do" method="GET">
							<input type="submit" class="btn btn-default"
								value="Refresh Job List" name="go">
						</form>

						<!-- Spacing -->
						<br> <br> <br>
				<div class="table-resp">
						<table width="100%">
							<thead>
								<th><b>Employer:</b></th>
								<th><b>Location:</b></th>
								<th><b>title:</b></th>
								<th><b>Specialty:</b></th>
								<th><b>Date Posted:</b></th>
								<th><b>Deadline:</b></th>
								<th><b>Website:</b></th>
							</thead>
							<c:forEach var="job" items="${jobs}">
								<tr>
									<td>${job.employer}</td>
									<td>${job.city}, ${job.state}</td>
									<td>${job.title}</td>
									<td>${job.specialty}</td>
									<td>${job.datePosted}</td>
									<td>${job.deadline}</td>
									<td><a href="${job.website}"><button type="submit" class="btn btn-primary">
    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                        </button></a></td>
							</c:forEach>
							</tr>
						</table>
				</div>



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
