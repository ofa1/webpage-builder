package authentication;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 * Login Functionality
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	String username;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println("email: "+email+"Pwd: "+password);
		if (login(email, password))
		{
			//Logged in
			HttpSession session = request.getSession(true);
			session.setAttribute("email", email);
			session.setAttribute("username", username);
			response.sendRedirect("homepage.jsp");
		}
		else 
		{
			//login failed
			response.sendRedirect("login.jsp");
		}

	}

	public boolean login(String email, String password) {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webpagebuilder","root","root");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			Statement stmt = (Statement) con.createStatement();
			String query = "select * from user_details";

			ResultSet rs = stmt.executeQuery(query);
			String str1,str2;
			while(rs.next()){
				str1 = rs.getString("email");
				str2= rs.getString("password");
				username = rs.getString("username");
				if(str1.equalsIgnoreCase(email)&&str2.equals(password)){
					con.close();
					return true;
				}
			}

			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();	
			return false;
		}
		return false;
	}
}
