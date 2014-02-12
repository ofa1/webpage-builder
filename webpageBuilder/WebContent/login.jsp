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

</head>
<body>
	<%=Content.Navigation()%>
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
												<label class="control-label" for="username">Username</label>
												<div class="controls">
													<input type="text" id="username" name="username"
														placeholder="" class="input-xlarge">
												</div>
											</div>

											<div class="control-group">
												<!-- Password-->
												<label class="control-label" for="password">Password</label>
												<div class="controls">
													<input type="password" id="password" name="password"
														placeholder="" class="input-xlarge">
												</div>
											</div>


											<div class="control-group">
												<!-- Button -->
												<div class="controls">
													<button class="btn btn-success">Login</button>
												</div>
											</div>
										</fieldset>
									</form>
								</div>
								<div class="tab-pane fade" id="create">
									<form id="tab" action="Registration" method="Post">
										<label>Username</label> <input type="text" value=""
											class="input-xlarge"><br> <label>First
											Name</label> <input type="text" value="" class="input-xlarge"><br>
										<label>Last Name</label> <input type="text" value=""
											class="input-xlarge"><br> <label>Email</label> <input
											type="text" value="" class="input-xlarge"><br> <label>Address</label>
										<textarea value="Smith" rows="3" class="input-xlarge">
                        </textarea>

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
</body>
</html>