package authentication;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registrationForm
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con = null;

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
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
			
			String str = "Insert into user_details values(\""+username+"\", \""+email+"\", \""+password+"\");";
			
			System.out.println(str);
			stmt.executeUpdate(str);
			response.sendRedirect("login.jsp");
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();						
		//	JOptionPane.showMessageDialog(frame, "Problem in updation");
		}
		
	}

}
