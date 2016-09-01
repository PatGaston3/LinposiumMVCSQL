<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Calculator Result</title>
</head>
<body>

	<a href="http://localhost:8080/Linposium/"><h2 align="center">Update Job</h2></a>

	<table width="100%" >
		<thead>
			<th><b>Employer:</b></th>
			<th><b>Location:</b></th>
			<th><b>Title:</b></th>
			<th><b>Specialty:</b></th>
			<th><b>Deadline:</b></th>
			<th><b>Date Posted:</b></th>
		</thead>
	<c:forEach var="job" items="${jobs}">
		<tr>
		<td>${job.employer}</td>
		<td>${job.location}</td>
		<td>${job.title}</td>
		<td>${job.specialty}</td>
		<td>${job.deadline}</td>
		<td>${job.datePosted}</td>
		<form action="change.do" method="GET">
		<td><input type="submit" value="Delete"></td>
		<td><input type="hidden" value="${job.id}" name="id"></td>
		</form>
		<form action="update.do" method="GET">
		<td><input type="submit" value="Update"></td>
		<td><input type="hidden" value="${job.id}" name="id"></td>
		</form>
	</c:forEach>
		</tr>
	</table>


</body>
</html>