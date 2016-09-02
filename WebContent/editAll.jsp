<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, shrink-to-fit=no, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Linposium Update List</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/simple-sidebar.css" rel="stylesheet">

</head>

<body>

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
					<li class="sidebar-brand"><a
					href="http://localhost:8080/Linposium/index.html"><img src="img/small-logo.png"/></a>
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
						<h1>Update/Edit Jobs</h1>

						<!-- Spacing -->
						<br> <br> <br>
						

						<table width="100%">
							<thead>
								<th><b>Employer:</b></th>
								<th><b>Location:</b></th>
								<th><b>Title:</b></th>
								<th><b>Specialty:</b></th>
								<th><b>Deadline:</b></th>
								<th><b>Date Posted:</b></th>
								<th><b>Website:</b></th>
							</thead>
							<c:forEach var="job" items="${jobs}">
								<tr>
									<td>${job.employer}</td>
									<td>${job.location}</td>
									<td>${job.title}</td>
									<td>${job.specialty}</td>
									<td>${job.deadline}</td>
									<td>${job.datePosted}</td>
									<td><a href="${job.website}">View / Apply</a></td>
									<form action="change.do" method="GET">
										<td><input type="hidden" value="Delete"></td>
										<td><input type="hidden" class="btn btn-default" value="${job.id}" name="id">
										<button type="submit" class="btn btn-primary">
    <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
                                        </button></td>
									</form>
									<form action="update.do" method="GET">
										<td><input type="hidden" value="Update"></td>
										<td><input type="hidden" class="btn btn-default" value="${job.id}" name="id"><button type="submit" class="btn btn-default">
    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span></td>
									</form>
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
