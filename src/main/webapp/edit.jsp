<%@page import="Com.User.Post"%>
<%@page import="Com.Db.DBConnect"%>
<%@page import="Com.Dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
UserDetails user1 = (UserDetails) session.getAttribute("UserD");

if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login...");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit page</title>
<%@include file="AllContent/allCss.jsp"%>
</head>
<body>

	<%
	Integer noteId = Integer.parseInt(request.getParameter("note_id")) ;

	PostDao post = new PostDao(DBConnect.getCon());
	Post p = post.getDataById(noteId);
	%>

	<div classs="container-fluid">
		<%@include file="AllContent/navbar.jsp"%>

		<h1 class="text-center m-4">Edit Your Notes</h1>


		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="NotesEditServlet" method="post">
						<div class="from-group">

							<input type="hidden" value="<%=noteId%>" name="noteid"> <label
								for="exampleInputEmail1" class="form-label">Enter Title</label>
							<input type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required" value="<%=p.getTitle() %>">
						</div>
						<br>
						<div class="form-group">
							<label for="exampleInputEmail1" class="form-label">Enter
								Content</label>
							<textarea rows="12" cols="" class="form-control" name="content"
								required="required"><%=p.getContent() %></textarea>
						</div>
						<br>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Add Notes</button>
						</div>

					</form>


				</div>
			</div>
		</div>



	</div>
	<br>
	<br>

	<%@include file="AllContent/footer.jsp"%>

</body>
</html>