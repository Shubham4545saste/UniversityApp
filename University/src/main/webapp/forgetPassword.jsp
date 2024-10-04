<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./styles.css">
</head>
<body>

<%
  String s=request.getParameter("error");
%>


<div class="form-container">
<h2>Password Reset</h2>
<%
   if(s!=null)
   {
	   %>
	   <p style="color:red">No Email Found</p>
	   <% 
   }
   %>
<form action="reset-password.jsp" method="post">

<div class="form-group">
<label for="email">Email</label>
<input type="email" id="email" name="email" required>
</div>

<div class="form-buttons">
<button type="submit" class="submit-btn">Reset Password</button>
</div>

<p style="text-align:center">Don't have an account?<a href="index.jsp">Register</a></p>
</form>
</div>
</body>
</html>