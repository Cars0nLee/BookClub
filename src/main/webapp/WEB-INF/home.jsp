<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<br>
	<div class="container">
		<h1>Welcome, <c:out value="${loggedUser.name}" />!</h1>
		<br>
		<h6>Books from everyone's shelves:</h6>
		<br>
		<c:if test="${dash != null}">
			<p class="text-danger"><c:out value="${dash}"/></p>
		</c:if>
		<table class="table">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Title</th>
				<th scope="col">Author Name</th>
				<th scope="col">Posted By</th>
			</tr>
			<c:forEach var="i" items="${books}">
			<tr>
				<td><c:out value="${i.id}" /></td>
				<td><a href="http://localhost:8080/view/${i.id}"><c:out value="${i.title}" /></a></td>
				<td><c:out value="${i.authorName}" /></td>
				<td><c:out value="${i.user.name}" /></td>
			</tr>
			</c:forEach>
		</table>
		<a href="http://localhost:8080/add">Add a Book</a>
		<br><br>
		<a href="http://localhost:8080/logout">Logout</a>
	</div>
</body>
</html>
