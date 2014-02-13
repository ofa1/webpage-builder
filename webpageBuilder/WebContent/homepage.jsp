<%@page import="staticcontent.Content"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Homepage</title>
<%
String user = "user";
boolean flag = false;
if(session.getAttribute("username") != null)
	user = session.getAttribute("username").toString();
else
	flag = true;


%>
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="http://getbootstrap.com/dist/css/bootstrap-theme.min.css"
	rel="stylesheet" />
</head>
<body>

	<div class="main">
	<nav class="navbar navbar-default" role="navigation">
				 <ul class="nav nav-tabs nav-justified" id="navlist">
				<li><a href="homepage.jsp">Home</a></li>
				<li><a href="login.jsp">Login</a></li>
				<li><a href="create-page.jsp">Create Page</a></li>
				<li><a href="contact-us.jsp">Contact Us</a></li>
			</ul>
			</nav>
		<div class="jumbotron">
			<h2>
				Welcome,
				<%=user%></h2>
			<p>Content comes here</p>
		</div>
		<div class="well footer">&copy; AOS 2014</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.0.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>