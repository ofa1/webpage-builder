<%@page import="staticcontent.Content"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>
<link href="css/home.css" rel="stylesheet" />
</head>
<body>

	<div class="main">
		<%=Content.Navigation()%>
		<div class="container">
			<h1 align="center" style="color: black">Contact Us</h1>
			<div align="center">
				<b>Please submit the following details to contact us</b>
			</div>
			<div style="width: 500px; margin: auto; padding: 1em;">
				<form action="Mailing" method="post"
					onsubmit="return window.confirm(&quot;Are you sure you want to submit the details?&quot;);">


					<table>
						<tr>
							<td>First Name:</td>
							<td><input type="text" name="first_name"
								placeholder="First Name" required pattern="[A-za-z]{5,15}"
								title="should contain 5-15 letters"></td>
						</tr>
						<tr>
							<td>Last Name:</td>
							<td><input type="text" name="last_name"
								placeholder="Last Name" pattern="[A-za-z]{5,15}"
								title="shoul contain 5-15 letters" required></td>
						</tr>
						<tr>
							<td>E-Mail:</td>
							<td><input type="email" name="email"
								placeholder="example@example.com" required></td>
						</tr>
						<tr>
							<td>Contact Number:</td>
							<td><input type="text" name="contact_number"
								placeholder="Contact Number" pattern="[0-9]{10,11}" required></td>
						</tr>
						<tr>
						<tr>
							<td>Sex:</td>
							<td><input type="radio" name="sex" value=male checked>Male
								<br>
							<input type="radio" name="sex" value=female>Female</td>
						</tr>
						<tr>
							<td>Comments:</td>
							<td><textarea name="textarea" rows="6" cols="40"
									maxlength="1500"></textarea></td>
						</tr>
					</table>

					<div align="justify">
						<b>Prove you are human:</b><br>What is the remainder when ten
						is divided by 2 <input type="text" name="ques"><br>
					</div>
					<div align="center">
						<input type="reset" name="valid">
						<input type="submit" value="Submit"
							name="valid">
					</div>
				</form>
			</div>
		</div>
	<div class="footer">&copy; AOS 2014</div>
	</div>

</body>
</html>