<%@page import="staticcontent.Content"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>
<link href="css/bootstrap.css" rel="stylesheet"/>
</head>
<body>

		<%=Content.Navigation()%>
		<div class="container">
			<h1>Contact Us</h1>
			<div >
				<b>Please submit the following details to contact us</b>
			</div>
			<div class="form-group">
				<form action="Mailing" method="post"
					onsubmit="return window.confirm(&quot;Are you sure you want to submit the details?&quot;);">
					<div>

					<table>
						<tr>
							<td>First Name:</td>
							<td><input type="text" name="first_name" class="form-control"
								placeholder="First Name" required pattern="[A-za-z]{5,15}"
								title="should contain 5-15 letters"></td>
						</tr>
						<tr>
							<td>Last Name:</td>
							<td><input type="text" name="last_name" class="form-control"
								placeholder="Last Name" pattern="[A-za-z]{5,15}"
								title="shoul contain 5-15 letters" required></td>
						</tr>
						<tr>
							<td>E-Mail:</td>
							<td><input type="email" name="email" class="form-control"
								placeholder="example@example.com" required></td>
						</tr>
						<tr>
							<td>Contact Number:</td>
							<td><input type="text" name="contact_number" class="form-control"
								placeholder="Contact Number" pattern="[0-9]{10,11}" required></td>
						</tr>
						<tr>
						<tr>
							<td>Sex:</td>
							<td><input type="radio" name="sex" value=male checked>Male
							<input type="radio" name="sex" value=female>Female</td>
						</tr>
						<tr>
							<td>Comments:</td>
							<td><textarea name="textarea" class="form-control" rows="6" cols="40"
									maxlength="1500"></textarea></td>
						</tr>
					</table>

					<div class="col-xs-4">
						<b>Prove you are human:</b><br>What is the remainder when ten
						is divided by 2 <input type="text" name="ques" class="form-control"><br>
					</div>
					<br>
					<div class="col-xs-2">
						<input type="reset" name="valid" class="btn btn-default">
						<input type="submit" value="Submit" class="btn btn-success"
							name="valid">
					</div>
					</div>
				</form>
			</div>
		</div>
	<div class="well footer">&copy; AOS 2014</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.0.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>