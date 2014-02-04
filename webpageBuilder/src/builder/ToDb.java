package builder;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ToDb
 */
@WebServlet("/ToDb")
public class ToDb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToDb() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String title = request.getParameter("title"),disc = request.getParameter("description");
		
		//textBox
		
		int tbc = Integer.parseInt(request.getParameter("textbox-count"));
		ArrayList<String> tcl = new ArrayList<String>();
		for(int i = 0 ; i < tbc ; i++ ){
			tcl.add(request.getParameter("textbox-"+i));
		}
		
		//radio butt
		
		int rbc = Integer.parseInt(request.getParameter("radiobutton-count"));
		ArrayList<String> rbl = new ArrayList<String>();
		for(int i = 0 ; i < rbc ; i++ ){
			rbl.add(request.getParameter("radiobutton-"+i));
		} 
		//check box
		int cbc = Integer.parseInt(request.getParameter("checkbox-count"));
		ArrayList<String> cbl = new ArrayList<String>();
		for(int i = 0 ; i < cbc ; i++ ){
			cbl.add(request.getParameter("checkbox-"+i));
		}
		
		System.out.println("Title : "+title+"\nDescription : "+ disc);
		
		System.out.println("textbox : " + tcl + "\nredio butt : " + rbl + "\ncheck box : " + cbl);
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/webpagebuilder","root","root");
			st=con.createStatement();
			
			String insertStatemetn = "insert into webpage(title,description,paragraphs) values('"+title+"','"+disc+"'');";
			
			System.out.println("hi"+st.executeUpdate(insertStatemetn));
			
			st.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("in catch"+e.getMessage());
		}
		
		
		out.close();
	}

}
