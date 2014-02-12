<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>your page</title>
</head>
<%
	int buttoncount = Integer.parseInt(request.getParameter("buttoncount"));
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
		String lable = request.getParameter("");
		if(type.equals("textbox")){
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/webpagebuilder","root","root");
				st=con.createStatement();
				String insert="insert into pagedata(elementlable,elementtype,seq) values('"+cblabels.get(i)+"','"+"cb"+"',"+seqno+++");";
				System.out.println("before"+today1);
	                		 st.executeUpdate(insert);
	                		// System.out.println("after");
	                		 
				 st.close();
	              			 con.close();
	              			  out.println("<html><head><script type=\"text/javascript\">alert('SUCCESSFULLY posted');</script>");
					out.println("<html><head><script language=\"JavaScript\"> window.location.href =\"post.html\" </script></body></html>");
				
			}catch(Exception e1){
				
			}
		}
	}
%>
<body>
<h1><%=textboxcount %></h1>
<h1><%=buttoncount%></h1>
<h1><%=radiobuttoncount%></h1>
<h1><%=checkboxcount%></h1>
</body>
</html>