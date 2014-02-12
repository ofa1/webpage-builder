<%@page import="staticcontent.Content"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Second Page</title>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.form-validator.min.js"></script>
<script type="text/javascript" src="js/sec.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" />
<style>
  #sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
  #sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
  #sortable li span { position: absolute; margin-left: -1.3em; }
 </style>
<script>
$('ul').on("click", function(event){
  var target = event.target,
      index = $(target).index();
    console.log(target, index);
});
</script>
</head>
<style>
#space {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 60%;
}

#space li {
	margin: 0 3px 3px 3px;
	padding: 0.4em;
	padding-left: 1.5em;
	font-size: 1.4em;
	height: 18px;
}

#space li span {
	position: absolute;
	margin-left: -1.3em;
}
</style>
<script>
	$(function() {
		$("#sortable").sortable();
		$("#sortable").disableSelection();
	});
</script>
<body>
	<%=Content.Navigation()%>
	<div class="container">
		<h1>Form Elements</h1>
		<h6>Add form elements:</h6>
		<form action="FormHandler" method="post" id="myForm">
			<select>
				<option id="textbox">Textbox</option>
				<option id="radiobutton">Radiobutton</option>
				<option id="button">Button</option>
				<option id="checkbox">Checkbox</option>
			</select> <input type="button" value="add" onclick="add()"><br>

			<ul id="sortable">
			</ul>

			<div id="space1"></div>
			<input type="button" value="upload" onclick="save()">


		</form>
	</div>
	<div class="well footer">&copy; AOS 2014</div>


</body>
</html>