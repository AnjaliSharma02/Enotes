package Com.Servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Com.Dao.PostDao;
import Com.Db.DBConnect;
import Com.User.Post;

/**
 * Servlet implementation class AddNotesServlet
 */
@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid=Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		PostDao dao = new PostDao(DBConnect.getCon());
		boolean f = dao.AddNotes(title, content, uid);
		
		if(f)
		{
			System.out.println("data inserted successfully");
			response.sendRedirect("showNotes.jsp");
		}
		else
		{
			System.out.println("data not inserted");
		}
				
		
	}

}
