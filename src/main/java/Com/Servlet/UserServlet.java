package Com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Com.Dao.UserDao;
import Com.Db.DBConnect;
import Com.User.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{

	public void doPost(HttpServletRequest request , HttpServletResponse response)throws ServletException, IOException
	{
		String name = request.getParameter("fname");
		String email = request.getParameter("email");
		String Pass = request.getParameter("pass");
		
		UserDetails us = new UserDetails();
		
		us.setName(name);
		us.setEmail(email);
		us.setPassword(Pass);
		
		UserDao dao = new UserDao(DBConnect.getCon());
		boolean f=dao.addUser(us);
		HttpSession session = request.getSession();
		
		if(f)
		{
		
			
			session.setAttribute("reg-sucess","Registration Successfully..");
		    response.sendRedirect("register.jsp");
		}else {
			session = request.getSession();
			session.setAttribute("failed-msg", "Somthing Went Wrong");
			response.sendRedirect("register.jsp");
		}
	}
	
	
}
