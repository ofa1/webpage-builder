<%@page import="staticcontent.Content"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<%
	String user = "User";
	if (session.getAttribute("username") != null)
		user = session.getAttribute("username").toString();
%>
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="http://getbootstrap.com/examples/signin/signin.css" rel="stylesheet"/>
</head>
<body>
		<%=Content.Navigation()%>
		<div class="container">

      <form class="form-signin" role="form" action="Login" method="Post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="email" class="form-control" placeholder="Email address" required autofocus>
        <input type="password" class="form-control" placeholder="Password" required>
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

    </div>
		<div class="well footer">&copy; AOS 2014</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.0.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>