package Com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logoutServlet
 */
@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			HttpSession session = request.getSession();
			session.removeAttribute("UserD");
			
			HttpSession session2 = request.getSession();
			session.setAttribute("LogoutMsg", "Logout Successfully..");
			response.sendRedirect("login.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
