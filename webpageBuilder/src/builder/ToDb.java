package builder;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	/** (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 * type here what all you want as parameters
	 * Page one -> Title, Description, Textarea
	 * Page two -> {textbox, Radio buttons, Buttons, Checkboxes} with counts
	 * 			-> Ordering numbers
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		
		String title = session.getAttribute("title").toString();
		String description = session.getAttribute("description").toString();
		String paragraph = session.getAttribute("content").toString();
		int pageid = 0;
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/webpagebuilder","root","root");
			st=con.createStatement();
			String insert="insert into webpage(title,description,paragraphs) values('"+title+"','"+description+"','"+paragraph+"');";
			st.executeUpdate(insert);
			
			insert="select max(pageid) from webpage";
            
			rs = st.executeQuery(insert);
			while(rs.next())
			{
				pageid = rs.getInt(1);
			}
			
			String uname = session.getAttribute("username").toString();
			
			insert="insert into userpage('"+uname+"','"+pageid+"');";
			
			//inserting elements all
			int count = Integer.parseInt(session.getAttribute("count").toString());
			
			for(int i = 0 ; i < count ; i++ ){
				String getelement = session.getAttribute(""+i).toString();
				StringTokenizer sto = new StringTokenizer(getelement,"_");
				sto.nextToken();
				String type = sto.nextToken();
				int id = Integer.parseInt(sto.nextToken());
				if(type.equals("textbox")){
					String lable = (String)session.getAttribute(type+"_"+id);
					insert="insert into pagedata(pageid,elementlable,elementtype,seq) values('"+pageid+"','"+lable+"','"+type+"',"+i+");";
					st.executeUpdate(insert);
				}else if(type.equals("button")){
					String lable = (String)session.getAttribute(type+"_"+id);
					insert="insert into pagedata(pageid,elementlable,elementtype,seq) values('"+pageid+"','"+lable+"','"+type+"',"+i+");";
					st.executeUpdate(insert);
				}else if(type.equals("checkbox")){
					String lable = (String)session.getAttribute(type+"_"+id);
					StringTokenizer tempsto = new StringTokenizer((String)session.getAttribute(type+"_"+id),"_");
					tempsto.nextToken();
					int nosub = Integer.parseInt(tempsto.nextToken());
					insert="insert into pagedata(pageid,elementlable,elementtype,seq) values('"+pageid+"','"+lable+"','"+type+"',"+i+");";
					st.executeUpdate(insert);
					for(int j = 0 ; j < nosub ; j++){
						String sublable = (String)session.getAttribute("checkboxes_checkbox_"+id+"_"+j);
						insert="insert into subdata(elementlable,elementid) values('"+sublable+"','"+lable+"');";
						st.executeUpdate(insert);
					}
				}else if(type.equals("radiobutton")){
					String lable = (String)session.getAttribute(type+"_"+id);
					StringTokenizer tempsto = new StringTokenizer((String)session.getAttribute(type+"_"+id),"_");
					tempsto.nextToken();
					int nosub = Integer.parseInt(tempsto.nextToken());
					insert="insert into pagedata(pageid,elementlable,elementtype,seq) values('"+pageid+"','"+lable+"','"+type+"',"+i+");";
					st.executeUpdate(insert);
					for(int j = 0 ; j < nosub ; j++){
						String sublable = (String)session.getAttribute("radiobuttons_radiobutton_"+id+"_"+j);
						insert="insert into subdata(elementlable,elementid) values('"+sublable+"','"+lable+"');";
						st.executeUpdate(insert);	
					}
				}
			}
			
			st.close();
            con.close();
		}catch(Exception e1){
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * 
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		/*
		int buttoncount = //Integer.parseInt(request.getParameter("buttoncount"));
		int checkboxcount = Integer.parseInt(request.getParameter("checkboxcount"));
		int radiobuttoncount = Integer.parseInt(request.getParameter("rediobuttoncount"));
		int textboxcount = Integer.parseInt(request.getParameter("textboxcount"));
		int count = Integer.parseInt(request.getParameter("count"));
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		for(int i = 0 ; i < count ; i++ ){
			String getparam = request.getParameter(""+i);
			StringTokenizer sto = new StringTokenizer(getparam,"_");
			sto.nextToken();
			String type = sto.nextToken();
			int id = Integer.parseInt(sto.nextToken());
			String lable = request.getParameter(type+"_"+id);
			if(type.equals("textbox")){
				try {
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/webpagebuilder","root","root");
					st=con.createStatement();
					String insert="insert into pagedata(elementlable,elementtype,seq) values('"+lable+"','"+type+"',"+i+");";
					st.executeUpdate(insert);
		            System.out.println("after");
		                		 
					st.close();
		            con.close();
				}catch(Exception e1){
					
				}
			}
		}
		
		*/
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
