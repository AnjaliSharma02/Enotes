package Com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Com.Dao.UserDao;
import Com.Db.DBConnect;
import Com.User.UserDetails;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String pass = request.getParameter("pass");

		UserDetails us = new UserDetails();
		us.setEmail(email);
		us.setPassword(pass);

		UserDao dao = new UserDao(DBConnect.getCon());
		UserDetails user = dao.loginUser(us);

		if (user != null) {
			HttpSession session=request.getSession();
			session.setAttribute("UserD", user);
			response.sendRedirect("Home.jsp");
		} else {
            HttpSession session = request.getSession();
            session.setAttribute("Login-fail","Invalid USer Name And Password");
            response.sendRedirect("login.jsp");
		}
	}

}
