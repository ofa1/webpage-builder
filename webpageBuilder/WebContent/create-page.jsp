<%@page import="staticcontent.Content"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="ckeditor/ckeditor.js"></script>

</head>
<body>
	<%
String user = "Guest";
boolean flag = false;
if(session.getAttribute("username") != null)
	user = session.getAttribute("username").toString();
else
	flag = true;


%>
		<nav class="navbar navbar-default" role="navigation">
			<ul class="nav nav-tabs nav-justified" id="navlist">
				<li><a href="homepage.jsp">Home</a></li>
				<%if(!flag) { %>
				<li><a href="create-page.jsp">Create Page</a></li>
				<li><a href="Logout">Logout</a></li>
				<% }
				else {
				response.sendRedirect("login.jsp");%>
				<li><a href="login.jsp">Login/Register</a></li>
				
				<% } %>
				<li><a href="contact-us.jsp">Contact Us</a></li>
			</ul>
		</nav>
	<div class="container">
		<h1>Create a new page</h1>
		<form action="FormHandler" method="post" id="form">
			<!-- Title -->
			<div id="title">
				<h4>Enter the title of the webpage</h4>
				<input type="text" name="title" id="title" required class="form-control"
					data-validation="length" data-validation-length="min4">
			</div>
			<!-- Description -->
			<div id="description">
				<h4>Enter the description of the webpage</h4>
				<input type="text" name="description" id="description" class="form-control"
					data-validation="length" data-validation-length="min10">
			</div>
			<!-- Upload -->
			<div id="upload">
				<h4>Upload Background Image</h4>
				<input type="text" name="image" id="image" class="form-control">
			</div>
			<br>


			<textarea id="editor" form="form" name="content"></textarea>
			
 			<input type="submit" id="submit" class="btn btn-success" >

		</form>
	</div>
	<div class="well footer">&copy; AOS 2014</div>
	<script src="js/createpage.js"></script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.0.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.form-validator.min.js"></script>
	<script type="text/javascript">
	CKEDITOR.replace( 'editor' );
	</script>
</body>
</html>