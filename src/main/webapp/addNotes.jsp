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
<title>Add Notes Page</title>
<%@include file="AllContent/allCss.jsp"%>
</head>
<body>
	<div classs="container-fluid">
		<%@include file="AllContent/navbar.jsp"%>

		<h1 class="text-center m-4">Add Your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">
						<div class="from-group">

							<%
							UserDetails us = (UserDetails) session.getAttribute("UserD");
							if (us != null) {
							%>
							<input type="hidden" value="<%=us.getId()%>" name="uid">
							<%
							} 
							%>

							<label for="exampleInputEmail1" class="form-label">Enter
								Title</label> <input type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								name="title" required="required">
						</div>
						<br>
						<div class="form-group">
							<label for="exampleInputEmail1" class="form-label">Enter
								Content</label>
							<textarea rows="12" cols="" class="form-control" name="content"
								required="required"></textarea>
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