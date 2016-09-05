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

<title>Linposium Update Job</title>

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
						<h1>Update Job</h1>

						<!-- Spacing -->
						<br> <br> <br>

						<form action="updatedJob.do" method="GET">
							<table width="100%" >
								<tr>
									<td>Employer: <br> <input size="150" type="text"
										value="${job.employer}" name="employer"><br>
									<br></td>
								</tr>
								<tr>
									<td>Location: <br> <input size="150" type="text"
										value="${job.location}" name="location"><br>
									<br></td>
								</tr>
								<tr>
									<td>Job Title: <br> <input size="150" type="text"
										value="${job.title}" name="title"><br>
									<br></td>
								</tr>
								<tr>
									<td>Specialty: <br> <input size="150" type="text"
										value="${job.specialty}" name="specialty"><br>
									<br></td>
								</tr>
								<tr>
									<td>Deadline: <br> <input size="150" type="text"
										value="${job.deadline}" name="deadline"><br>
									<br></td>
								</tr>
								<tr>
									<td>Today's Date: <br> <input size="150" type="text"
										value="${job.datePosted}" name="datePosted"><br>
									<br></td>
								<tr>
								<tr>
									<td>Website: <br> <input size="150" type="text"
										value="${job.website}" name="website"><br>
									<br></td>
								<tr>
								<tr>
									<td>Today's Date: <br> <input size="150" type="hidden"
										value="${job.id}" name="id"><br>
									<br></td>
								<tr>
								<tr>
									<td><input class="btn btn-default" type="submit" value="Update Job" name="newJob"></td>
								</tr>
							</table>
						</form>

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
