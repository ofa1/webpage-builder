package staticcontent;

public class Content {

	public static String Navigation() {
		return "<nav class=\"navbar navbar-default\" role=\"navigation\">"
				+ "<ul class=\"nav nav-tabs nav-justified\" id=\"navlist\">"
				+"<li><a href=\"homepage.jsp\">Home</a></li>"
				+"<li><a href=\"login.jsp\">Login</a></li>"
				+"<li><a href=\"create-page.jsp\">Create Page</a></li>"
				+"<li><a href=\"contact-us.jsp\">Contact Us</a></li>"
			+"</ul>"
		+"</nav>";
	}
}
