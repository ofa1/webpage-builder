<%@page import="staticcontent.Content"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
	String user = "User";
%>
<link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
		<%=Content.Navigation()%>
		<div class="container">
			<h1>Create a new page</h1>
			<form action="ToDb" method="post">
			<!-- Title -->
				<div id="title">
					<h4>Enter the title of the webpage</h4>
					<input type="text" name="title" id="title" required
						data-validation="length" data-validation-length="min4">
				</div>
				<!-- Description -->
				<div id="description">
					<h4>Enter the description of the webpage</h4>
					<input type="text" name="description" id="description"
						data-validation="length" data-validation-length="min10">
				</div>
				<!-- Richtext Editor -->
				
				
				
				
				
				
				
				<input type="submit" name="submit" id="submit"
					onclick="validateSubmit()">

			</form>
		</div>
		<div class="well footer">&copy; AOS 2014</div>
	<script src="js/createpage.js"></script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.0.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.form-validator.min.js"></script>
				
</body>
</html>