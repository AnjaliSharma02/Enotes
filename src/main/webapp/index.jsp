<%@page import="java.sql.Connection"%>
<%@page import="Com.Db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="AllContent/allCss.jsp" %>
<style type="text/css">
 .back-img {
    background-image: url('https://images.unsplash.com/photo-1462642109801-4ac2971a3a51?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHBlbnxlbnwwfHwwfHx8MA%3D%3D');
    background-size: cover; /* Ensures the image covers the entire container */
    background-position: center; /* Centers the image */
    background-repeat: no-repeat; /* Prevents image repetition */
    width: 100%;
    height: 90vh; /* Sets the height to 80% of the viewport height */
  }
</style>
</head>
<body>
   <%@include file="AllContent/navbar.jsp" %>
   
 
   
   <div class="container-fluid back-img">
   
      <div class="text-center">
        <h1 class="text-white p-3"><i class="fa-solid fa-book"></i> E Notes - Save Your Notes</h1>
	      <a href="login.jsp" class="btn btn-light"><i class="fa-solid fa-circle-user"></i> Login </a>
	      <a href="register.jsp" class="btn btn-light"><i class="fa-solid fa-user-plus"></i> Register </a>
	  </div>
   
   </div>
   
   
   
   <%@include file="AllContent/footer.jsp" %>
</body>
</html>