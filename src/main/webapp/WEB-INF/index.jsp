<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Club</title>

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<h1>Book Club</h1>
		<p>A place for friends to share thoughts on books.</p>
		<c:if test="${dash != null}">
			<p class="text-danger"><c:out value="${dash}"/></p>
		</c:if>
		<div class="row">
		<div class="col">
			<h2>Register</h2>
			<form:form action="/register" method="post" modelAttribute="newUser">
				<p>
					<form:errors path="name" class="text-danger" />
					<form:errors path="email" class="text-danger" />
					<form:errors path="password" class="text-danger" />
					<form:errors path="confirmPassword" class="text-danger" />
				</p>
		        <div class="form-group">
		            <label>Name:</label>
		            <form:input path="name" class="form-control" />
		        </div>
		        <div class="form-group">
		            <label>Email:</label>
		            <form:input path="email" class="form-control" />
		        </div>
		        <div class="form-group">
		            <label>Password:</label>
		            <form:password path="password" class="form-control" />
		        </div>
		        <div class="form-group">
		            <label>Confirm Password:</label>
		            <form:password path="confirmPassword" class="form-control" />
		        </div>
		        <input type="submit" value="Register" class="btn btn-primary mt-3" />
	    	</form:form>
		</div>
		<div class="col">
		<h2>Login</h2>
			<form:form action="/login" method="post" modelAttribute="newLogin">
		        <div class="form-group">
		            <label>Email:</label>
		            <form:input path="email" class="form-control" />
		            <form:errors path="email" class="text-danger" />
		        </div>
		        <div class="form-group">
		            <label>Password:</label>
		            <form:password path="password" class="form-control" />
		            <form:errors path="password" class="text-danger" />
		        </div>
		        <input type="submit" value="Login" class="btn btn-success mt-3" />
	    	</form:form>
		</div>
	</div>
	</div>
</body>
</html>
