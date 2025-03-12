<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
UserDetails user2 = (UserDetails) session.getAttribute("UserD");

if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login...");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="AllContent/allCss.jsp"%>
</head>
<body>

	<div class="container-fluid p-0">
		<%@include file="AllContent/navbar.jsp"%>
		<div class="card py-4">
			<div class="card-body text-center">
				<img alt=""
					src="https://us.123rf.com/450wm/donets/donets2102/donets210200013/163960555-notebook-with-pencil-icon-writing-tasks-concept-vector-illustration-isolated-on-white-background.jpg?ver=6"
					class="img-fluid" style="max-width: 500px;">

				<h1>START TAKING YOUR NOTES</h1>
				<a href="addNotes.jsp" class="btn btn-outline-primary">Start
					Here</a>
			</div>
		</div>

	</div>

	<%@include file="AllContent/footer.jsp"%>
</body>
</html>