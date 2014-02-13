<%@page import="staticcontent.Content"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link href="css/bootstrap.css" rel="stylesheet" />

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
				else {%>
				<li><a href="login.jsp">Login/Register</a></li>
				<% } %>
				<li><a href="contact-us.jsp">Contact Us</a></li>
			</ul>
		</nav>
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="" id="loginModal">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3>Have an Account?</h3>
					</div>
					<div class="modal-body">
						<div class="well">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#login" data-toggle="tab">Login</a></li>
								<li><a href="#create" data-toggle="tab">Create Account</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane active in" id="login">
									<form class="form-horizontal" action='Login' method="POST">
										<fieldset>
											<div id="legend">
												<legend class="">Login</legend>
											</div>
											<div class="control-group">
												<!-- Username -->

												<div class="controls">
													<label class="control-label" for="email">Email</label> <input
														type="text" id="email" name="email" placeholder="Email"
														class="form-control">
												</div>
											</div>

											<div class="control-group">
												<!-- Password-->
												<label class="control-label" for="password">Password</label>
												<div class="controls">
													<input type="password" id="password" name="password"
														placeholder="Password" class="form-control">
												</div>
											</div>


											<div class="control-group">
												<!-- Button -->
												<div class="controls">
													<button class="btn btn-success btn-default">Login</button>
												</div>
											</div>
										</fieldset>
									</form>
								</div>
								<div class="tab-pane fade" id="create">
									<form id="tab" action="Registration" method="POST">
										<label>Username</label> <input type="text" name="username"
											data-validation="length alphanumeric"
											data-validation-length="3-12"
											data-validation-error-msg="The user name has to be an alphanumeric value between 3-12 characters"
											required class="form-control"><br> <label>First
											Name</label> <input type="text" value="" name="fname"
											class="form-control"><br> <label>Last
											Name</label> <input type="text" value="" name="lname"
											class="form-control"><br> <label>Email</label> <input
											type="text" value="" name="email" class="form-control"
											data-validation="email" required><br> <label>Password</label>
										<input type="password" required name="password"
											class="form-control" name="pass_confirmation"
											data-validation="strength" data-validation-strength="2">

										<div>
											<button class="btn btn-primary">Create Account</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="well footer">&copy; AOS 2014</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.form-validator.min.js"></script>
<script>
$.validate();
</script>
</body>
</html>