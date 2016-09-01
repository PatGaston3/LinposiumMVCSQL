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

	<a href="http://localhost:8080/Linposium/"></a><h2 align="center">Update Job</h2></a>
	
	
	<form action="updatedJob.do" method="GET">
	<table width="100%" border="1px">
		<tr>
			<td>Employer: <br> <input type="text" value="${job.employer}" name="employer"><br><br></td>
		</tr>
		<tr>
			<td>Location:  <br>   <input type="text" value="${job.location}" name="location"><br><br></td>
		</tr>
		<tr>
			<td>Job Title: <br>   <input type="text" value="${job.title}" name="title"><br><br></td>
		</tr>
		<tr>
			<td>Specialty: <br>   <input type="text" value="${job.specialty}" name="specialty"><br><br></td>
		</tr>
		<tr>
			<td>Deadline: <br>    <input type="text" value="${job.deadline}" name="deadline"><br><br></td>
		</tr>
		<tr>
			<td>Today's Date: <br> <input type="text" value="${job.datePosted}" name="datePosted"><br><br></td>
		<tr>
		<tr>
			<td>Today's Date: <br> <input type="hidden" value="${job.id}" name="id"><br><br></td>
		<tr>
		<tr>
			<td><input type="submit" value="Update Job" name="newJob"></td>
		</tr>
	</table>
	</form>

</body>
</html>