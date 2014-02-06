package builder;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		out.println("Test page");

		ArrayList<String> tcl = new ArrayList<String>();
		for(int i = 0 ; i < 3 ; i++ ){
			tcl.add("textbox-"+i);
		}

		//radio butt
		ArrayList<String> rbl = new ArrayList<String>();
		for(int i = 0 ; i < 2 ; i++ ){
			rbl.add("radiobutton-"+i);
		} 
		//check box
		ArrayList<String> cbl = new ArrayList<String>();
		for(int i = 0 ; i < 4 ; i++ ){
			cbl.add(("checkbox-"+i));
		}

		System.out.println("textbox : " + tcl + "\nradio buttons : " + rbl + "\ncheckbox : " + cbl);
		putintoDB("test2","testdesc2", "", 3, 2, 4, tcl, rbl, cbl);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		//Title
		String title = request.getParameter("title");

		//Description
		String description = request.getParameter("description");

		//Paragraphs
		String paragraphs = "";

		//textBoxes
		int tbc = Integer.parseInt(request.getParameter("textbox-count"));
		ArrayList<String> tcl = new ArrayList<String>();
		for(int i = 0 ; i < tbc ; i++ ){
			tcl.add(request.getParameter("textbox-"+i));
		}

		//radio buttons
		int rbc = Integer.parseInt(request.getParameter("radiobutton-count"));
		ArrayList<String> rbl = new ArrayList<String>();
		for(int i = 0 ; i < rbc ; i++ ){
			rbl.add(request.getParameter("radiobutton-"+i));
		} 
		//check boxes
		int cbc = Integer.parseInt(request.getParameter("checkbox-count"));
		ArrayList<String> cbl = new ArrayList<String>();
		for(int i = 0 ; i < cbc ; i++ ){
			cbl.add(request.getParameter("checkbox-"+i));
		}
		
		//Images
		
		
		System.out.println("Title : "+title+"\nDescription : "+ description);
		System.out.println("textbox : " + tcl + "\nradio buttons : " + rbl + "\ncheckbox : " + cbl);

		//putintoDB(title, description, paragraphs, tbc, rbc, cbc, tblabels, rblabels, cblabels);

		out.close();
	}

	/**
	 * Function used for storing into database
	 * @param title
	 * @param description
	 * @param paragraphs
	 */
	void putintoDB(String title, String description, String paragraphs, int tbCount, int rbCount, int cbCount , ArrayList<String> tblabels, ArrayList<String> rblabels, ArrayList<String> cblabels) {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/webpagebuilder","root","root");
			st=con.createStatement();

			String insertStatement = "insert into webpage (title,description,paragraphs) values('"+title+"','"+description+"','');";

			st.executeUpdate(insertStatement);

			rs = st.executeQuery("select max(pageid) from webpage;");
			int pageid = -1;
			while(rs.next())
			{
				pageid = rs.getInt(1);
			}
			int seqno = 1 ;

			for(int i = 0 ; i < tbCount ; i++ ){
				insertStatement = "insert into pagedata(pageid, elementlable, elementtype, seq) values("+pageid+",'"+tblabels.get(i)+"','"+"tb"+"',"+(seqno++) +");";
				System.out.println(insertStatement);
				st.executeUpdate(insertStatement);
			}

			for(int i = 0 ; i < rbCount ; i++ ){
				insertStatement = "insert into pagedata(pageid,elementlable,elementtype,seq) values("+pageid+",'"+rblabels.get(i)+"','"+"rb"+"',"+seqno++ +");";
				System.out.println(insertStatement);
				st.executeUpdate(insertStatement);
			}

			for(int i = 0 ; i < cbCount ; i++ ){
				insertStatement = "insert into pagedata(pageid,elementlable,elementtype,seq) values("+pageid+",'"+cblabels.get(i)+"','"+"cb"+"',"+seqno++ +");";
				System.out.println(insertStatement);
				st.executeUpdate(insertStatement);
			}


			st.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("in catch"+e.getMessage());
		}
	}
}
