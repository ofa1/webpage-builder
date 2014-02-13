package builder;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FormHandler
 */
@WebServlet("/FormHandler")
public class FormHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FormHandler() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("In form Handler POST");
		HttpSession session = request.getSession(false);
		if(session == null)
			response.sendRedirect("login.jsp");
		Map <String, String[] > map = request.getParameterMap();
		boolean flag = false;
		if(map!=null)
		{
			Iterator<String> keys = map.keySet().iterator();
			while(keys.hasNext())
			{
				String key = keys.next();
				System.out.print(key+":");
				String[] array = map.get(key);
				for(String i:array)
				{
					System.out.println(i);
					session.setAttribute(key, i);
					if(key.equalsIgnoreCase("title"))
						flag = true;
				}
			}
			
			if(flag)
			{
				response.sendRedirect("second.jsp");
			}
			else
			{
				response.sendRedirect("preview.jsp");
			}
		}
		else
			response.sendRedirect("create-page.jsp");
		//	System.out.println(map);
	}

}
