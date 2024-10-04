<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course Registration Form</title>
<link rel="stylesheet" href="./styles.css">
</head>
<body>

<div class="form-container">
  <h2>Student Login Form</h2>
  <%
  String e = request.getParameter("error");
  if(e!=null){%>
	  <p style="color:red"><%=e %><p>
		<%  }   %>
		<%
		String m=request.getParameter("msg");
		if(m!=null)
		{
			%>
			<p style="color:green"><%=m %><p>
			<%
		}
		%>
<form action="login.jsp" method="post"> 

<div class="form-group">
<label for="email">Email</label>
            <input type="email" id="email" name="email" required>
  </div>
        
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>
    
      <div class="form-buttons">
            <button type="submit" class="submit-btn">Submit</button>
            <button type="reset" class="reset-btn">Reset</button>
        </div>

 
        <p style="text-align:center">Don't have an account?<a href="index.jsp"> Register</a></p>
        <p style="text-align:center"><a href="forgetPassword.jsp">Forgot Password?</a></p>       
 
</form>
</div>
</body>
</html>