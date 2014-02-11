package authentication;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Mailing
 */
@WebServlet("/Mailing")
public class Mailing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mailing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*final String authUser = "IIIT-4";
		final String authPassword = "msit123";

		System.setProperty("http.proxyHost", "10.10.10.3");
		System.setProperty("http.proxyPort", "3128");
		System.setProperty("http.proxyUser", authUser);
		System.setProperty("http.proxyPassword", authPassword);

		java.net.Authenticator.setDefault(
		 new java.net.Authenticator() {
		   public java.net.PasswordAuthentication getPasswordAuthentication() {
		     return new java.net.PasswordAuthentication(authUser, authPassword.toCharArray());
		   }
		 }
		);*/
		
		String email=request.getParameter("email");
		String body=request.getParameter("textarea");
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		
 
		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("akhil.iiit82","krishna2508");
				}
			});
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("akhil.iiit82@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse("akhil.iiit82@gmail.com"));
			message.setSubject(email);
			message.setText(body);
			Transport.send(message);
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.println("<html>");
			out.println("<body>");
			out.println("<script>");
			out.println("alert(\"sent email\");");
			out.println("var customURL = ('http://localhost:8080/WebPage/contactus.html');");
			out.println("window.location.href = customURL;");
			out.println("window.location.assign(customURL);");
			out.println("window.location.replace(customURL);"); 
			out.println("window.document.location = customURL");
			out.println("</script>");
			out.println("</body>");
			out.println("</html>");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
	}

}
