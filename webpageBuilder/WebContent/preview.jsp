<%@page import="staticcontent.Content"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*;"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" />
<title>Preview Page</title>
<script src="ckeditor/ckeditor.js"></script>
</head>
<body>

	<%=Content.Navigation()%>
	<%
		Enumeration<String> e = session.getAttributeNames();
	%>
	<div class="container">
		<h1><%=session.getAttribute("title")%></h1>
		<h3><%=session.getAttribute("description")%></h3>
		<br>
		<div id="editable" contenteditable="true">
			<%=session.getAttribute("content")%>
		</div>
		<%
			int count = Integer
					.parseInt((String) session.getAttribute("count"));
			for (int i = 0; i < count; i++) {
				String getelement = session.getAttribute("" + i).toString();
				StringTokenizer sto = new StringTokenizer(getelement, "_");
				sto.nextToken();
				String type = sto.nextToken();
				int id = Integer.parseInt(sto.nextToken());
				if (type.equals("textbox")) {
					String lable = (String) session.getAttribute(type + "_"
							+ id);
		%><label> <%=lable%> :
		</label><input type="text" class="form-control"><br>
		<%
			} else if (type.equals("button")) {
					StringTokenizer tempsto = new StringTokenizer(
							(String) session.getAttribute(type + "_" + id), "_");
					String lable = tempsto.nextToken();
					String butname = tempsto.nextToken();
		%><label> <%=lable%> :
		</label><input type="button" value=<%=butname%> class="form-control"><br>
		<%
			} else if (type.equals("checkbox")) {
					StringTokenizer tempsto = new StringTokenizer(
							(String) session.getAttribute(type + "_" + id), "_");
					String lable = tempsto.nextToken();
					int nosub = Integer.parseInt(tempsto.nextToken());
		%><label> <%=lable%> :
		</label>
		<%
			for (int j = 0; j < nosub; j++) {
						String sublable = (String) session
								.getAttribute("checkboxes_checkbox_" + id + "_"
										+ j);
		%><input type="checkbox"><label><%=sublable%></label>
		<%
			}
		%><br>
		<%
			} else if (type.equals("radiobutton")) {
					StringTokenizer tempsto = new StringTokenizer(
							(String) session.getAttribute(type + "_" + id), "_");
					String lable = tempsto.nextToken();
					int nosub = Integer.parseInt(tempsto.nextToken());
		%><label> <%=lable%> :
		</label>
		<%
			for (int j = 0; j < nosub; j++) {
						String sublable = (String) session
								.getAttribute("radiobuttons_radiobutton_" + id
										+ "_" + j);
						System.out.println("radiobuttons_radiobutton_" + id
								+ "_" + j);
		%><input type="radio"><label><%=sublable%></label>
		<%
			}
		%><br>
		<%
			}
			}
		%>


	</div>
	<form action="ToDb">
		<h1>Do you want to confirm the page?</h1>
		<input type="submit" class="btn btn-success" value="Confirm Page">
	</form>

</body>
</html>