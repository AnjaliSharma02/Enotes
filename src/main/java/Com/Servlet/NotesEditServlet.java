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
 * Servlet implementation class NotesEditServlet
 */
@WebServlet("/NotesEditServlet")
public class NotesEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		

		try
		{
			Integer noteid = Integer.parseInt(request.getParameter("noteid"));
			String Title = request.getParameter("title");
			String Content = request.getParameter("content");
			
			PostDao dao = new PostDao(DBConnect.getCon());
			boolean f=dao.postUpdate(noteid, Title, Content);
			
			if(f)
			{
				System.out.println("data update successfully");
				
				HttpSession session = request.getSession();
				session.setAttribute("updateMsg","Notes Update Successfully");
				response.sendRedirect("showNotes.jsp");
			}
			else
			{
				System.out.println("data not updated");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
