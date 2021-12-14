<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add a Book!</title>

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<br>
	<div class="container">
		<h1>Add a Book to Your Shelf!</h1>
		<form:form action="/create" method="POST" modelAttribute="book">
		<form:hidden path="user" value="${userId}" />
			<p>
				<form:errors path="title" class="text-danger"/>
				<form:errors path="authorName" class="text-danger"/>
				<form:errors path="thoughts" class="text-danger"/>
			</p>
			<p>
				<form:label path="title">Title:</form:label>
				<form:input path="title" />
			</p>
			<p>
				<form:label path="authorName">Author:</form:label>
				<form:input path="authorName" />
			</p>
			<p>
				<form:label path="thoughts">My thoughts:</form:label>
				<form:input path="thoughts" />
			</p>
			<input type="submit" value="Submit">
		</form:form>
	</div>
</body>
</html>
