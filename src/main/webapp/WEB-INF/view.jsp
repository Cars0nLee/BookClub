<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book</title>

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<br>
	<div class="container">
		<h1><c:out value="${book.title}" /></h1>
		<br>
		<h3><span style="color:red;"><c:out value="${book.user.name}" /></span> read <span style="color:purple;"><c:out value="${book.title}" /></span> by <span style="color:green;"><c:out value="${book.authorName}" /></span>.</h3>
		<br>
		<h4>Here are <c:out value="${book.user.name}" />'s thoughts:</h4>
		<hr width="100%">
		<h5><c:out value="${book.thoughts}" /></h5>
		<hr width="100%">
		<br>
		<a href="http://localhost:8080/edit/${book.id}">Edit</a>
		<br><br>
		<a href="http://localhost:8080/dash">back to the shelves</a>
	</div>
</body>
</html>