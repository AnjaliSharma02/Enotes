package Com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Com.Dao.PostDao;
import Com.Db.DBConnect;

/**
 * Servlet implementation class deleteServlet
 */
@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		  Integer noteid = Integer.parseInt(request.getParameter("note_id"));
		
		PostDao dao = new PostDao(DBConnect.getCon());
		
		boolean f = dao.DeleteNotes(noteid);
		HttpSession session = null;
		if(f)
		{
			session=request.getSession();
			session.setAttribute("deleteMsg", "notes deleted successfully");
			response.sendRedirect("showNotes.jsp");
		}
		else
		{
			session=request.getSession();
			session.setAttribute("WrongMag","Something Went Wrong in Server");
			response.sendRedirect("showNotes.jsp");
		}
		
	}

	
}
