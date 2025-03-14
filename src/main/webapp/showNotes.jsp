<%@page import="Com.User.Post"%>
<%@page import="java.util.List"%>
<%@page import="Com.Dao.PostDao"%>
<%@page import="Com.Db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("UserD");

if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login...");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SHow Notes</title>
<%@include file="AllContent/allCss.jsp"%>
</head>
<body>
	<%@include file="AllContent/navbar.jsp"%>

	<%
	 String updateMsg = (String) session.getAttribute("updateMsg");
	if(updateMsg != null)
	{%>
       <div class="alert alert-success" role="alert"><%=updateMsg%></div>
	<%
	
	session.removeAttribute("updateMsg");
	}
	%>
	
	<%
	 String WrongMag = (String) session.getAttribute("WrongMag");
	if(WrongMag != null)
	{%>
       <div class="alert alert-danger" role="alert"><%=WrongMag%></div>
	<%
	
	session.removeAttribute("WrongMag");
	}
	%>

	<div class="container">
		<h2 class="text-center">All Notes:</h2>

		<div class="row">
			<div class="col-md-12">

				<%
				if (user3 != null) {
					PostDao ob = new PostDao(DBConnect.getCon());
					List<Post> post = ob.getData(user.getId());
					for (Post po : post) {
				%>
				<div class="card mt-3">
					<img alt=""
						src="https://us.123rf.com/450wm/donets/donets2102/donets210200013/163960555-notebook-with-pencil-icon-writing-tasks-concept-vector-illustration-isolated-on-white-background.jpg?ver=6"
						class="card-img-top mt-2 mx-auto" style="max-width: 200px";>

					<div class="card-body p-4">


						<h5 class="card-title"><%=po.getTitle() %></h5>
						<p><%=po.getContent() %>.
						</p>

						<p>
							<b class="text-success">Published By:<%=user3.getName()%></b><br>
							<b class="text-primary"></b>
						</p>

						<p>
							<b class="text-success">Published Date:<%=po.getPdate() %></b><br>
							<b class="text-primary"></b>
						</p>

						<div class="container text-center mt-2">
							<a href="deleteServlet?note_id=<%=po.getId() %>" class="btn btn-danger">Delete</a> 
							
							
							
							<a href="edit.jsp?note_id=<%=po.getId() %>" class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>


			</div>
		</div>

	</div>

</body>
</html>