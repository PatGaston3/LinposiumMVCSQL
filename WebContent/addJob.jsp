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

	<a href="http://localhost:8080/Linposium/"></a><h2 align="center">Add Job</h2></a>
	
	<form action="jobCompleted.do" method="GET">
	<table width="100%" border="1px">
		<tr>
			<td>Employer: <br> <input type="text" placeholder="Employer" name="employer"><br><br></td>
		</tr>
		<tr>
			<td>Location:  <br>   <input type="text" placeholder="Location ('state','country')" name="location"><br><br></td>
		</tr>
		<tr>
			<td>Job Title: <br>   <input type="text" placeholder="Job Title" name="title"><br><br></td>
		</tr>
		<tr>
			<td>Specialty: <br>   <input type="text" placeholder="Specialty (ex: Computational Linguistics; English; etc.)" name="specialty"><br><br></td>
		</tr>
		<tr>
			<td>Deadline: <br>    <input type="text" placeholder="deadline (ex: Aug-22-2016)" name="deadline"><br><br></td>
		</tr>
		<tr>
			<td>Today's Date: <br> <input type="text" placeholder="datePosted (today's date)" name="datePosted"><br><br></td>
		<tr>
		<tr>
			<td><input type="submit" value="Add Job" name="newJob"></td>
		</tr>
	</table>
	</form>

</body>
</html>