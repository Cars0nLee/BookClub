<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<form:form action="/update/${book.id}" method="POST" modelAttribute="book">
			<form:hidden path="user" value="${userId}" />
			<input type="hidden" name="_method" value="put">
			<p>
				<form:errors path="title" class="text-danger"/>
				<form:errors path="authorName" class="text-danger"/>
				<form:errors path="thoughts" class="text-danger"/>
			</p>
			<div class="form-group">
				<form:label path="title">Title:</form:label>
				<form:input path="title" />
			</div>
			<div class="form-group">
				<form:label path="authorName">Author:</form:label>
				<form:input path="authorName" />
			</div>
			<div class="form-group">
				<form:label path="thoughts">My thoughts:</form:label>
				<form:input path="thoughts" />
			</div>
			<input type="submit" value="Submit" class="btn btn-success mt-3">
		</form:form>
		<br>
		<a href="http://localhost:8080/dash">back to the shelves</a>
	</div>
</body>
</html>
