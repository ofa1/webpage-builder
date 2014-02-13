<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="staticcontent.Content"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Homepage</title>

<link href="css/bootstrap.css" rel="stylesheet" />
<link href="http://getbootstrap.com/dist/css/bootstrap-theme.min.css"
	rel="stylesheet" />
</head>
<body>
	<%
		String user = "Guest";
		boolean flag = false;
		if (session.getAttribute("username") != null)
			user = session.getAttribute("username").toString();
		else
			flag = true;
	%>
	<div class="main">
		<div class="navbar navbar-default" role="navigation">
			<ul class="nav nav-tabs nav-justified" id="navlist">
				<li><a href="homepage.jsp">Home</a></li>
				<%
					if (!flag) {
				%>
				<li><a href="create-page.jsp">Create Page</a></li>
				<li><a href="Logout">Logout</a></li>
				<%
					} else {
				%>
				<li><a href="login.jsp">Login/Register</a></li>
				<%
					}
				%>
				<li><a href="contact-us.jsp">Contact Us</a></li>
			</ul>
		</div>
		<div class="jumbotron">
			<h2>
				Welcome,
				<%=user%></h2>

			<%
				if (!flag) {
			%><h3>View your previous projects:</h3>
			<%
				//TODO DB code comes here
				try {
				int pageid = 0;
					Statement st = null;
					ResultSet rs = null;
					ArrayList<String> list = new ArrayList<String>();
					Connection con = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/webpagebuilder", "root",
							"root");
					st = con.createStatement();
					String query = "";

					query = "select pageid from userpage where username = \""+user+"\"";

					rs = st.executeQuery(query);
					while (rs.next()) {
						pageid = rs.getInt(1);
						list.add("htms/"+user+"_"+pageid+".html");
					}
					%>
					<ul>
					<%
					for(int i=0; i<list.size(); i++)
					{%>
						<li><a href="<%=list.get(i)%>"><%=list.get(i) %></a></li>
					<% }
					%>
					</ul>
					<%
				}
			catch(Exception e)
			{
				System.out.println("EXCEPTION!"+e.getMessage());
			}
			%>
			<%
				} else {
			%>
			<p>Please login or Register to start building awesome webpages!</p>
			<%
				}
			%>
		</div>
		<div class="well footer">&copy; AOS 2014</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.0.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>