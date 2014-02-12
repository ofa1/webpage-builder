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
<script src="ckeditor/ckeditor.js"></script>
<script>
	var editor, html = '';

	function createEditor() {
		if (editor)
			return;

		// Create a new editor inside the <div id="editor">, setting its value to html
		var config = {};
		editor = CKEDITOR.appendTo('editor', config, html);
	}

	function removeEditor() {
		if (!editor)
			return;

		// Retrieve the editor contents. In an Ajax application, this data would be
		// sent to the server or used in any other way.
		document.getElementById('textarea').innerHTML = html = editor
				.getData();
		document.getElementById('contents').style.display = '';

		// Destroy the editor.
		editor.destroy();
		editor = null;
	}
	function Submit() {
		document.getElementById('textarea').innerHTML = html = editor.getData();
	}
</script>

</head>
<body>
	<%=Content.Navigation()%>
	<div class="container">
		<h1>Create a new page</h1>
		<form action="FormHandler" method="post" id="form">
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
			<input onclick="createEditor();" type="button" value="Create Editor">
			<input onclick="removeEditor();" type="button" value="Remove Editor">

			<div id="editor"></div>
			
			<textarea  rows="" cols="" hidden="hidden" name="textarea" id="textarea" form="form"></textarea>
			<input type="submit" name="submit" id="submit" onclick="Submit()">

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