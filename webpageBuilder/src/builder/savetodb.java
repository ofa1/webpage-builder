package builder;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class savetodb
 */
@WebServlet("/savetodb")
public class savetodb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public savetodb() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		
		int buttoncount = Integer.parseInt(request.getParameter("buttoncount")) ,checkboxcount = Integer.parseInt(request.getParameter("checkboxcount")) ,rediobuttoncount = Integer.parseInt(request.getParameter("rediobuttoncount")) ,textboxcount = Integer.parseInt(request.getParameter("textboxcount"));
		System.out.println(buttoncount+checkboxcount+rediobuttoncount+textboxcount);
		writer.println("<h1>"+buttoncount+checkboxcount+rediobuttoncount+textboxcount+"</h1>");
	}

}
