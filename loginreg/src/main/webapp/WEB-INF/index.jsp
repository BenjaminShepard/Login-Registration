<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!-- For JSTL Forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset="ISO-8859-1">
<title>Login/Registration</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container border border-2 border-primary">
	
		<h1>Welcome!</h1>
			<p>Join our growing community.</p>
		<h3>Register</h3>
		<form:form action="/register" method="post" modelAttribute="newUser">
			<p>
				<form:label path="username">Username:</form:label>
				<form:errors class="text-danger" path="username" />
				<form:input class="w-100" path="username" />
			</p>
			<p>
				<form:label path="email">Email:</form:label>
				<form:errors class="text-danger" path="email" />
				<form:input class="w-100" path="email" />
			</p>
			<p>
				<form:label path="password">Password:</form:label>
				<form:errors class="text-danger" path="password" />
				<form:input class="w-100" type="password" path="password" />
			</p>
			<p>
				<form:label path="confirm">Confirm Password:</form:label>
				<form:errors class="text-danger" path="confirm" />
				<form:input class="w-100" type="password" path="confirm" />
			</p>
			<input type="submit" value="Submit" />
		</form:form>
		
		<h3>Login</h3>
		<form:form action="/login" method="post" modelAttribute="newLogin">
			<p>
				<form:label path="email">Email:</form:label>
				<form:errors class="text-danger" path="email" />
				<form:input class="w-100" path="email" />
			</p>
			<p>
				<form:label path="password">Password:</form:label>
				<form:errors class="text-danger" path="password" />
				<form:input class="w-100" type="password" path="password" />
			</p>
			<input type="submit" value="Submit" />
		</form:form>
		
	</div>
</body>
</html>