<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="AllContent/allCss.jsp"%>
</head>
<body>
	<%@include file="AllContent/navbar.jsp"%>


	<div class="container-fluid"
		style="background-image: linear-gradient(to right top, #490771, #580979, #670c81, #760e89, #851190); height: 85vh; width: 100%">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center  text-white bg-custom">
						<i class="fa-solid fa-circle-user fa-3x"></i>
						<h4>Login Page</h4>
					</div>



					<%
					String invalidMsg = (String) session.getAttribute("Login-fail");
					if (invalidMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=invalidMsg%></div>

					<%
					session.removeAttribute("Login-fail");
					}
					%>
					<%
					String withoutLogin= (String)session.getAttribute("Login-error");
					if(withoutLogin!=null)
					{%>
						<div class="alert alert-danger" role="alert"><%=withoutLogin%></div>
					<%
					session.removeAttribute("Login-error");
					}
					%>
					
					<%
					 String lgMsg=(String)session.getAttribute("LogoutMsg");
					if(lgMsg!=null)
					{%>
						<div class="alert alert-success" role="alert"><%=lgMsg%></div>
					<%
					session.removeAttribute("LogoutMsg");
					}
					%>


					<div class="card-body">

						<form action="LoginServlet" method="post">

							<label>Enter Email</label>
							<div class="form-group">
								<input type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email">
							</div>
							<br>
							<div class="form-group">
								<label for="exampleInputPassword1"> Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="pass">
							</div>
							<br>


							<button type="submit" class="btn btn-primary w-100 rounded-pill">Login</button>

						</form>
					</div>
				</div>
			</div>
		</div>

	</div>



	<%@include file="AllContent/footer.jsp"%>



</body>
</html>